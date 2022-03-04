<template>
  <div class="sidebar">
    <el-menu
      class="sidebar-el-menu"
      :default-active="onRoutes"
      :collapse="collapse"
      background-color="#242526"
      text-color="#B0B3B2"
      active-text-color="#ffffff"
      unique-opened
      router
    >
      <template v-for="item in items">
        <template>
          <el-menu-item
            :index="item.index"
            :key="item.index"
            v-show="JudgmentUserRole(item.role)"
          >
            <i :class="item.icon"></i>
            <span slot="title">{{ item.title }} </span>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>

<script>
import _ctrEvent from "../assets/js/ctr-event";
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      collapse: false,
      items: [
        {
          icon: "el-icon-s-data",
          index: "info",
          role: [1, 2, 3],
          title: "系统首页"
        },
        {
          icon: "el-icon-user-solid",
          index: "consumer",
          role: [1, 2],
          title: "用户管理"
        },
        {
          icon: "el-icon-edit-outline",
          index: "post",
          role: [1, 2, 3],
          title: "帖子管理"
        },
        {
          icon: "el-icon-edit-outline",
          index: "postClassify",
          role: [1, 2],
          title: "帖子分类管理"
        },
        {
          icon: "el-icon-edit-outline",
          index: "postTag",
          role: [1, 2],
          title: "帖子标签管理"
        },
        // 评论管理
        {
          icon: "el-icon-tickets",
          index: "comment",
          role: [1, 2, , 3],
          title: "评论管理"
        },
        // 游戏管理
        {
          icon: "el-icon-mouse",
          index: "game",
          role: [1, 2],
          title: "游戏管理"
        },
        // 游戏分类管理
        {
          icon: "el-icon-mouse",
          index: "gameType",
          role: [1, 2],
          title: "游戏分类管理"
        },
        // 公告管理
        {
          icon: "el-icon-news",
          index: "news",
          role: [1, 2],
          title: "公告管理"
        },
        {
          icon: "el-icon-message",
          index: "message",
          role: [1, 2],
          title: "留言管理"
        },
        {
          icon: "el-icon-link",
          index: "links",
          role: [1, 2],
          title: "友情链接"
        }
      ]
    };
  },
  computed: {
    onRoutes() {
      return this.$route.path.replace("/", "");
    },
    ...mapGetters(["userRole"])
  },
  created() {
    _ctrEvent.$on("collapse", msg => {
      this.collapse = msg;
    });
  },
  methods: {
    JudgmentUserRole(item) {
      for (var i = 0; i < item.length; i++) {
        if (this.userRole == item[i]) {
          return true;
        }
      }
      return false;
    }
  }
};
</script>

<style scoped>
.sidebar {
  display: block;
  position: absolute;
  background-color: #334256;
  left: 0;
  top: 70px;
  bottom: 0;
  overflow-y: scroll;
}
.sidebar::-webkit-scrollbar {
  width: 0;
}
.sidebar-el-menu:not(.el-menu--collapse) {
  width: 180px;
}
.sidebar > ul {
  height: 100%;
}
</style>
