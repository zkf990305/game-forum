<template>
  <div class="login-container">
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

    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >
      <div class="title-container">
        <h3 class="title">游戏论坛后台管理系统</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <!-- <svg-icon icon-class="user" /> -->
          <i class="el-icon-user-solid"></i>
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="请输入用户名"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>
      <el-form-item prop="password">
        <span class="svg-container">
          <!-- <svg-icon icon-class="password" /> -->
          <i class="el-icon-lock"></i>
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="请输入密码"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <!-- <i :class="passwordType === 'password' ? 'eye' : 'eye-open'" /> -->
          <svg class="icon" aria-hidden="true">
            <use
              :xlink:href="
                passwordType === 'password' ? '#icon-no_eye' : '#icon-eye-open'
              "
            ></use>
          </svg>
        </span>
      </el-form-item>
      <el-form-item prop="role" style="background-color: #ffff">
        角色：
        <el-radio-group v-model="loginForm.role">
          <el-radio :label="1">超级管理员</el-radio>
          <el-radio :label="2">管理员</el-radio>
          <el-radio :label="3">普通用户</el-radio>
        </el-radio-group>
      </el-form-item>

      <div style="display: flex">
        <el-form-item style="width: 70%">
          <span class="svg-container">
            <!-- <svg-icon icon-class="check-circle" /> -->
            <i class="el-icon-circle-check"></i>
          </span>
          <el-input
            v-model="loginForm.validCode"
            placeholder="请输入验证码"
          ></el-input>
        </el-form-item>
        <ValidCode @input="createValidCode" />
      </div>

      <el-checkbox v-model="rememberMe" style="margin: 0px 0px 25px 0px"
        >记住密码</el-checkbox
      >
      <!-- TODO 找回密码 -->

      <el-link
        :underline="false"
        style="float: right"
        @click="dialogFormVisible = true"
        >忘记密码? 点此取回</el-link
      >

      <el-form-item style="width: 100%">
        <el-button
          :loading="loading"
          type="primary"
          style="width: 100%; "
          @click.native.prevent="handleLogin"
        >
          <span v-if="!loading">登 录</span>
          <span v-else>登 录 中...</span>
        </el-button>

        <!-- 注册 -->
        <!-- <div style="float: right" v-if="">
          <router-link class="link-type" :to="'/register'"
            >立即注册</router-link
          >
        </div> -->
      </el-form-item>

      <!-- <div class="tips">
        <span style="margin-right: 20px">username: admin</span>
        <span> password: any</span>
      </div> -->
    </el-form>
  </div>
</template>

<script>
// import { validUsername } from "@/utils/validate";
import Cookies from "js-cookie";
import ValidCode from "@/components/ValidCode.vue";
import { HttpManager } from "../api/index";
import mixin from "../mixins";
import { ICON } from "../assets/icon/index";

export default {
  name: "Login",
  mixins: [mixin],
  components: {
    ValidCode
  },
  data() {
    icon_404: ICON.ZANTING;
    // const validateUsername = (rule, value, callback) => {
    //   if (!validUsername(value)) {
    //     callback(new Error("请输入正确的用户名"));
    //   } else {
    //     callback();
    //   }
    // };
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error("密码不能小于6位"));
      } else {
        callback();
      }
    };
    return {
      // 找回密码
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
        username: "",
        password: ""
        // rememberMe: false
      },
      rememberMe: false,
      loginRules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          { required: true, trigger: "blur", validator: validatePassword }
        ],
        role: [{ required: true, message: "请选择身份", trigger: "change" }]
      },
      loading: false,
      passwordType: "password",
      redirect: undefined
    };
  },
  // watch: {
  //   $route: {
  //     handler: function(route) {
  //       this.redirect = route.query && route.query.redirect;
  //     },
  //     immediate: true
  //   }
  // },
  created() {
    // this.getCode();
    // 获取记住密码
    this.getCookie();
  },
  mounted() {
    this.changeIndex("登录");
  },
  methods: {
    changeIndex(value) {
      this.$store.commit("setActiveName", value);
    },
    // 接收验证码组件提交的 4位验证码
    createValidCode(data) {
      this.validCode = data;
    },
    // 记住密码
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get("rememberMe");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password:
          // password === undefined ? this.loginForm.password : decrypt(password),
          password === undefined ? this.loginForm.password : password,
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    // 显示密码
    showPwd() {
      if (this.passwordType === "password") {
        this.passwordType = "";
      } else {
        this.passwordType = "password";
      }
      this.$nextTick(() => {
        this.$refs.password.focus();
      });
    },
    // 登录
    handleLogin() {
      let _this = this;
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          if (!this.loginForm.validCode) {
            this.$message.error("请填写验证码");
            return;
          }
          this.loading = true;

          if (this.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            // Cookies.set("password", encrypt(this.loginForm.password), {
            //   expires: 30,
            // });
            Cookies.set("password", this.loginForm.password, {
              expires: 30
            });
            Cookies.set("rememberMe", this.rememberMe, {
              expires: 30
            });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove("rememberMe");
          }

          HttpManager.getLoginStatus(this.loginForm).then(res => {
            if (res.code === 0) {
              _this.$message({
                message: "登录成功",
                type: "success"
              });
              _this.setUserMsg(res.data);
              _this.$store.commit("setLoginIn", true);
              setTimeout(function() {
                _this.changeIndex("首页");
                _this.$router.push("/Info");
                _this.notify("欢迎回来", "success");

                // _this.$router.push({ path: "/" });
                // _this.$router.go(0);
              }, 2000);
            } else {
              this.notify(res.message, "error");
            }
            this.loading = false;
          });

          // this.$store
          //   .dispatch("user/login", this.loginForm)
          //   .then(() => {
          //     this.$router.push({ path: this.redirect || "/" });
          //     this.loading = false;
          //   })
          //   .catch(() => {
          //     this.loading = false;
          //   });
        } else {
          return false;
        }
      });
    },
    setUserMsg(item) {
      this.$store.commit("setUserId", item.id);
      this.$store.commit("setUsername", item.username);
      this.$store.commit("setAvatar", item.avatarUrl);
    },
    goRetrievePass() {
      let _this = this;
      this.$refs["passForm"].validate(valid => {
        if (valid) {
          HttpManager.retrievePass(this.passForm)
            .then(res => {
              if (res.code === 0) {
                this.dialogFormVisible = false;
                _this.$message({
                  message: "发送成功",
                  type: "success"
                });
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

<style lang="scss">
/* 修复input 背景不协调 和光标变色 */
/* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

$bg: #283443;
$light_gray: #fff;
$cursor: #fff;

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

/* reset element-ui css */
.login-container {
  .el-input {
    display: inline-block;
    height: 38px;
    width: 85%;
    input {
      background: transparent;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 15px;
      color: #707070;
      height: 38px;
      caret-color: red;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px #e5e7e4 inset !important;
        -webkit-text-fill-color: #707070 !important;
      }
    }
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    color: #454545;
  }
}
</style>

<style lang="scss" scoped>
$dark_gray: #889aa4;
$light_gray: #eee;

.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100%;
  width: 100%;
  background-image: linear-gradient(
    to right,
    #eea2a2 0%,
    #bbc1bf 19%,
    #57c6e1 42%,
    #b49fda 79%,
    #7ac5d8 100%
  );
  overflow: hidden;

  .login-form {
    border-radius: 6px;
    background: #ffffff;
    padding: 25px 25px 5px 25px;
    position: relative;
    width: 520px;
    max-width: 100%;
    // padding: 160px 35px 0;
    margin: 0 auto;
    overflow: hidden;
  }

  .svg-container {
    padding: 5px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .title-container {
    position: relative;

    .title {
      // font-size: 26px;
      // color: $light_gray;
      text-align: center;
      font-weight: bold;
      margin: 0px auto 30px auto;
      text-align: center;
      color: #707070;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }
}
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}
</style>
