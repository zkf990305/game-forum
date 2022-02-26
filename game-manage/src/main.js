import Vue from "vue";
import Vuex from "vuex";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import "./assets/css/main.css";
import "babel-polyfill";
import VCharts from "v-charts";
import App from "./App";
import router from "./router";
import store from "./store/index";
import "@/assets/js/iconfont.js";
import echarts from "echarts";
// import { mapGetters } from "vuex";
// import "@/icons"; // icon

Vue.use(Vuex);
Vue.use(ElementUI);
Vue.use(VCharts);
Vue.prototype.$echarts = echarts;
/* eslint-disable no-new */
new Vue({
  el: "#app",
  router: router,
  store: new Vuex.Store(store),
  render: h => h(App)
});

// router.beforeEach((to, from, next) => {
//   if (to.matched.some(m => m.meta.requireAuth)) {
//     // 对路由进行验证
//     if (mapGetters.state.loginIn) {
//       // 已经登陆
//       next(); // 正常跳转到你设置好的页面
//     } else {
//       // 未登录则跳转到登陆界面
//       next({ path: "/" });
//     }
//   } else {
//     next();
//   }
// });
