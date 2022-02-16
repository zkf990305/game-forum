import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

// 解决with new navigation
const originalPush = Router.prototype.push;
const originalReplace = Router.prototype.replace;
// push
Router.prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject)
    return originalPush.call(this, location, onResolve, onReject);
  return originalPush.call(this, location).catch(err => err);
};
// replace
Router.prototype.replace = function push(location, onResolve, onReject) {
  if (onResolve || onReject)
    return originalReplace.call(this, location, onResolve, onReject);
  return originalReplace.call(this, location).catch(err => err);
};

// 路由
const constantRoutes = [
  // 404 页面
  {
    path: "*",
    redirect: "/404"
  },
  {
    path: "/404",
    component: () => import("@/pages/404.vue")
  },
  // 主窗体
  {
    path: "/",
    name: "main",
    component: () => import("@/pages/Main"),
    children: [
      // 登录页面
      {
        path: "/login-in",
        name: "login-in",
        component: () => import("@/pages/LoginIn")
      },
      // 注册页面
      {
        path: "/sign-up",
        name: "sign-up",
        component: () => import("@/pages/SignUp")
      },

      // 首页
      {
        path: "/",
        name: "home",
        component: () => import("@/pages/Home")
      },
      // 帖子列表
      {
        path: "/articles",
        name: "articles",
        component: () => import("@/pages/Articles")
      },
      // 帖子详情
      {
        path: "/article-album/:id",
        name: "article-album",
        component: () => import("@/pages/ArticleAlbum")
      },
      // 游戏列表
      {
        path: "/game-list",
        name: "game-list",
        component: () => import("@/pages/GameList")
      },
      // 游戏详情
      {
        path: "/game-list-album/:id",
        name: "game-list-album",
        component: () => import("@/pages/GameListAlbum")
      },
      // 公告列表
      {
        path: "/news-list",
        name: "news-list",
        component: () => import("@/pages/NewsList")
      },
      // 公告详情
      {
        path: "/news-list-album/:id",
        name: "news-list-album",
        component: () => import("@/pages/NewsListAlbum")
      },
      // 个人信息
      {
        path: "/my-homepage",
        name: "my-homepage",
        component: () => import("@/pages/MyHomepage")
      },
      // 搜索
      {
        path: "/search",
        name: "search",
        component: () => import("@/pages/Search")
      },
      // 设置
      {
        path: "/setting",
        name: "setting",
        component: () => import("@/pages/Setting")
      }
    ]
  },
  // 新帖子
  {
    path: "/md",
    name: "md",
    component: () => import("@/pages/Md")
  }
];

export default new Router({
  mode: "history", // 去掉url中的#
  scrollBehavior: (o, from, savedPosition) => ({ x: 0, y: 0 }),
  routes: constantRoutes
});
