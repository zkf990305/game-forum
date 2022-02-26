<template>
  <div class="table">
    <div class="container">
      <div class="handle-box">
        <el-button
          type="primary"
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
          placeholder="筛选相关友链信息"
          class="handle-input mr10"
        ></el-input>
        <el-button
          type="primary"
          size="mini"
          @click="centerDialogVisible = true"
          >添加友链</el-button
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
          label="友链名称"
          prop="name"
          width="120"
          align="center"
        >
        </el-table-column>
        <el-table-column label="友链网址" width="240" align="center">
          <template slot-scope="scope">
            <el-tooltip
              content="跳转友链网站"
              placement="bottom"
              effect="light"
            >
              <el-link
                type="primary"
                :underline="false"
                :href="scope.row.website"
                target="_blank"
              >
                {{ scope.row.website }}
              </el-link>
            </el-tooltip>
          </template>
        </el-table-column>

        <el-table-column label="友链封面图片" width="160" align="center">
          <template slot-scope="scope">
            <img :src="getUrl(scope.row.image)" alt="" style="width: 80px;" />
          </template>
        </el-table-column>
        <el-table-column
          label="加入时间"
          prop="createDate"
          width="240"
          align="center"
        ></el-table-column>

        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)"
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

    <!--添加友链-->
    <el-dialog
      title="添加友链信息"
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
        <el-form-item label="友链名称" prop="name" size="mini">
          <el-input
            v-model="registerForm.name"
            placeholder="友链名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="友链网址" size="mini" prop="website">
          <el-input
            v-model="registerForm.website"
            placeholder="友链网址"
          ></el-input>
        </el-form-item>
        <el-form-item label="友链封面图片" size="mini">
          <el-upload
            class="avatar-uploader"
            :action="uploadUrl()"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
          >
            <img v-if="imageUrl" :src="getUrl(imageUrl)" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
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
      width="1400px"
      height="1550px"
    >
      <el-form :rules="UpdateRules" ref="form" :model="form" label-width="60px">
        <el-form-item label="友链名称" size="mini" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="友链网站" size="mini" prop="website">
          <el-input v-model="form.website"></el-input>
        </el-form-item>
        <el-form-item label="友链封面" size="mini" prop="image">
          <!-- <img :src="getUrl(form.image)" alt="" style="width: 80px;" /> -->
          <el-upload
            class="avatar-uploader"
            :action="uploadUrl()"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
          >
            <img v-if="imageUrl" :src="getUrl(imageUrl)" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
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
  name: "links-page",
  mixins: [mixin],
  BASE_URL: [BASE_URL],
  data() {
    return {
      registerForm: {},
      imageUrl: "",

      UpdateRules: {
        // 自定义校验规则
        name: [{ required: true, message: "请输入友链名称", trigger: "blur" }]
      },
      rules: {
        name: [{ required: true, message: "请输入友链名称", trigger: "blur" }],
        website: [
          { required: true, message: "请输入友链网站", trigger: "blur" }
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
          if (item.name.includes(this.select_word)) {
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
    // 获取友链信息
    getData() {
      this.tableData = [];
      this.tempDate = [];
      HttpManager.getAllLinks().then(res => {
        this.tableData = res.data;
        this.tempDate = res.data;
        this.currentPage = 1;
      });
    },

    // 添加友链
    addPeople() {
      let _this = this;

      this.$refs["registerForm"].validate(valid => {
        if (valid) {
          this.registerForm.image = this.imageUrl;

          HttpManager.setLinks(this.registerForm)
            .then(res => {
              if (res.code === 0) {
                _this.notify("添加成功", "success");
                this.centerDialogVisible = false;
                this.registerForm = {};
                this.imageUrl = "";
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
        name: row.name,
        website: row.website,
        image: row.image
      };
      this.imageUrl = this.form.image;
      this.editVisible = true;
    },
    // 保存编辑
    saveEdit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.image = this.imageUrl;
          // this.form.content = editor.txt.html();
          HttpManager.updateLinksMsg(this.form)
            .then(res => {
              if (res.code === 0) {
                this.getData();
                this.$notify.success({
                  title: "编辑成功",
                  showClose: true
                });

                this.imageUrl = "";
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
      HttpManager.deleteLinks(this.idx)
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
            HttpManager.removeBatchOfLinks(ids).then(res => {
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
        const tHeader = ["友链Id", "友链名称", "友链网址", "加入时间"];
        const filterVal = ["id", "name", "website", "createDate"];
        const list = this.multipleSelection;
        const data = this.formatJson(filterVal, list);
        export_json_to_excel(tHeader, data, "友链信息导出excel");
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
