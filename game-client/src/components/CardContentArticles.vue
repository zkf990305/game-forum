<template>
  <div>
    <div v-for="(i, index) in contentList" :key="index">
      <!-- 帖子：
          标题
          概况body-style="padding: 0px 800px 10px 180px"
            style="line-height: 40px;"
          由谁发布 -->

      <el-card shadow="hover" style="height: 130px; margin-top:-10px">
        <el-container>
          <el-aside width="120px">
            <div class="album-img">
              <img :src="attachGameImageUrl(i.photoUrl)" alt="" />
            </div>
          </el-aside>
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
          <el-aside width="80px">
            <el-tag v-show="i.isStick == 1" type="warning" effect="dark">
              精帖
            </el-tag>
            <el-tag v-show="i.isStick == 2" type="success" effect="dark"
              >置顶
            </el-tag>
            <el-tag v-show="i.isStick == 3" type="danger" effect="dark"
              >精 + 顶</el-tag
            >
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
// .text {
//   font-size: 14px;
// }

// .item {
//   padding: 5px 0;
// }

// 图片
.album-img {
  height: 80px;
  width: 80px;
  display: inline-block;
  position: relative;
  // top: -100px;
  left: 10px;
  border-radius: 50%;
  // overflow: hidden;
  // border: 5px solid $color-white;
  img {
    width: 100%;
  }
}

@import "../assets/css/content-list.scss";
</style>
