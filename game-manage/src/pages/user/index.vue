<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>个人信息</span>
          </div>
          <div>
            <div class="text-center">
              <userAvatar :user="user" />
            </div>
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                用户名称
                <div class="pull-right">{{ user.username }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                性别
                <div class="pull-right">
                  <img
                    v-show="user.gender == '0'"
                    width="30px"
                    height="30px"
                    :size="10"
                    src="../../assets/img/gender/0.svg"
                  />
                  <img
                    v-show="user.gender == '1'"
                    width="30px"
                    height="30px"
                    :size="10"
                    src="../../assets/img/gender/1.svg"
                  />
                </div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                生日
                <div class="pull-right">{{ user.birthday }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="phone" /> -->
                <i class="el-icon-mobile-phone"></i>
                手机号码
                <div class="pull-right">{{ user.phone }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="email" /> -->
                用户邮箱
                <div class="pull-right">{{ user.email }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                QQ
                <div class="pull-right">{{ user.qq }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                微信
                <div class="pull-right">{{ user.weChat }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                住址
                <div class="pull-right">{{ user.address }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="user" /> -->
                <i class="el-icon-user-solid"></i>
                简介
                <div class="pull-right">{{ user.intro }}</div>
              </li>

              <li class="list-group-item">
                <!-- <svg-icon icon-class="peoples" /> -->
                所属角色
                <div class="pull-right">{{ changeRole(user.role) }}</div>
              </li>
              <li class="list-group-item">
                <!-- <svg-icon icon-class="date" /> -->
                创建日期
                <div class="pull-right">{{ user.gmtCreate }}</div>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="18" :xs="24">
        <el-card>
          <div slot="header" class="clearfix">
            <span>基本资料</span>
          </div>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本资料" name="userinfo">
              <userInfo :user="user" />
            </el-tab-pane>
            <el-tab-pane label="修改密码" name="resetPwd">
              <resetPwd :user="user" />
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import userAvatar from "./userAvatar";
import userInfo from "./userInfo";
import resetPwd from "./resetPwd";
import mixin from "../../mixins";
import { HttpManager } from "@/api/index";
import { mapGetters } from "vuex";

export default {
  name: "Profile",
  components: { userAvatar, userInfo, resetPwd },
  mixins: [mixin],
  data() {
    return {
      user: {},
      activeTab: "userinfo"
    };
  },
  computed: {
    ...mapGetters(["userId", "activeName", "avatar", "username", "loginIn"])
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      HttpManager.getGfUserByUserId(this.userId).then(res => {
        this.user = res.data;
      });
    }
  }
};
</script>

<style lang="scss">
/* // main-container全局样式 */
.app-container {
  padding: 20px;
}
.clearfix {
  &:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0;
  }
}
.text-center {
  text-align: center;
}
.list-group-striped > .list-group-item {
  border-left: 0;
  border-right: 0;
  border-radius: 0;
  padding-left: 0;
  padding-right: 0;
}

.list-group {
  padding-left: 0px;
  list-style: none;
}

.list-group-item {
  border-bottom: 1px solid #e7eaec;
  border-top: 1px solid #e7eaec;
  margin-bottom: -1px;
  padding: 11px 0px;
  font-size: 13px;
}
.pull-right {
  float: right !important;
}
</style>
