<template>
  <div class="signUp-page">
    <loginLogo />
    <div class="signUp">
      <div class="signUp-head">
        <span>用户注册</span>
      </div>

      <el-form
        :model="registerForm"
        status-icon
        :rules="rules"
        ref="registerForm"
        label-width="90px"
        class="demo-ruleForm"
      >
        <el-form-item prop="username" label="用户名">
          <el-input
            v-model="registerForm.username"
            placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input
            show-password
            type="password"
            placeholder="请输入密码"
            v-model="registerForm.password"
          ></el-input>
        </el-form-item>

        <el-form-item prop="rePassword" label="确认密码">
          <el-input
            show-password
            type="password"
            placeholder="请再次输入密码"
            v-model="registerForm.rePassword"
          ></el-input>
        </el-form-item>

        <el-form-item prop="email" label="邮箱">
          <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
        </el-form-item>

        <el-form-item prop="gender" label="性别">
          <el-radio-group v-model="registerForm.gender">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item prop="birthday" label="生日">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="registerForm.birthday"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>

        <div class="login-btn">
          <el-button @click="goback(-1)">取消</el-button>
          <el-button type="primary" @click="SignUp">快速注册</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import loginLogo from "../components/LoginLogo";
import { rules } from "../assets/data/form";
import { HttpManager } from "../api/index";

export default {
  name: "SignUp-page",
  mixins: [mixin],
  components: {
    loginLogo
  },
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
        // phoneNum: [{ essage: "请选择日期", trigger: "blur" }],
        email: [
          { message: "请输入邮箱地址", trigger: "blur" },
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
      }
    };
  },
  methods: {
    SignUp() {
      let _this = this;
      // if (this.registerForm.password !== this.registerForm.rePassword) {
      //   _this.notify("两次密码输入不一致", "error");
      //   return;
      // }

      this.$refs["registerForm"].validate(valid => {
        if (valid) {
          console.log(this.registerForm);
          // // 日期格式转换
          // let d = this.registerForm.birthday;
          // let datetime =
          //   d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
          // // this.registerForm.birthday = datetime;
          // console.log(datetime);

          HttpManager.SignUp(this.registerForm)
            .then(res => {
              console.log(res);
              if (res.code === 0) {
                _this.notify("注册成功，可以登录系统！", "success");
                setTimeout(function() {
                  _this.$router.push({ path: "/login-in" });
                }, 2000);
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
    goback(index) {
      this.$router.go(index);
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/sign-up.scss";
</style>
