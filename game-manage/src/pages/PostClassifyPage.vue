<template>
  <div class="table">
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
          placeholder="筛选相关帖子分类信息"
          class="handle-input mr10"
        ></el-input>
        <el-button
          type="primary"
          size="mini"
          @click="centerDialogVisible = true"
          >添加帖子分类</el-button
        >
      </div>
      <el-table
        :data="data"
        border
        size="mini"
        style="width: 100%"
        ref="multipleTable"
        max-height="450"
        @selection-change="handleSelectionChange"
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
          width="80"
          align="center"
        >
        </el-table-column>
        <el-table-column
          label="帖子分类名称"
          prop="classify"
          width="150"
          align="center"
        >
        </el-table-column>

        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button size="mini" type="success" @click="handleEdit(scope.row)"
              >编辑</el-button
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

    <!--添加帖子分类-->
    <el-dialog
      title="添加帖子分类信息"
      :visible.sync="centerDialogVisible"
      width="440px"
      height="1550px"
      center
    >
      <el-form
        :model="registerForm"
        status-icon
        :rules="rules"
        ref="registerForm"
        label-width="70px"
        class="demo-ruleForm"
      >
        <el-form-item label="帖子分类名称" prop="classify" size="mini">
          <el-input
            v-model="registerForm.classify"
            placeholder="帖子分类名称"
          ></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="centerDialogVisible = false"
          >取 消</el-button
        >
        <el-button type="primary" size="mini" @click="addPeople"
          >确 定</el-button
        >
      </span>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog
      title="编辑"
      :visible.sync="editVisible"
      width="300px"
      height="200px"
    >
      <el-form :rules="UpdateRules" ref="form" :model="form" label-width="60px">
        <el-form-item label="帖子分类名称" size="mini" prop="classify">
          <el-input v-model="form.classify"></el-input>
        </el-form-item>
      </el-form>
      <!-- <div id="div2">
        <div v-html="form.content"></div>
      </div> -->
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
  name: "post-classify-page",
  mixins: [mixin],
  BASE_URL: [BASE_URL],
  data() {
    return {
      registerForm: {},

      UpdateRules: {
        // 自定义校验规则
        classify: [
          { required: true, message: "请输入帖子分类名称", trigger: "blur" }
        ]
      },
      rules: {
        classify: [
          { required: true, message: "请输入帖子分类名称", trigger: "blur" }
        ]
      },
      tableData: [], // 记录用户信息，用于显示
      tempDate: [], // 记录用户信息，用于搜索时能临时记录一份用户信息
      is_search: false,
      multipleSelection: [], // 记录要删除的用户信息
      centerDialogVisible: false,
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

    ...mapGetters(["userId", "avatar", "username", "loginIn"])
  },
  watch: {
    select_word: function() {
      if (this.select_word === "") {
        this.tableData = this.tempDate;
      } else {
        this.tableData = [];
        for (let item of this.tempDate) {
          if (item.classify.includes(this.select_word)) {
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
    // 获取帖子分类信息
    getData() {
      this.tableData = [];
      this.tempDate = [];
      HttpManager.getAllPostClassify().then(res => {
        this.tableData = res.data;
        this.tempDate = res.data;
        this.currentPage = 1;
      });
    },

    // 添加帖子分类
    addPeople() {
      let _this = this;

      this.$refs["registerForm"].validate(valid => {
        if (valid) {
          HttpManager.setPostClassify(this.registerForm)
            .then(res => {
              if (res.code === 0) {
                _this.notify("添加成功", "success");
                this.centerDialogVisible = false;
                this.registerForm = {};
                _this.getData();
              } else {
                _this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      });
    },
    // 编辑
    handleEdit(row) {
      this.idx = row.id;
      this.form = {
        id: row.id,
        classify: row.classify
      };
      this.editVisible = true;
    },
    // 保存编辑
    saveEdit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          HttpManager.updatePostClassify(this.form)
            .then(res => {
              if (res.code === 0) {
                this.getData();
                this.$notify.success({
                  title: "修改分类成功",
                  showClose: true
                });
              } else {
                this.$notify.error({
                  title: res.message,
                  showClose: true
                });
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      });

      this.editVisible = false;
    },

    // 确定删除
    deleteRow() {
      HttpManager.deletePostClassify(this.idx)
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
            HttpManager.removeBatchOfPostClassify(ids).then(res => {
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

    exportToExcel() {
      //excel数据导出
      require.ensure([], () => {
        const {
          export_json_to_excel
        } = require("@/assets/js/excel/Export2Excel");
        const tHeader = ["帖子分类Id", "帖子分类名称"];
        const filterVal = ["id", "classify"];
        const list = this.multipleSelection;
        const data = this.formatJson(filterVal, list);
        export_json_to_excel(tHeader, data, "帖子分类信息导出excel");
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
