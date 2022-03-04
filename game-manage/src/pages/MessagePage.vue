<template>
  <div class="table">
    <div class="container">
      <div class="handle-box">
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
          placeholder="筛选相关留言"
          class="handle-input mr10"
        ></el-input>
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
          width="300"
          align="center"
        ></el-table-column>
        <el-table-column
          label="留言人姓名"
          prop="name"
          width="300"
          align="center"
        ></el-table-column>
        <el-table-column
          label="手机号"
          prop="phone"
          width="300"
          align="center"
        ></el-table-column>
        <el-table-column
          label="留言内容"
          prop="content"
          width="300"
          align="center"
        ></el-table-column>

        <el-table-column label="操作" fixed="right" width="160" align="center">
          <template slot-scope="scope">
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
import E from "wangeditor";
import { HttpManager } from "../api/index";
let editor;
// let editor;
export default {
  name: "message-page",
  mixins: [mixin],
  BASE_URL: [BASE_URL],
  data() {
    return {
      registerForm: {},

      UpdateRules: {
        // 自定义校验规则
        nickname: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 3, max: 16, message: "长度在 3 到 16 个字符", trigger: "blur" }
        ],
        gender: [{ required: true, message: "请选择性别", trigger: "change" }],
        email: [
          { required: true, message: "请输入邮箱地址", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        birthday: [
          {
            required: true,
            type: "date",
            message: "请选择日期",
            trigger: "blur"
          }
        ]
      },
      rules: {
        title: [{ required: true, message: "请输入标题", trigger: "blur" }]
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

    // 获取留言信息
    getData() {
      this.tableData = [];
      this.tempDate = [];
      HttpManager.getAllMessage().then(res => {
        this.tableData = res.data;
        this.tempDate = res.data;
        this.currentPage = 1;
      });
    },
    load() {
      editor = new E("#div1");
      editor.config.zIndex = 5;
      // 设置编辑区域高度为 500px
      editor.config.height = 900;

      // 配置颜色（文字颜色、背景色）
      editor.config.colors = ["#000000", "#eeece0", "#1c487f", "#4d80bf"];
      // 配置 server 接口地址
      editor.config.uploadImgServer = BASE_URL + "/files/editor/upload";
      // 设置上传参数名称
      editor.config.uploadFileName = "file";
      // 限制大小
      editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M
      editor.config.uploadImgMaxLength = 5; // 一次最多上传 5 个图片
      editor.config.uploadImgHooks = {
        // 上传图片之前
        before: function(xhr) {
          // console.log(xhr);
          // 可阻止图片上传
          // return {
          //   prevent: true,
          //   msg: "需要提示给用户的错误信息"
          // };
        },
        // 图片上传并返回了结果，图片插入已成功
        success: function(xhr) {
          console.log("success", xhr, "上传成功");
        },
        // 图片上传并返回了结果，但图片插入时出错了
        fail: function(xhr, editor, resData) {
          console.log("上传失败,原因是", "fail", resData);
        },
        // 上传图片出错，一般为 http 请求的错误
        error: function(xhr, editor, resData) {
          console.log("error", xhr, resData, "上传出错");
        },
        // 上传图片超时
        timeout: function(xhr) {
          console.log("timeout", "上传超时");
        }
      };
      editor.create();
    },
    load1() {
      editor = new E("#div2");
      editor.config.zIndex = 5;
      // 设置编辑区域高度为 500px
      editor.config.height = 900;

      // 配置颜色（文字颜色、背景色）
      editor.config.colors = ["#000000", "#eeece0", "#1c487f", "#4d80bf"];
      // 配置 server 接口地址
      editor.config.uploadImgServer = BASE_URL + "/files/editor/upload";
      // 设置上传参数名称
      editor.config.uploadFileName = "file";
      // 限制大小
      editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M
      editor.config.uploadImgMaxLength = 5; // 一次最多上传 5 个图片
      editor.config.uploadImgHooks = {
        // 上传图片之前
        before: function(xhr) {
          // console.log(xhr);
          // 可阻止图片上传
          // return {
          //   prevent: true,
          //   msg: "需要提示给用户的错误信息"
          // };
        },
        // 图片上传并返回了结果，图片插入已成功
        success: function(xhr) {
          console.log("success", xhr, "上传成功");
        },
        // 图片上传并返回了结果，但图片插入时出错了
        fail: function(xhr, editor, resData) {
          console.log("上传失败,原因是", "fail", resData);
        },
        // 上传图片出错，一般为 http 请求的错误
        error: function(xhr, editor, resData) {
          console.log("error", xhr, resData, "上传出错");
        },
        // 上传图片超时
        timeout: function(xhr) {
          console.log("timeout", "上传超时");
        }
      };

      editor.create();
    },

    // 确定删除
    deleteRow() {
      HttpManager.deleteMessage(this.idx)
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

    exportToExcel() {
      //excel数据导出
      require.ensure([], () => {
        const {
          export_json_to_excel
        } = require("@/assets/js/excel/Export2Excel");
        const tHeader = ["留言人姓名", "手机号", "留言内容"];
        const filterVal = ["name", "phone", "content"];
        const list = this.multipleSelection;
        const data = this.formatJson(filterVal, list);
        export_json_to_excel(tHeader, data, "留言信息导出excel");
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    }
  }
};
</script>

<style scoped>
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
