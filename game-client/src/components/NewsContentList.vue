<template>
  <div class="content-list">
    <ul class="section-content">
      <li
        class="news-content-item"
        v-for="(item, index) in contentList"
        :key="index"
        style="display: inline;"
      >
        <div @click="goAblum(item)">
          <el-link>
            <span style="float:left" class="item-name">
              <label style="font-color:red;font-weight:bold">[公告]</label>
              <i class="el-icon-news"></i>
              {{ item.title }}
            </span>
          </el-link>
          <span style="float:right;cursor: pointer;" class="item-name">
            {{ item.gmtUpdatetime }}
          </span>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import mixin from "../mixins";
import { ICON } from "../assets/icon/index";

export default {
  name: "news-content-list",
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
      if (`/${this.path}` === "/news-list") {
        this.$router.push({ path: `/${this.path}` });
      } else {
        this.$router.push({ path: `/${this.path}/${item.id}` });
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.el-row {
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
@import "../assets/css/content-list.scss";
</style>
