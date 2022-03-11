<template>
  <div class="header">
    <!-- 折叠按钮 -->
    <div class="collapse-btn" @click="collapseChage">
      <i class="el-icon-s-unfold"></i>
    </div>
    <div class="logo">Game 后台管理</div>
    <div class="header-right">
      <div class="header-user-con">
        <span>{{ changeRole(userRole) }}</span>
        <!-- 用户头像 -->
        <div class="user-avator">
          <img :src="attachImageUrl(avatar)" />
        </div>
        <!-- 用户名下拉菜单 -->
        <el-dropdown class="user-name" trigger="click" @command="handleCommand">
          <span class="el-dropdown-link">
            {{ username }}
            <i class="el-icon-caret-bottom"></i>
          </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="toProfile">个人中心</el-dropdown-item>

            <el-dropdown-item command="loginout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>
<script>
import _ctrEvent from "../assets/js/ctr-event";
import { mapGetters } from "vuex";
import mixin from "../mixins";

export default {
  name: "the-header",
  mixins: [mixin],
  data() {
    return {
      collapse: true,
      fullscreen: false
      // username: "admin"
    };
  },
  computed: {
    ...mapGetters([
      "userId",
      "activeName",
      "avatar",
      "username",
      "loginIn",
      "userRole"
    ])
  },
  mounted() {
    if (document.body.clientWidth < 1500) {
      this.collapseChage();
    }
  },
  methods: {
    // 用户名下拉菜单选择事件
    handleCommand(command) {
      if (command === "loginout") {
        this.$store.commit("setUserId", null);
        this.$store.commit("setUsername", null);
        this.$store.commit("setAvatar", null);
        this.$store.commit("setLoginIn", false);
        this.$router.push("/");
      }
      if (command === "toProfile") {
        // this.$store.commit("setLoginIn", false);
        this.$router.push("/Profile");
      }
    },
    // 侧边栏折叠
    collapseChage() {
      this.collapse = !this.collapse;
      _ctrEvent.$emit("collapse", this.collapse);
    }
  }
};
</script>
<style scoped>
.header {
  position: absolute;
  z-index: 100;
  box-sizing: border-box;
  width: 100%;
  height: 70px;
  font-size: 22px;
  color: #b0b3b2;
  background: #1a1b1c;
  box-shadow: 0px 0px 8px 2px rgba(0, 0, 0, 0.3);
}

.collapse-btn {
  float: left;
  padding: 0 21px;
  cursor: pointer;
  line-height: 70px;
}

.header .logo {
  float: left;
  width: 250px;
  font-family: 26px;
  line-height: 70px;
}

.header-right {
  float: right;
  padding-right: 50px;
}

.header-user-con {
  display: flex;
  height: 70px;
  align-items: center;
}

.user-name {
  margin-left: 10px;
}

.user-avator {
  margin-left: 20px;
}

.user-avator img {
  display: block;
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.el-dropdown-link {
  color: #b0b3b2;
  cursor: pointer;
}

.el-dropdown-menu__item {
  text-align: center;
}
</style>
