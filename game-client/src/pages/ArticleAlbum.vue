<template>
  <div class="text item">
    <el-card class="box-card" style="line-height: 40px;margin-top:30px">
      <div slot="header" class="clearfix" style="height:60px;padding-top:15px;">
        <div style="float: left; font-weight:bold; ">
          {{ article.title }}
        </div>
        <br />
        <el-avatar
          :size="30"
          @error="errorHandler"
          style="font-weight:bold;float: left;"
        >
          <img :src="attachImageUrl(avatar)" />
        </el-avatar>
        <!-- <div style="float: left;"> -->
        <span style="font-weight:bold;float: left;">
          <el-link href="" :underline="false">{{ article.authorName }}</el-link>
        </span>
        <div style="float: right;">
          <div v-show="postClassify.length" style="float: left;">分类:</div>
          <div
            v-for="(i, index) in postClassify"
            :key="index"
            style="cursor: pointer;float: left;"
          >
            <!-- <el-link> -->
            <el-tag>{{ i.classify }}</el-tag>
            <!-- </el-link> -->
          </div>
        </div>

        <!-- <label> {{ getDateTime(article.gmtCreate) }}</label> -->
        <!-- </div> -->
      </div>
      <el-card>
        <div v-html="article.content"></div>
      </el-card>
      <div v-show="postTag.length" style="float: left;">标签:</div>
      <div
        v-for="(i, index) in postTag"
        :key="index"
        style="cursor: pointer;float: left;"
      >
        <el-link>
          <el-tag>{{ i.tag }}</el-tag>
        </el-link>
      </div>
      <div style="float: right">
        最后更新时间：{{ getDateTime(tempList.gmtUpdatetime) }}
      </div>
      <!-- <br /> -->
      <!-- <el-divider></el-divider> -->
    </el-card>
    <!--  -->
    <collect :playId="postId" :type="0"></collect>
    <comment :playId="postId" :type="0"></comment>
  </div>
</template>

<script>
import mixin from "../mixins";
import Comment from "../components/Comment";
import Collect from "../components/Collect";
import { mapGetters } from "vuex";
import { formatDate } from "@/utils/date.js";
import { HttpManager } from "../api/index";

export default {
  name: "article-album",
  mixins: [mixin],
  components: {
    Comment,
    Collect
  },
  data() {
    return {
      article: [],
      count: 0, // 点赞数
      postId: "", // 帖子id
      value3: 0,
      value5: 0,
      postClassify: [], //分类
      postTag: [] //标签
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
    this.postId = this.tempList.id; // 给歌单ID赋值
    this.article = this.tempList;
  },
  mounted() {
    this.getPostClassifyOfPostId(this.tempList.id);
    this.getPostTagOfPostId(this.tempList.id);
  },
  methods: {
    // 时间显示
    getDateTime(item) {
      return formatDate(Date.parse(item));
    },
    getPostClassifyOfPostId(id) {
      HttpManager.getPostClassifyOfPostId(id).then(res => {
        console.log(id);
        if (res.code === 0) {
          console.log(res.data);
          this.postClassify = res.data;
        }
      });
    },
    getPostTagOfPostId(id) {
      HttpManager.getPostTagOfPostId(id).then(res => {
        console.log(id);
        if (res.code === 0) {
          console.log(res.data);
          this.postTag = res.data;
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.el-aside {
  background-color: #d3dce6;
  color: #333;
  text-align: center;
  line-height: 20px;
}

.el-main {
  background-color: #e9eef3;
  color: #333;
  text-align: center;
  line-height: 80px;
}
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}
@import "../assets/css/articles.scss";
</style>
