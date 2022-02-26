<template>
  <el-form ref="form" :model="user" :rules="rules" label-width="80px">
    <el-form-item label="用户昵称" prop="username">
      <el-input v-model="user.username" maxlength="30" />
    </el-form-item>
    <el-form-item label="真实姓名" prop="realName">
      <el-input v-model="user.realName" maxlength="30" />
    </el-form-item>
    <el-form-item label="手机号码" prop="phone">
      <el-input v-model="user.phone" maxlength="11" />
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="user.email" maxlength="50" />
    </el-form-item>
    <el-form-item label="QQ">
      <el-input v-model="user.qq" maxlength="50" />
    </el-form-item>
    <el-form-item label="微信">
      <el-input v-model="user.weChat" maxlength="50" />
    </el-form-item>
    <el-form-item label="性别">
      <el-radio-group v-model="user.gender">
        <el-radio label="1">男</el-radio>
        <el-radio label="0">女</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item label="住址">
      <el-select v-model="user.address" placeholder="地区">
        <el-option
          v-for="item in cities"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        ></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="简介">
      <el-input
        type="textarea"
        placeholder="签名"
        v-model="user.intro"
      ></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
// import { updateUserProfile } from "@/api/system/user";
import { HttpManager } from "../../api/index";
import mixin from "../../mixins";
export default {
  mixins: [mixin],
  props: {
    user: {
      type: Object
    }
  },
  data() {
    return {
      form: {},
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
      // 表单校验
      rules: {
        username: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "'请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phone: [
          { required: true, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.uid = this.user.id;
          this.form.nickname = this.user.username;
          this.form.realName = this.user.realName;
          this.form.birthday = this.user.birthday;
          this.form.gender = this.user.gender;
          this.form.qq = this.user.qq;
          this.form.weChat = this.user.weChat;
          this.form.email = this.user.email;
          this.form.phone = this.user.phone;
          this.form.address = this.user.address;
          this.form.intro = this.user.intro;

          HttpManager.updateInfo(this.form).then(res => {
            if (res.code === 0) {
              this.notify("资料修改成功", "success");
            } else {
              this.notify(res.message, "error");
            }
          });
        }
      });
    },
    close() {
      this.$router.push("/Info");
    }
  }
};
</script>
