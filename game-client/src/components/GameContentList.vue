<template>
  <div class="content-list">
    <ul class="section-content">
      <li
        class="content-item"
        v-for="(item, index) in contentList"
        :key="index"
      >
        <div class="kuo" @click="goAblum(item)">
          <img :src="attachImageUrl(item.image)" alt="" />
          <div class="mask" @click="goAblum(item)"></div>
        </div>
        <p class="item-name">
          <el-link type="danger" @click="goAblum(item)">{{
            item.name || item.title
          }}</el-link>

          <el-divider direction="vertical"></el-divider>
          <i class="el-icon-top" style="background-color:#F56C6C"></i>评分：{{
            item.score
          }}
          <el-divider direction="vertical"></el-divider>
          <el-link type="success" :href="item.officialWebsite" target="_blank"
            >进入游戏
          </el-link>
        </p>
      </li>
    </ul>
  </div>
</template>

<script>
import mixin from "../mixins";
import { ICON } from "../assets/icon/index";

export default {
  name: "game-content-list",
  mixins: [mixin],
  props: {
    contentList: Array,
    path: String
  },
  data() {
    return {
      BOFANG: ICON.BOFANG
    };
  },
  methods: {
    goAblum(item) {
      this.$store.commit("setTempList", item);
      this.$router.push({ path: `/${this.path}/${item.id}` });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/content-list.scss";
</style>
