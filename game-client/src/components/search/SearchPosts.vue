<template>
  <div class="search-song-Lists">
    <card-content-articles
      :contentList="data"
      path="article-album"
    ></card-content-articles>
    <div class="pagination" v-show="albumDatas.length">
      <el-pagination
        @current-change="handleCurrentChange"
        background
        layout="total, prev, pager, next"
        :current-page="currentPage"
        :page-size="pageSize"
        :total="albumDatas.length"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import mixin from "../../mixins";
import CardContentArticles from "../CardContentArticles";
import { HttpManager } from "../../api/index";

export default {
  name: "search-posts",
  mixins: [mixin],
  components: {
    CardContentArticles
  },
  data() {
    return {
      albumDatas: [],
      pageSize: 3, // 页数
      currentPage: 1, // 当前页
      albumDatas: [] // 帖子
    };
  },
  computed: {
    data() {
      return this.albumDatas.slice(
        (this.currentPage - 1) * this.pageSize,
        this.currentPage * this.pageSize
      );
    }
  },
  mounted() {
    this.getSearchList();
  },
  methods: {
    // 获取当前页
    handleCurrentChange(val) {
      this.currentPage = val;
    },
    getSearchList() {
      if (!this.$route.query.keywords) return;
      HttpManager.getPostListOfLikeTitle(this.$route.query.keywords).then(
        res => {
          if (!res.data.length) {
            this.notify("暂无相似帖子内容", "warning");
          } else {
            this.albumDatas = res.data;
          }
        }
      );
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../../assets/css/search-song-Lists.scss";
</style>
