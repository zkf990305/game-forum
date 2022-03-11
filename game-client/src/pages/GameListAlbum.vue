<template>
  <div class="game-list-album">
    <div class="album-slide">
      <div class="album-img">
        <img :src="attachImageUrl(games.image)" alt="" />
      </div>
      <div class="album-info">
        <h2>简介：</h2>
        <span>
          {{ games.content }}
        </span>
      </div>
    </div>
    <div class="album-content">
      <div class="album-title">
        <p>
          {{ games.name }}
          <el-link
            style="font-size:20px"
            type="danger"
            :href="games.officialWebsite"
            target="_blank"
            >开始游戏</el-link
          >
        </p>
      </div>
      <!--评分-->
      <div class="album-score">
        <div>
          <h3>游戏评分：</h3>
          <div>
            <el-rate v-model="value5" disabled></el-rate>
          </div>
        </div>
        <span>{{ value5 * 2 }}</span>
        <div>
          <h3>评价：</h3>
          <div @click="pushValue()">
            <el-rate v-model="value3" show-text allow-half></el-rate>
          </div>
        </div>
      </div>
      <collect :playId="gameId" :type="1"></collect>
      <comment :playId="gameId" :type="1"></comment>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import Comment from "../components/Comment";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";
import Collect from "../components/Collect";

export default {
  name: "game-list-album",
  mixins: [mixin],
  components: {
    Comment,
    Collect
  },
  data() {
    return {
      RankForm: {}, // 评分
      games: {},
      count: 0, // 点赞数
      gameId: "", // 游戏ID
      value3: 0,
      value5: 0
    };
  },
  computed: {
    ...mapGetters([
      "loginIn", // 登录标识
      "tempList", // 单个歌单信息
      "userId", // 用户ID
      "avatar" // 用户头像
    ])
  },
  created() {
    this.gameId = this.tempList.id; // 给游戏ID赋值
    this.games = this.tempList;
    this.getRank(this.gameId); // 获取评分
    if (this.loginIn) {
      this.getRankOfMe(this.userId, this.gameId); //
    }
  },
  methods: {
    // 获取评分
    getRank(id) {
      HttpManager.getRankOfGameId(id)
        .then(res => {
          console.log(res);
          this.value5 = res.data / 2;
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取评分
    getRankOfMe(id, gid) {
      HttpManager.getGameRankOfMe(id, gid)
        .then(res => {
          if (res.code === 0) {
            this.value3 = res.data / 2;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 提交评分
    pushValue() {
      if (this.loginIn) {
        this.RankForm.uid = this.userId;
        this.RankForm.gid = this.gameId;
        this.RankForm.score = this.value3 * 2;
        HttpManager.setRank(this.RankForm)
          .then(res => {
            if (res.code === 0) {
              this.getRank(this.gameId);
              this.notify(res.data, "success");
            } else {
              this.notify("评分失败", "error");
            }
          })
          .catch(err => {
            console.log(err);
          });
      } else {
        this.value3 = null;
        this.notify("请先登录", "warning");
      }
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/game-list-album.scss";
</style>
