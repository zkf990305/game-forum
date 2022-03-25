<template>
  <div>
    <div v-for="(i, index) in contentList" :key="index" class="text item">
      <!-- 帖子：
          标题
          概况body-style="padding: 0px 800px 10px 180px"
            style="line-height: 40px;"
          由谁发布 -->
      <el-card shadow="hover" style="width: 1140px;line-height: 40px;">
        <el-container>
          <el-main
            ><div style="float: left;cursor: pointer;" @click="goAblum(i)">
              <h4>{{ i.title }}</h4>
            </div>
            <br />
            <div
              v-html="i.outline"
              style="float: left;cursor: pointer;"
              @click="goAblum(i)"
            ></div>
            <br />
            <div style="float: left;">
              由
              <span style="font-weight:bold;">
                {{ i.authorName }}
              </span>
              发布于
              <label> {{ getDateTime(i.gmtCreate) }}</label>
            </div></el-main
          >
          <el-aside width="300px">
            <div class="album-img">
              <img :src="attachGameImageUrl(i.photoUrl)" alt="" />
            </div>
            <!-- <el-avatar :size="60" @error="errorHandler">
              <img :src="attachImageUrl(i.photoUrl)" alt="" />
            </el-avatar> -->
          </el-aside>
        </el-container>
      </el-card>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import { ICON } from "../assets/icon/index";
import { formatDate } from "../utils/date";

export default {
  name: "card-content-articles",
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
    },
    // 时间显示
    getDateTime(item) {
      return formatDate(Date.parse(item));
    }
  }
};
</script>

<style lang="scss" scoped>
.text {
  font-size: 14px;
}

.item {
  padding: 5px 0;
}

// 图片
.album-img {
  height: 100px;
  width: 150px;
  display: inline-block;
  position: relative;
  // top: -100px;
  left: 50px;
  border-radius: 50%;
  // overflow: hidden;
  // border: 5px solid $color-white;
  img {
    width: 100%;
  }
}

@import "../assets/css/content-list.scss";
</style>
