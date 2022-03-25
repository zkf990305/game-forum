// 左侧导航栏
const navMsg = [
  {
    name: "首页",
    path: "/"
  },
  {
    name: "帖子",
    path: "/articles"
  },

  {
    name: "个人主页",
    path: "/my-homepage"
  },
  {
    name: "游戏中心",
    path: "/game-list"
  }
];

// 右侧导航栏
const loginMsg = [
  {
    name: "登录",
    path: "/login-in"
  },
  {
    name: "注册",
    path: "/sign-up"
  }
];

// 搜索框右侧导航栏
const postMsg = [
  {
    name: "创作",
    path: "/md"
  }
];

// 用户下拉菜单项--帖子
const postMenuList = [
  {
    name: "首页",
    path: "/"
  },
  {
    name: "帖子管理",
    path: "/my-homepage"
  },
  {
    name: "退出",
    path: 0
  }
];

// 用户下拉菜单项
const menuList = [
  {
    name: "账户设置",
    path: "/setting"
  },
  {
    name: "退出",
    path: 0
  }
];

export { navMsg, loginMsg, postMsg, menuList, postMenuList };
