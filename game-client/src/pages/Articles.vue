<template>
  <div class="articles">
    <el-container>
      <el-container>
        <el-header style="padding-top:15px; height: 150px">
          <div>
            <!--  -->
            <el-collapse v-model="activeName" accordion>
              <el-collapse-item name="1">
                <template slot="title">
                  <i class="el-icon-notebook-2"></i>
                  帖子分类
                  <span style="float: right;">
                    共{{ postClassify.length }}个</span
                  >
                </template>
                <div
                  v-for="(i, index) in postClassify"
                  :key="index"
                  style="cursor: pointer;float: left;"
                >
                  <el-link @click="getPostListOfClassify(i.classify)">
                    <el-tag>{{ i.classify }}</el-tag>
                    </el-link
                  >
                </div>
              </el-collapse-item>
              <el-collapse-item name="2">
                <template slot="title">
                  <i class="el-icon-notebook-2"></i>
                  帖子标签
                  <span style="float: right;"
                    >共{{ postTag.length }}个</span
                  >
                </template>
                <div
                  v-for="(i, index) in postTag"
                  :key="index"
                  style="cursor: pointer; float: left;"
                >
                  <el-link @click="getPostListOfTag(i.tag)">
                    <el-tag type="info">{{ i.tag }}</el-tag></el-link
                  >
                </div>
              </el-collapse-item>
            </el-collapse>
          </div>
        </el-header>
        <el-main>
          <div style="overflow:auto">
            <div v-infinite-scroll="load" infinite-scroll-disabled="disabled">
              <card-content-articles
                :contentList="albumData"
                path="article-album"
              ></card-content-articles>
            </div>
            <br />
            <el-button type="success" v-if="loading" @click="more"
              >加载更多</el-button
            <p v-if="noMore">没有更多了</p>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

import { HttpManager } from "../api/index";
import CardContentArticles from "../components/CardContentArticles";

export default {
  name: "articles",
  components: {
    CardContentArticles
  },
  data() {
    return {
      activeName: "1",
      // 数据列表 // 帖子列表
      albumDatas: [],
      loading: false,
      //默认显示条数
      cou: 3,
      // 帖子分类列表
      postClassify: [],
      // 帖子标签列表
      postTag: []
    };
  },
  computed: {
    noMore() {
      // 判断加载条数是否大于列表数据长度
      return this.cou > this.albumDatas.length;
    },
    disabled() {
      // 加载完成
      return this.loading || this.noMore;
    },
    albumData() {
      // 计算属性使用切片生成新数组
      let data = [];
      // 大于三条，使用切片，返回新数组
      if (this.albumDatas.length > 3) {
        data = this.albumDatas.slice(0, this.cou);
        return data;
      } else {
        // 否则使用原来数组，不进行切片处理
        data = this.albumDatas;
        return data;
      }
    }
  },
  mounted() {
    this.getAllPost();
    this.getAllPostClassify();
    this.getAllPostTag();
  },
  methods: {
    // 获取全部帖子
    getAllPost() {
      HttpManager.getAllPost()
        .then(res => {
          console.log(res.data);
          this.albumDatas = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取帖子分类列表
    getAllPostClassify() {
      HttpManager.getAllPostClassify()
        .then(res => {
          if (res.code === 0) {
            console.log(res.data);
            this.postClassify = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取对应分类的帖子
    getPostListOfClassify(classify) {
      HttpManager.getPostListOfClassify(classify)
        .then(res => {
          if (res.code === 0) {
            console.log(res.data);
            this.albumDatas = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取帖子标签列表
    getAllPostTag() {
      HttpManager.getAllPostTag()
        .then(res => {
          if (res.code === 0) {
            this.postTag = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取对应标签的帖子
    getPostListOfTag(tag) {
      console.log(tag)
      HttpManager.getPostListOfTag(tag)
        .then(res => {
          if (res.code === 0) {
            console.log(res.data);
            this.albumDatas = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    load() {
      this.loading = true;
    },
    more() {
      // 每次点击加三条
      this.cou += 3;
      this.loading = false;
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
  line-height: 10px;
}
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}

@import "../assets/css/articles.scss";
</style>
