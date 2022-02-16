<template>
  <div class="info">
    <p class="title">编辑个人资料</p>
    <hr />
    <div class="personal">
      <el-form
        :model="MyForm"
        :rules="rules"
        ref="MyForm"
        class="demo-ruleForm"
        label-width="80px"
      >
        <el-form-item prop="nickname" label="用户昵称">
          <el-input v-model="MyForm.nickname" placeholder="用户昵称"></el-input>
        </el-form-item>
        <el-form-item prop="realName" label="姓名">
          <el-input v-model="MyForm.realName" placeholder="姓名"></el-input>
        </el-form-item>
        <!-- <el-form-item prop="password" label="密码">
          <el-input
            type="password"
            placeholder="密码"
            v-model="MyForm.password"
          ></el-input>
        </el-form-item> -->
        <el-form-item label="性别">
          <el-radio-group v-model="MyForm.gender">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="phone" label="手机">
          <el-input placeholder="手机" v-model="MyForm.phone"></el-input>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input v-model="MyForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item prop="birthday" label="生日">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="MyForm.birthday"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
        <el-form-item prop="qq" label="QQ">
          <el-input v-model="MyForm.qq" placeholder="QQ"></el-input>
        </el-form-item>
        <el-form-item prop="weChat" label="WeChat">
          <el-input v-model="MyForm.weChat" placeholder="WeChat"></el-input>
        </el-form-item>
        <el-form-item prop="intro" label="签名">
          <el-input
            type="textarea"
            placeholder="签名"
            v-model="MyForm.intro"
          ></el-input>
        </el-form-item>
        <el-form-item prop="hobby" label="爱好">
          <el-input v-model="MyForm.hobby" placeholder="爱好"></el-input>
        </el-form-item>
        <el-form-item prop="work" label="职位">
          <el-input v-model="MyForm.work" placeholder="职位"></el-input>
        </el-form-item>
        <el-form-item prop="address" label="地区">
          <el-select
            v-model="MyForm.address"
            placeholder="地区"
            style="width:100%"
          >
            <el-option
              v-for="item in cities"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="btn">
        <div @click="saveMsg()">保存</div>
        <div @click="goback">取消</div>
      </div>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { cities } from "../assets/data/form";
import { HttpManager } from "../api/index";

export default {
  name: "info",
  mixins: [mixin],
  data: function() {
    return {
      MyForm: {},
      cities: cities,
      rules: {
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
            // type: "date",
            message: "请选择日期",
            trigger: "blur"
          }
        ]
      }
    };
  },
  computed: {
    ...mapGetters(["userId"])
  },
  mounted() {
    this.getMsg(this.userId);
  },
  methods: {
    // 返回指定ID的用户
    getMsg(id) {
      HttpManager.getUserOfId(id)
        .then(res => {
          this.MyForm = res.data;
          // let d = new Date(this.MyForm.birthday);
          // let datetime =
          //   d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();

          // this.MyForm.birthday = datetime;
          console.log(this.MyForm);
        })
        .catch(err => {
          console.log(err);
        });
    },
    goback() {
      this.$router.go(-1);
    },
    // 更新用户信息
    saveMsg() {
      this.$refs["MyForm"].validate(valid => {
        if (valid) {
          HttpManager.updateUserMsg(this.MyForm)
            .then(res => {
              if (res.code === 0) {
                this.showError = false;
                this.showSuccess = true;
                this.$store.commit("setUsername", this.MyForm.nickname);
                this.$notify.success({
                  title: "编辑成功",
                  showClose: true
                });
                setTimeout(function() {
                  this.$router.go(-1);
                }, 2000);
              } else {
                this.showSuccess = false;
                this.showError = true;
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
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/info.scss";
</style>
