import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

const constantRoutes = [
  {
    path: "/Home",
    component: resolve => require(["../components/Home.vue"], resolve),
    meta: { title: "自述文件" },
    children: [
      {
        path: "/Info",
        component: resolve => require(["../pages/InfoPage.vue"], resolve),
        meta: { title: "Info" }
      },
      // 个人中心
      {
        path: "/Profile",
        component: resolve => require(["../pages/user/index.vue"], resolve),
        meta: { title: "Profile" }
      },
      // 帖子
      {
        path: "/Post",
        component: resolve => require(["../pages/PostPage.vue"], resolve),
        meta: { title: "Post" }
      },
      // 公告
      {
        path: "/News",
        component: resolve => require(["../pages/NewsPage.vue"], resolve),
        meta: { title: "News" }
      },
      // 友链
      {
        path: "/Links",
        component: resolve => require(["../pages/LinksPage.vue"], resolve),
        meta: { title: "News" }
      },
      // 游戏
      {
        path: "/Game",
        component: resolve => require(["../pages/GamePage.vue"], resolve),
        meta: { title: "Game" }
      },
      // 评论
      {
        path: "/Comment",
        component: resolve => require(["../pages/CommentPage.vue"], resolve),
        meta: { title: "Comment" }
      },
      // 用户
      {
        path: "/Consumer",
        component: resolve => require(["../pages/ConsumerPage.vue"], resolve),
        meta: { title: "Consumer" }
      },
      {
        path: "/Collect",
        component: resolve => require(["../pages/CollectPage.vue"], resolve),
        meta: { title: "Collect" }
      }
    ]
  },
  {
    path: "/",
    component: resolve => require(["../pages/Login.vue"], resolve)
  }
];

export default new Router({
  mode: "history", // 去掉url中的#
  scrollBehavior: (o, from, savedPosition) => ({ x: 0, y: 0 }),
  routes: constantRoutes
});
