<template>
  <el-container style="padding-top: 90px;min-height: 800px;">
    <el-aside
      width="300px"
      style="padding-top: 10px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1); "
    >
      <el-container>
        <el-header width="150px">
          <img
            src="../assets/img/news.png"
            style="width: 250px; height: 100px"
          />
        </el-header>
        <el-main>
          <news-content-list
            :contentList="data"
            path="news-list"
          ></news-content-list>
          <div class="pagination">
            <el-pagination
              @current-change="handleCurrentChange"
              background
              layout="total, prev, pager, next"
              :current-page="currentPage"
              :page-size="pageSize"
              :total="newsList.length"
            >
            </el-pagination>
          </div>
        </el-main>
      </el-container>
    </el-aside>
    <el-main>
      <div class="text item">
        <el-card class="box-card" style="line-height: 40px; ">
          <div
            slot="header"
            class="clearfix"
            style="height:60px;padding-top:15px;"
          >
            <div style="float: left; font-weight:bold; ">
              {{ tempList.title }}
            </div>
            <br />
            <div style="float: left;">
              由
              <span style="font-weight:bold;">
                {{ tempList.authorName }}
              </span>
              发布于
              <label> {{ getDateTime(tempList.createtime) }}</label>
            </div>
          </div>
          <el-card>
            <div v-html="tempList.content"></div>
          </el-card>

          <!-- <br /> -->
          <el-divider></el-divider>
          <div style="float: right">
            最后更新时间：{{ getDateTime(tempList.gmtUpdatetime) }}
          </div>
        </el-card>
      </div>
    </el-main>
  </el-container>
</template>
<script>
import mixin from "../mixins";
import NewsContentList from "../components/NewsContentList";
import { mapGetters } from "vuex";
import { formatDate } from "@/utils/date.js";
import { HttpManager } from "../api/index";

export default {
  name: "news-list",
  mixins: [mixin],
  components: {
    NewsContentList
  },
  data() {
    return {
      newsList: [],
      pageSize: 6, // 页数
      currentPage: 1, // 当前页
      count: 0, // 点赞数

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
    ]),

    // 计算当前表格中的数据
    data() {
      return this.newsList.slice(
        (this.currentPage - 1) * this.pageSize,
        this.currentPage * this.pageSize
      );
    }
  },
  created() {
    // 获取全部公告
    this.getAllNewsList();
  },
  methods: {
    // 时间显示
    getDateTime(item) {
      return formatDate(Date.parse(item));
    },
    // 获取全部公告
    getAllNewsList() {
      HttpManager.getAllNewsList()
        .then(res => {
          if (res.code === 0) {
            this.currentPage = 1;
            this.newsList = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取当前页
    handleCurrentChange(val) {
      this.currentPage = val;
    }
  }
};
</script>

<style lang="scss" scoped>
.el-aside {
  background-color: #ffffff;
}

// .text {
//   font-size: 14px;
// }

// .item {
//   padding: 18px 0;
// }
@import "../assets/css/articles.scss";
</style>
