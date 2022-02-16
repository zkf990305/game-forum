<template>
  <div class="game-list">
    <ul class="game-list-header">
      <li
        v-for="(item, index) in gameStyle"
        :key="index"
        :class="{ active: item.type === activeName }"
        @click="handleChangeView(item.type)"
      >
        {{ item.type }}
      </li>
    </ul>
    <div class="song-content">
      <game-content-list
        :contentList="data"
        path="game-list-album"
      ></game-content-list>
      <div class="pagination">
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
  </div>
</template>

<script>
import GameContentList from "../components/GameContentList";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";

export default {
  name: "game-list",
  components: {
    GameContentList
  },
  data() {
    return {
      gameStyle: [], // 游戏导航栏类别
      activeName: "全部",
      pageSize: 2, // 页数
      currentPage: 1, // 当前页
      albumDatas: [] // 歌单
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
    this.getGameTypeList();
    this.handleChangeView("全部");
  },
  methods: {
    // 获取全部游戏类型列表
    getGameTypeList() {
      HttpManager.getGameTypeList()
        .then(res => {
          this.gameStyle = res.data;
          this.activeName = this.gameStyle[0].type;
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取当前页
    handleCurrentChange(val) {
      this.currentPage = val;
    },
    // 获取游戏
    handleChangeView: function(name) {
      this.activeName = name;
      this.albumDatas = [];
      if (name === "全部") {
        this.getGameList(this.cur_page);
      } else {
        this.getGameListOfStyle(name);
      }
    },
    // 获取全部游戏
    getGameList(page) {
      HttpManager.getGameList()
        .then(res => {
          this.currentPage = 1;
          this.albumDatas = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 通过类别获取歌单
    getGameListOfStyle(style) {
      HttpManager.getGameListOfStyle(style)
        .then(res => {
          this.currentPage = 1;
          this.albumDatas = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/game-list.scss";
</style>
