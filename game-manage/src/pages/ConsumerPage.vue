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
          placeholder="筛选相关用户"
          class="handle-input mr10"
        ></el-input>
        <el-button
          type="primary"
          size="mini"
          @click="centerDialogVisible = true"
          >添加新用户</el-button
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
        <el-table-column label="用户头像" width="102" align="center">
          <template slot-scope="scope">
            <img
              :src="getUrl(scope.row.avatarUrl)"
              alt=""
              style="width: 80px;"
            />
            <el-upload
              class="upload-demo"
              :action="uploadUrl(scope.row.uid)"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
            >
              <el-button size="mini">更新图片</el-button>
            </el-upload>
          </template>
        </el-table-column>
        <el-table-column
          label="用户名"
          prop="username"
          width="80"
          align="center"
        ></el-table-column>
        <el-table-column
          label="真实姓名"
          prop="realName"
          width="80"
          align="center"
        ></el-table-column>
        <el-table-column
          label="密码"
          prop="password"
          width="240"
          align="center"
        ></el-table-column>
        <el-table-column label="性别" width="50" align="center">
          <template slot-scope="scope">
            <div>{{ changeSex(scope.row.gender) }}</div>
          </template>
        </el-table-column>
        <el-table-column
          label="手机号码"
          prop="phone"
          width="120"
          align="center"
        ></el-table-column>
        <el-table-column
          label="邮箱"
          prop="email"
          width="120"
          align="center"
        ></el-table-column>
        <el-table-column
          label="qq"
          prop="qq"
          width="80"
          align="center"
        ></el-table-column>
        <el-table-column
          label="微信"
          prop="weChat"
          width="80"
          align="center"
        ></el-table-column>
        <el-table-column label="生日" width="120" align="center">
          <template slot-scope="scope">
            <div>{{ scope.row.birthday }}</div>
          </template>
        </el-table-column>
        <el-table-column
          prop="intro"
          label="签名"
          align="center"
        ></el-table-column>
        <el-table-column
          prop="address"
          label="地区"
          width="80"
          align="center"
        ></el-table-column>
        <el-table-column label="状态" align="center">
          <template slot-scope="scope">
            <div>{{ changeStatus(scope.row.status) }}</div>
          </template>
        </el-table-column>
        <el-table-column label="身份" align="center">
          <template slot-scope="scope">
            <div>
              {{ changeRole(scope.row.role) }}
              <el-button size="mini">更新角色</el-button>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)"
              >编辑</el-button
            >
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.uid)"
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

    <!--添加新用户-->
    <el-dialog
      title="添加用户"
      :visible.sync="centerDialogVisible"
      width="400px"
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
        <el-form-item label="用户名" prop="username" size="mini">
          <el-input
            v-model="registerForm.username"
            placeholder="用户名"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password" size="mini">
          <el-input
            show-password
            type="password"
            placeholder="密码"
            v-model="registerForm.password"
          ></el-input>
        </el-form-item>
        <el-form-item prop="rePassword" label="确认密码" size="mini">
          <el-input
            show-password
            type="password"
            placeholder="请再次输入密码"
            v-model="registerForm.rePassword"
          ></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini">
          <el-radio-group v-model="registerForm.gender">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="手机" prop="phone" size="mini">
          <el-input placeholder="手机" v-model="registerForm.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email" size="mini">
          <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birthday" size="mini">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="registerForm.birthday"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="签名" prop="intro" size="mini">
          <el-input
            type="textarea"
            placeholder="签名"
            v-model="registerForm.intro"
          ></el-input>
        </el-form-item>
        <el-form-item label="地区" prop="address" size="mini">
          <el-select v-model="registerForm.address" placeholder="地区">
            <el-option
              v-for="item in cities"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
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
    <el-dialog title="编辑" :visible.sync="editVisible" width="400px">
      <el-form :rules="UpdateRules" ref="form" :model="form" label-width="60px">
        <el-form-item label="用户名" size="mini" prop="nickname">
          <el-input v-model="form.nickname" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="真实姓名" size="mini" prop="realName">
          <el-input v-model="form.realName"></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini" prop="gender">
          <el-radio-group v-model="form.gender">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="手机" size="mini" prop="phone">
          <el-input v-model="form.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" size="mini" prop="email">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birthday" size="mini">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="form.birthday"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="签名" size="mini" prop="intro">
          <el-input v-model="form.intro"></el-input>
        </el-form-item>
        <el-form-item label="地区" size="mini" prop="address">
          <el-input v-model="form.address"></el-input>
        </el-form-item>
      </el-form>
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
import { HttpManager } from "../api/index";

export default {
  name: "consumer-page",
  mixins: [mixin],
  data() {
    // 自定义校验规则
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registerForm.rePassword !== "") {
          this.$refs.registerForm.validateField("rePassword");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      registerForm: {},
      cities: [
        {
          value: "北京",
          label: "北京"
        },
        {
          value: "天津",
          label: "天津"
        },
        {
          value: "河北",
          label: "河北"
        },
        {
          value: "山西",
          label: "山西"
        },
        {
          value: "内蒙古",
          label: "内蒙古"
        },
        {
          value: "辽宁",
          label: "辽宁"
        },
        {
          value: "吉林",
          label: "吉林"
        },
        {
          value: "黑龙江",
          label: "黑龙江"
        },
        {
          value: "上海",
          label: "上海"
        },
        {
          value: "江苏",
          label: "江苏"
        },
        {
          value: "浙江",
          label: "浙江"
        },
        {
          value: "安徽",
          label: "安徽"
        },
        {
          value: "福建",
          label: "福建"
        },
        {
          value: "江西",
          label: "江西"
        },
        {
          value: "山东",
          label: "山东"
        },
        {
          value: "河南",
          label: "河南"
        },
        {
          value: "湖北",
          label: "湖北"
        },
        {
          value: "湖南",
          label: "湖南"
        },
        {
          value: "广东",
          label: "广东"
        },
        {
          value: "广西",
          label: "广西"
        },
        {
          value: "海南",
          label: "海南"
        },
        {
          value: "重庆",
          label: "重庆"
        },
        {
          value: "四川",
          label: "四川"
        },
        {
          value: "贵州",
          label: "贵州"
        },
        {
          value: "云南",
          label: "云南"
        },
        {
          value: "西藏",
          label: "西藏"
        },
        {
          value: "陕西",
          label: "陕西"
        },
        {
          value: "甘肃",
          label: "甘肃"
        },
        {
          value: "青海",
          label: "青海"
        },
        {
          value: "宁夏",
          label: "宁夏"
        },
        {
          value: "新疆",
          label: "新疆"
        },
        {
          value: "香港",
          label: "香港"
        },
        {
          value: "澳门",
          label: "澳门"
        },
        {
          value: "台湾",
          label: "台湾"
        }
      ],
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
        username: [
          { required: true, message: "请选择用户名", trigger: "blur" },
          { min: 3, max: 16, message: "长度在 3 到 16 个字符", trigger: "blur" }
        ],
        password: [
          {
            required: true,
            validator: validatePass,
            trigger: "blur"
          },
          {
            min: 8,
            max: 20,
            message: "长度在 8 到 20 个字符",
            trigger: "blur"
          },
          {
            pattern: /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[._~!@#$^&*])/,
            message: "密码不符合规范,字母+数字+字符[._~!@#$^&*]",
            trigger: "blur"
          }
        ],
        rePassword: [
          {
            required: true,
            validator: validatePass2,
            trigger: "blur"
          }
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
        ],
        intro: [{ message: "请输入介绍", trigger: "blur" }],
        address: [{ message: "请输入地区", trigger: "change" }]
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
    }
  },
  watch: {
    select_word: function() {
      if (this.select_word === "") {
        this.tableData = this.tempDate;
      } else {
        this.tableData = [];
        for (let item of this.tempDate) {
          if (item.username.includes(this.select_word)) {
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
    uploadUrl(id) {
      return `${this.$store.state.configure.HOST}/gf-user/upload/avatar/update?id=${id}`;
      // return `${this.$store.state.HOST}/user/avatar/update?id=${id}`;
    },
    handleAvatarSuccess(res, file) {
      if (res.code === 0) {
        // this.imageUrl = URL.createObjectURL(file.raw);
        this.getData();
        this.$message({
          message: "修改成功",
          type: "success"
        });
        // this.$router.push("/Consumer");
      } else {
        this.notify(res.message, "error");
      }
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 10;
      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 10MB!");
      }
      return isJPG && isLt2M;
    },
    // 获取用户信息
    getData() {
      this.tableData = [];
      this.tempDate = [];
      HttpManager.getAllUser().then(res => {
        this.tableData = res.data;
        this.tempDate = res.data;
        this.currentPage = 1;
      });
    },
    // getCollect(id) {
    //   this.$router.push({ path: "/collect", query: { id } });
    // },
    // 添加用户
    addPeople() {
      let _this = this;
      this.$refs["registerForm"].validate(valid => {
        if (valid) {
          HttpManager.setUser(this.registerForm)
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
      this.idx = row.uid;
      this.form = {
        id: row.id,
        nickname: row.username,
        realName: row.realName,
        gender: row.gender,
        phone: row.phone,
        email: row.email,
        birthday: row.birthday,
        intro: row.intro,
        address: row.address
      };
      this.editVisible = true;
    },

    // 保存编辑
    saveEdit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          HttpManager.updateUserMsg(this.form)
            .then(res => {
              if (res.code === 0) {
                // this.showError = false;
                // this.showSuccess = true;
                // this.$store.commit("setUsername", this.MyForm.nickname);
                this.getData();
                this.editVisible = false;
                this.$notify.success({
                  title: "编辑成功",
                  showClose: true
                });

                // setTimeout(function() {
                //   this.$router.go(-1);
                // }, 2000);
              } else {
                // this.showSuccess = false;
                // this.showError = true;
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
    },

    // 确定删除
    deleteRow() {
      HttpManager.deleteUser(this.idx)
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
          ids.push(element.uid);
        });

        this.$confirm("确定要删除选中的文件吗?", "提示")
          .then(() => {
            HttpManager.removeBatch(ids).then(res => {
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
        const tHeader = [
          "用户名",
          "真实姓名",
          "密码",
          "性别",
          "手机号码",
          "邮箱",
          "QQ",
          "微信",
          "生日",
          "签名",
          "地区"
        ];
        const filterVal = [
          "username",
          "realName",
          "password",
          "gender",
          "phone",
          "email",
          "qq",
          "weChat",
          "birthday",
          "intro",
          "address"
        ];
        const list = this.multipleSelection;
        const data = this.formatJson(filterVal, list);
        export_json_to_excel(tHeader, data, "用户信息导出excel");
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
