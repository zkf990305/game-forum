<template>
  <div class="login-in">
    <login-logo />
    <!-- 找回密码 -->
    <el-dialog title="找回密码" :visible.sync="dialogFormVisible">
      <el-form :model="passForm" :rules="passFormRules" ref="passForm">
        <el-form-item prop="email" label="email" :label-width="formLabelWidth">
          <el-input v-model="passForm.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户名" :label-width="formLabelWidth">
          <el-input v-model="passForm.username" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="goRetrievePass">提交</el-button>
      </div>
    </el-dialog>
    <!--  -->
    <div class="login">
      <div class="login-head">
        <span>帐号登录</span>
      </div>
      <el-form
        :model="loginForm"
        status-icon
        :rules="rules"
        ref="loginForm"
        class="demo-ruleForm"
      >
        <el-form-item prop="username">
          <el-input
            placeholder="用户名"
            v-model="loginForm.username"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            show-password
            type="password"
            placeholder="密码"
            v-model="loginForm.password"
            @keyup.enter.native="loginIn"
          ></el-input>
        </el-form-item>
        <el-form-item prop="role">
          <el-radio-group v-model="loginForm.role">
            <el-radio :label="1">超级管理员</el-radio>
            <el-radio :label="2">管理员</el-radio>
            <el-radio :label="3">普通用户</el-radio>
          </el-radio-group>
        </el-form-item>
        <div class="login-btn">
          <el-button @click="goSignUp">注册</el-button>
          <el-button type="primary" @click="handleleLoginIn">登录</el-button>
        </div>
        <!-- TODO 找回密码 -->
        <el-form-item>
          <el-link
            :underline="false"
            style="float: right"
            @click="dialogFormVisible = true"
            >忘记密码? 点此取回</el-link
          >
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import LoginLogo from "../components/LoginLogo";
import { HttpManager } from "../api/index";

export default {
  name: "login-in",
  mixins: [mixin],
  components: {
    LoginLogo
  },
  data: function() {
    let validateName = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("用户名不能为空"));
      } else {
        callback();
      }
    };
    let validatePassword = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        callback();
      }
    };
    return {
      dialogFormVisible: false,
      passForm: {},
      formLabelWidth: "120px",
      passFormRules: {
        email: [
          { required: true, message: "请输入邮箱地址", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ]
      },
      loginForm: {
        // 登录用户名密码
        username: "",
        password: ""
      },
      rules: {
        username: [
          { validator: validateName, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          {
            validator: validatePassword,
            message: "请输入密码",
            trigger: "blur"
          }
        ],
        role: [{ required: true, message: "请选择身份", trigger: "change" }]
      }
    };
  },
  mounted() {
    this.changeIndex("登录");
  },
  methods: {
    changeIndex(value) {
      this.$store.commit("setActiveName", value);
    },
    handleleLoginIn() {
      let _this = this;
      // let params = new URLSearchParams();
      // params.append("username", this.loginForm.username);
      // params.append("password", this.loginForm.password);
      this.$refs["loginForm"].validate(valid => {
        if (valid) {
          console.log(this.loginForm);
          HttpManager.loginIn(this.loginForm)
            .then(res => {
              // console.log('-----------获取登录信息---------------')
              if (res.code === 0) {
                _this.$message({
                  message: "登录成功",
                  type: "success"
                });
                _this.setUserMsg(res.data);
                _this.$store.commit("setLoginIn", true);
                setTimeout(function() {
                  _this.changeIndex("首页");
                  _this.$router.push({ path: "/" });
                  _this.$router.go(0);
                }, 2000);
              } else {
                _this.notify(res.message, "error");
              }
            })
            .catch(failResponse => {});
        }
      });
    },
    setUserMsg(item) {
      this.$store.commit("setUserId", item.id);
      this.$store.commit("setUsername", item.username);
      this.$store.commit("setAvatar", item.avatarUrl);
      this.$store.commit("setUserRole", this.loginForm.role);
    },
    goSignUp() {
      this.$router.push({ path: "/sign-up" });
    },
    goRetrievePass() {
      let _this = this;
      this.$refs["passForm"].validate(valid => {
        if (valid) {
          console.log(this.passForm);
          HttpManager.retrievePass(this.passForm)
            .then(res => {
              if (res.code === 0) {
                _this.$message({
                  message: "发送成功",
                  type: "success"
                });
                this.dialogFormVisible = false;
              } else {
                _this.notify(res.message, "error");
              }
            })
            .catch(failResponse => {});
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/login-in.scss";
</style>
