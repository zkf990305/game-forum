<template>
  <div class="the-header">
    <!--图标-->
    <el-tooltip
      class="item"
      effect="dark"
      content="Game 首页"
      placement="top-start"
    >
      <div class="header-logo" @click="goHome">
        <svg class="icon" aria-hidden="true">
          <use :xlink:href="GAME"></use>
        </svg>
        <span>{{ gameName }}</span>
      </div>
    </el-tooltip>
    <ul class="navbar" ref="change">
      <li
        :class="{ active: item.name === activeName }"
        v-for="item in navMsg"
        :key="item.path"
        @click="goPage(item.path, item.name)"
      >
        {{ item.name }}
      </li>
      <li>
        <div class="header-search">
          <input
            type="text"
            placeholder="搜索帖子或游戏"
            @keyup.enter="goSearch()"
            v-model="keywords"
          />
          <div class="search-btn" @click="goSearch()">
            <svg class="icon" aria-hidden="true">
              <use :xlink:href="SOUSUO"></use>
            </svg>
          </div>
        </div>
      </li>

      <li
        v-show="!loginIn"
        :class="{ active: item.name === activeName }"
        v-for="item in loginMsg"
        :key="item.type"
        @click="goPage(item.path, item.name)"
      >
        {{ item.name }}
      </li>
      <li v-for="item in postMsg" @click="goPageOfMd(item.path, item.name)">
        <el-button type="primary" round
          ><i class="el-icon-edit"></i> {{ item.name }}</el-button
        >
      </li>
      <li>
        <el-button type="danger" round @click="changeAside"
          ><i class="el-icon-message"></i> 留言</el-button
        >
      </li>
      <li v-show="loginIn && userRole != 3">
        <el-link href="http://localhost:8081/" target="_blank">
          <i class="el-icon-monitor"></i>
          后台管理</el-link
        >
      </li>
    </ul>
    <!--设置-->
    <div class="header-right" v-show="loginIn">
      <!-- <el-badge :value="100" :max="99" class="item">
        <el-button icon="el-icon-bell"></el-button>
      </el-badge> -->

      <div id="user">
        <!-- 头像 -->
        <img :src="attachImageUrl(avatar)" />

        <!-- <el-avatar :size="60" @error="errorHandler">
          <img :src="attachImageUrl(avatar)" />
        </el-avatar> -->
      </div>
      <ul class="menu">
        <li
          v-for="(item, index) in menuList"
          :key="index"
          @click="goMenuList(item.path)"
        >
          {{ item.name }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { navMsg, loginMsg, postMsg, menuList } from "../assets/data/header";
import { ICON } from "../assets/icon/index";

export default {
  name: "the-header",
  mixins: [mixin],
  data() {
    return {
      gameName: "Game",
      navMsg: navMsg, // 左侧导航栏
      loginMsg: loginMsg, // 右侧导航栏
      postMsg: postMsg, // 搜索框右侧导航栏
      menuList: menuList, // 用户下拉菜单项
      keywords: "",
      GAME: ICON.GAME,
      SOUSUO: ICON.SOUSUO
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
    document.querySelector("#user").addEventListener(
      "click",
      function(e) {
        document.querySelector(".menu").classList.add("show");
        e.stopPropagation(); // 关键在于阻止冒泡
      },
      false
    );
    // 点击“菜单”内部时，阻止事件冒泡。(这样点击内部时，菜单不会关闭)
    document.querySelector(".menu").addEventListener(
      "click",
      function(e) {
        e.stopPropagation();
      },
      false
    );
    document.addEventListener(
      "click",
      function() {
        document.querySelector(".menu").classList.remove("show");
      },
      false
    );
  },
  methods: {
    errorHandler() {
      return true;
    },
    goHome() {
      this.$router.push({ path: "/" });
    },
    goPage(path, value) {
      document.querySelector(".menu").classList.remove("show");
      this.changeIndex(value);
      if (!this.loginIn && path === "/my-homepage") {
        this.notify("请先登录", "warning");
      } else {
        this.$router.push({ path: path });
      }
    },
    changeIndex(value) {
      this.$store.commit("setActiveName", value);
    },
    // 跳转编辑帖子页面
    goPageOfMd(path, value) {
      // // 打开新窗口
      // let routeUrl = this.$router.resolve({
      //   path: path
      // });
      // window.open(routeUrl.href, "_blank");

      this.$store.commit("setTempList", null);
      if (!this.loginIn && path === "/md") {
        this.notify("请先登录", "warning");
      } else {
        // 打开新窗口
        let routeUrl = this.$router.resolve({
          path: path
        });
        window.open(routeUrl.href, "_blank");
      }
    },
    // 点击留言
    changeAside() {
      let temp = !this.showAside;
      this.$store.commit("setShowAside", temp);
    },
    goMenuList(path) {
      if (path === 0) {
        this.$store.commit("setIsActive", false);
      }
      document.querySelector(".menu").classList.remove("show");
      if (path) {
        this.$router.push({ path: path });
      } else {
        this.$store.commit("setLoginIn", false);
        this.$router.go(0);
      }
    },
    goSearch() {
      this.$store.commit("setSearchword", this.keywords);
      this.$router.push({
        path: "/search",
        query: { keywords: this.keywords }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.item {
  margin-top: 10px;
  margin-right: 40px;
}
@import "../assets/css/the-header.scss";
</style>
