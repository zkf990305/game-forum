<template>
  <div class="search-songs">
    <game-content-list
      :contentList="albumDatas"
      path="game-list-album"
    ></game-content-list>
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
import GameContentList from "../GameContentList";
import { HttpManager } from "../../api/index";
// import { mapGetters } from "vuex";

export default {
  name: "search-games",
  mixins: [mixin],
  components: {
    GameContentList
  },
  data() {
    return {
      albumDatas: [],
      pageSize: 2, // 页数
      currentPage: 1, // 当前页
      albumDatas: [] // 游戏
    };
  },
  computed: {
    // 计算当前表格中的数据
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
      HttpManager.getGameListOfLikeTitle(this.$route.query.keywords).then(
        res => {
          if (!res.data.length) {
            this.notify("暂无相似游戏内容", "warning");
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
@import "../../assets/css/search-songs.scss";
</style>
