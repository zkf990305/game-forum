<template>
  <div class="table">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-tickets"></i> 评论信息
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button
          type="danger"
          size="mini"
          class="handle-del mr10"
          @click="delAll"
          >批量删除</el-button
        >
        <el-button
          type="primary"
          size="mini"
          icon="document"
          class="handle-del mr10"
          @click="exportToExcel()"
          >导出excel</el-button
        >
        <el-input
          v-model="select_word"
          size="mini"
          placeholder="筛选相关评论内容信息"
          class="handle-input mr10"
        ></el-input>
      </div>
      <el-table
        :data="data"
        border
        size="mini"
        style="width: 100%"
        ref="multipleTable"
        max-height="650"
        @selection-change="handleSelectionChange"
        :default-sort="{ prop: 'status' }"
      >
        <el-table-column
          type="selection"
          width="40"
          align="center"
        ></el-table-column>
        <el-table-column
          label="ID"
          prop="id"
          sortable
          width="120"
          align="center"
        >
        </el-table-column>
        <el-table-column
          label="评论者编号"
          prop="uid"
          width="240"
          align="center"
        >
        </el-table-column>
        <el-table-column
          label="评论内容"
          prop="content"
          width="240"
          align="center"
        >
          <template slot-scope="scope">
            <el-popover trigger="hover" placement="top">
              <p>评论内容: {{ scope.row.content }}</p>
              <div slot="reference" class="name-wrapper">
                <i class="el-icon-tickets"></i>
                <el-tag size="medium">{{ scope.row.content }}</el-tag>
              </div>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column
          label="评论时间"
          prop="gmtCreate"
          width="240"
          align="center"
        ></el-table-column>
        <el-table-column
          label="是否被点赞"
          prop="like"
          width="120"
          align="center"
        >
          <template slot-scope="scope">
            <div v-if="scope.row.like > 0">
              <el-tag>已点赞</el-tag>
            </div>
            <div v-else-if="scope.row.like === 0">
              <el-tag type="danger">未点赞</el-tag>
            </div>
          </template>
        </el-table-column>
        <el-table-column
          label="状态"
          width="120"
          prop="status"
          align="center"
          sortable
        >
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.status"
              :active-value="1"
              :inactive-value="0"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="handleStatusChange(scope.row)"
            ></el-switch>
          </template>
        </el-table-column>

        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button type="success" size="mini" @click="handleEdit(scope.row)"
              >详情</el-button
            >
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.id)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @current-change="handleCurrentChange"
          background
          layout="total, prev, pager, next"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="tableData.length"
        >
        </el-pagination>
      </div>
    </div>

    <!-- 编辑弹出框 -->
    <el-dialog title="评论" :visible.sync="editVisible">
      <div v-html="form.content"></div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="editVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="saveEdit"
          >确 定</el-button
        >
      </span>
    </el-dialog>

    <!-- 删除提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">
        删除不可恢复，是否确定删除？
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button size="mini" type="primary" @click="deleteRow"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { BASE_URL } from "../api/config";
import { HttpManager } from "../api/index";

export default {
  name: "comment-page",
  mixins: [mixin],
  BASE_URL: [BASE_URL],
  data() {
    return {
      registerForm: {},
      imageUrl: "",

      UpdateRules: {
        // 自定义校验规则
        name: [{ required: true, message: "请输入评论名称", trigger: "blur" }]
      },
      rules: {
        name: [{ required: true, message: "请输入评论名称", trigger: "blur" }],
        website: [
          { required: true, message: "请输入评论网站", trigger: "blur" }
        ]
      },
      tableData: [], // 记录用户信息，用于显示
      tempDate: [], // 记录用户信息，用于搜索时能临时记录一份用户信息
      is_search: false,
      multipleSelection: [], // 记录要删除的用户信息
      // centerDialogVisible: false,
      editVisible: false, // 显示编辑框
      delVisible: false, // 显示删除框
      select_word: "", // 记录输入框输入的内容
      form: {},
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1 // 记录当前点中的行
    };
  },
  computed: {
    // 计算当前表格中的数据
    data() {
      return this.tableData.slice(
        (this.currentPage - 1) * this.pageSize,
        this.currentPage * this.pageSize
      );
    },

    ...mapGetters(["userId", "avatar", "username", "loginIn", "userRole"])
  },
  watch: {
    select_word: function() {
      if (this.select_word === "") {
        this.tableData = this.tempDate;
      } else {
        this.tableData = [];
        for (let item of this.tempDate) {
          if (item.content.includes(this.select_word)) {
            this.tableData.push(item);
          }
        }
      }
    }
  },
  created() {
    this.getData();
  },

  methods: {
    // 获取当前页
    handleCurrentChange(val) {
      this.currentPage = val;
    },
    uploadUrl() {
      return `${this.$store.state.configure.HOST}/gf-links/upload/avatar/update`;
      // return `${this.$store.state.HOST}/user/avatar/update?id=${id}`;
    },
    // 获取评论信息
    getData() {
      this.tableData = [];
      this.tempDate = [];

      if (this.userRole == 3) {
        HttpManager.getCommentOfMe(this.userId).then(res => {
          this.tableData = res.data;
          this.tempDate = res.data;
          this.currentPage = 1;
        });
        return;
      }
      HttpManager.getAllComment().then(res => {
        this.tableData = res.data;
        this.tempDate = res.data;
        this.currentPage = 1;
      });
    },
    // 角色状态修改
    handleStatusChange(row) {
      let text = row.status === 1 ? "审核" : "停用";
      this.$confirm("确认要" + text + "评论吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          var formData = {};
          formData.id = row.id;
          formData.status = row.status;
          HttpManager.changeCommentStatus(formData).then(res => {
            if (res.code === 0) {
              this.notify(text + "成功", "success");
            } else {
              this.notify(text + "失败", "error");
            }
          });
        })
        .catch(() => {
          row.status = row.status === 0 ? 1 : 0;
        });
    },

    // 编辑
    handleEdit(row) {
      this.idx = row.id;
      this.form = {
        content: row.content
      };
      this.editVisible = true;
    },
    // 保存编辑
    saveEdit() {
      this.editVisible = false;
    },

    // 确定删除
    deleteRow() {
      HttpManager.deleteComment(this.idx)
        .then(res => {
          if (res.code === 0) {
            this.getData();
            this.notify("删除成功", "success");
          } else {
            this.notify("删除失败", "error");
          }
        })
        .catch(failResponse => {});
      this.delVisible = false;
    },
    delAll() {
      var ids = new Array();
      if (this.multipleSelection.length == 0)
        this.$message.error("请先至少选择一项");
      else {
        this.multipleSelection.forEach(element => {
          ids.push(element.id);
        });

        this.$confirm("确定要删除选中的文件吗?", "提示")
          .then(() => {
            HttpManager.removeBatchOfComment(ids).then(res => {
              if (res.code === 0) {
                this.getData();
                this.notify("删除成功", "success");
              } else {
                this.notify("删除失败", "success");
              }
            });
          })
          .catch(() => {});
      }
    },
    // 上传
    handleAvatarSuccess(res, file) {
      this.imageUrl = res.data;
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },

    exportToExcel() {
      //excel数据导出
      require.ensure([], () => {
        const {
          export_json_to_excel
        } = require("@/assets/js/excel/Export2Excel");
        const tHeader = ["评论Id", "评论者编号", "评论内容", "评论时间"];
        const filterVal = ["id", "uid", "content", "gmtCreate"];
        const list = this.multipleSelection;
        const data = this.formatJson(filterVal, list);
        export_json_to_excel(tHeader, data, "评论信息导出excel");
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    }
  }
};
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}

.handle-box {
  margin-bottom: 20px;
  font-size: 12px;
}

.handle-input {
  width: 300px;
  display: inline-block;
}

.pagination {
  display: flex;
  justify-content: center;
}
</style>
