<template>
  <el-form ref="form" :model="form" :rules="rules" label-width="80px">
    <el-form-item label="旧密码" prop="oldPassword">
      <el-input
        v-model="form.oldPassword"
        placeholder="请输入旧密码"
        type="password"
        show-password
      />
    </el-form-item>
    <el-form-item label="新密码" prop="newPassword">
      <el-input
        v-model="form.newPassword"
        placeholder="请输入新密码"
        type="password"
        show-password
      />
    </el-form-item>
    <el-form-item label="确认密码" prop="confirmPassword">
      <el-input
        v-model="form.confirmPassword"
        placeholder="请确认密码"
        type="password"
        show-password
      />
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
// import { updateUserPwd } from "@/api/system/user";
import { HttpManager } from "../../api/index";
import mixin from "../../mixins";
import { mapGetters } from "vuex";
export default {
  mixins: [mixin],
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.form.newPassword !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      form: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
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
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };
  },
  computed: {
    ...mapGetters([
      "userId" // 用户编号
    ])
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.id = this.userId;

          HttpManager.updateUserPwd(this.form).then(res => {
            if (res.code === 0) {
              this.notify("密码修改成功", "success");
              this.form = {};
            } else {
              this.notify(res.message, "error");
            }
          });
          // updateUserPwd(this.user.oldPassword, this.user.newPassword).then(
          //   response => {
          //     this.$modal.msgSuccess("修改成功");
          //   }
          // );
        }
      });
    },
    close() {
      this.$router.push("/Info");
    }
  }
};
</script>
