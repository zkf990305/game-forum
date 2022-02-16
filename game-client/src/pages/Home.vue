<template>
  <div class="home">
    <!--轮播图-->
    <el-carousel
      class="swiper-container"
      :interval="4000"
      type="card"
      height="280px"
    >
      <el-carousel-item v-for="(item, index) in swiperList" :key="index">
        <a :href="item.OfficialWebsite" target="_blank">
          <img :src="item.picImg" />
        </a>
      </el-carousel-item>
    </el-carousel>
    <!--热门公告-->
    <div class="section">
      <div class="section-title">
        最新公告
        <div style="float:right">
          <el-link target="_blank" @click="goNewsList">更多 ></el-link>
        </div>
      </div>
      <el-divider></el-divider>
      <el-container>
        <el-aside width="650px">
          <img src="../assets/img/news.png" />
        </el-aside>
        <el-main>
          <news-content-list
            :contentList="newsList"
            path="news-list-album"
          ></news-content-list>
        </el-main>
      </el-container>
    </div>

    <!--游戏中心-->
    <div class="section">
      <div class="section-title">
        热门游戏

        <div style="float:right">
          <el-link target="_blank" @click="goGameList">更多 ></el-link>
        </div>
      </div>
      <el-divider></el-divider>
      <game-content-list
        :contentList="gameList"
        path="game-list-album"
      ></game-content-list>
    </div>

    <!--友情链接-->
    <div class="section">
      <div class="section-title">
        <i class="el-icon-link"></i> 友情链接 | 论坛合作
      </div>
      <el-divider></el-divider>
      <el-row>
        <el-col :span="8" v-for="(item, index) in linkList" :key="item.id">
          <el-card :body-style="{ padding: '0px' }">
            <img :src="attachImageUrl(item.image)" class="image" />
            <div style="padding: 14px;">
              <span>{{ item.name }}</span>
              <div class="bottom clearfix">
                <time class="time">{{ item.createDate }}</time>
                <el-link
                  type="primary"
                  class="button"
                  :href="item.website"
                  target="_blank"
                  >官网介绍</el-link
                >
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import NewsContentList from "../components/NewsContentList";
import GameContentList from "../components/GameContentList";
import ContentList from "../components/ContentList";
import { swiperList } from "../assets/data/swiper";
import { HttpManager } from "../api/index";
import mixin from "../mixins";

export default {
  name: "home",
  mixins: [mixin],
  components: {
    NewsContentList,
    ContentList,
    GameContentList
  },
  data() {
    return {
      swiperList: swiperList, // 轮播图列表
      newsList: [], // 公告列表
      gameList: [], // 游戏列表
      linkList: [] //  友链
    };
  },
  created() {
    // 获取友链
    this.getLinkList();
    // 获取前8条公告
    this.newsListOfTheFirstEight();
    // 获取全部游戏
    this.gameListOfTheFirstEight();
  },
  methods: {
    // 获取前8条公告
    newsListOfTheFirstEight() {
      HttpManager.newsListOfTheFirstEight()
        .then(res => {
          if (res.code === 0) {
            this.newsList = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取前8条游戏
    gameListOfTheFirstEight() {
      HttpManager.gameListOfTheFirstEight()
        .then(res => {
          this.gameList = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },

    // 跳转公告列表页面
    goNewsList() {
      this.$store.commit("setTempList", this.newsList[0]);
      // this.$router.push({ path: `/${this.path}/${item.id}` });
      // /// 打开新窗口
      let routeUrl = this.$router.resolve({
        path: "/news-list"
      });
      window.open(routeUrl.href, "_blank");
    },
    // 跳转游戏列表页面
    goGameList() {
      /// 打开新窗口
      let routeUrl = this.$router.resolve({
        path: "/game-list"
      });
      window.open(routeUrl.href, "_blank");
    },

    // 获取友链
    getLinkList() {
      HttpManager.getLinkList()
        .then(res => {
          console.log(res);
          this.linkList = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/home.scss";
</style>
