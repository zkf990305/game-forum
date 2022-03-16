<template>
  <div class="my-homepage">
    <div class="album-slide">
      <div class="album-img">
        <img :src="attachImageUrl(avatar)" alt="" />
      </div>
      <div class="album-info">
        <h2>个性签名</h2>
        <br />
        <span>
          {{ this.MyForm.intro }}
        </span>
      </div>
    </div>
    <div class="album-content">
      <div class="songs-body">
        <el-tabs :tab-position="'left'">
          <el-tab-pane label="个人信息">
            <el-descriptions
              title="个人详细信息"
              direction="vertical"
              :column="3"
              border
            >
              <el-descriptions-item label="用户昵称">
                {{ MyForm.nickname }}
              </el-descriptions-item>
              <el-descriptions-item label="用户ID">
                {{ userId }}
              </el-descriptions-item>
              <el-descriptions-item label="姓名">
                {{ MyForm.realName }}
              </el-descriptions-item>
              <el-descriptions-item label="性别">
                <img
                  v-show="MyForm.gender == '0'"
                  width="30px"
                  height="30px"
                  :size="10"
                  src="../assets/img/gender/0.svg"
                />
                <img
                  v-show="MyForm.gender == '1'"
                  width="30px"
                  height="30px"
                  :size="10"
                  src="../assets/img/gender/1.svg"
                />
              </el-descriptions-item>
              <el-descriptions-item label="出生日期">{{
                MyForm.birthday
              }}</el-descriptions-item>
              <el-descriptions-item label="手机号">{{
                MyForm.birthday
              }}</el-descriptions-item>
              <el-descriptions-item label="qq">{{
                MyForm.qq
              }}</el-descriptions-item>
              <el-descriptions-item label="WeChat">{{
                MyForm.weChat
              }}</el-descriptions-item>
              <el-descriptions-item label="email">{{
                MyForm.email
              }}</el-descriptions-item>
              <el-descriptions-item label="phone">{{
                MyForm.phone
              }}</el-descriptions-item>
              <el-descriptions-item label="爱好">{{
                MyForm.hobby
              }}</el-descriptions-item>
              <el-descriptions-item label="居住地" :span="2">{{
                MyForm.address
              }}</el-descriptions-item>
            </el-descriptions>
          </el-tab-pane>
          <el-tab-pane label="我的收藏">
            <el-tabs type="border-card" @tab-click="searchNull()">
              <el-tab-pane>
                <span slot="label"
                  ><i class="el-icon-date"></i> 收藏的游戏</span
                >

                <!--  -->
                <el-table
                  :data="
                    this.CollectOfGame.filter(
                      data =>
                        !search ||
                        data.name.toLowerCase().includes(search.toLowerCase())
                    )
                  "
                  style="width: 100%"
                >
                  <el-table-column label="名称" prop="name"> </el-table-column>
                  <!-- <el-table-column label="图片" prop="image">
                    <img src="../assets/img/news.png" alt="" />
                  </el-table-column> -->
                  <el-table-column label="简介" prop="content">
                  </el-table-column>
                  <el-table-column align="right">
                    <template slot="header" slot-scope="scope">
                      <el-input
                        v-model="search"
                        size="mini"
                        placeholder="输入关键字搜索"
                      />
                    </template>
                    <template slot-scope="scope">
                      <el-button
                        size="mini"
                        @click="startPlay(scope.$index, scope.row)"
                        >开始游戏</el-button
                      >
                      <el-button
                        size="mini"
                        type="danger"
                        @click="removeGameCollect(scope.$index, scope.row)"
                        >取消收藏</el-button
                      >
                    </template>
                  </el-table-column>
                </el-table>
                <!--  -->
              </el-tab-pane>
              <el-tab-pane label="收藏的帖子">
                <!--  -->
                <el-table
                  :data="
                    this.CollectOfPost.filter(
                      data =>
                        !searchOfTitle ||
                        data.title
                          .toLowerCase()
                          .includes(searchOfTitle.toLowerCase())
                    )
                  "
                  style="width: 100%"
                >
                  <el-table-column label="标题" prop="title"> </el-table-column>

                  <el-table-column label="概括" prop="outline">
                  </el-table-column>
                  <el-table-column label="作者" prop="authorName">
                  </el-table-column>
                  <el-table-column align="right">
                    <template slot="header" slot-scope="scope">
                      <el-input
                        v-model="searchOfTitle"
                        size="mini"
                        placeholder="输入关键字搜索"
                      />
                    </template>
                    <template slot-scope="scope">
                      <el-button
                        size="mini"
                        @click="openEdit(scope.$index, scope.row)"
                        >详情</el-button
                      >

                      <el-button
                        size="mini"
                        type="danger"
                        @click="removePostCollect(scope.$index, scope.row)"
                        >取消收藏</el-button
                      >
                    </template>
                  </el-table-column>
                </el-table>
                <!--  -->
              </el-tab-pane>
            </el-tabs>
          </el-tab-pane>
          <el-tab-pane label="我的发帖">
            <el-tabs type="border-card">
              <el-tab-pane label="发布帖子">
                <el-table
                  :data="
                    this.postListOfMe.filter(
                      data =>
                        !searchOfTitle ||
                        data.title
                          .toLowerCase()
                          .includes(searchOfTitle.toLowerCase())
                    )
                  "
                  style="width: 100%"
                >
                  <el-table-column label="标题" prop="title"> </el-table-column>

                  <el-table-column label="概括" prop="outline">
                  </el-table-column>
                  <el-table-column label="作者" prop="authorName">
                  </el-table-column>
                  <el-table-column label="状态" prop="status">
                    <template slot-scope="scope">
                      <span
                        style="margin-left: 10px"
                        v-if="scope.row.status == 1"
                      >
                        <el-tag>已审核</el-tag></span
                      >
                      <span
                        style="margin-left: 10px"
                        v-if="scope.row.status == 0"
                      >
                        <el-tag type="info">未审核</el-tag></span
                      >
                    </template>
                  </el-table-column>
                  <el-table-column align="right">
                    <template slot="header" slot-scope="scope">
                      <el-input
                        v-model="searchOfTitle"
                        size="mini"
                        placeholder="输入关键字搜索"
                      />
                    </template>
                    <template slot-scope="scope">
                      <el-button
                        size="mini"
                        @click="Edit(scope.$index, scope.row)"
                        >编辑</el-button
                      >
                      <el-button
                        size="mini"
                        @click="openEdit(scope.$index, scope.row)"
                        >查看</el-button
                      >

                      <!-- <el-button
                        size="mini"
                        type="danger"
                        @click="removePostCollect(scope.$index, scope.row)"
                        >取消收藏</el-button
                      > -->
                    </template>
                  </el-table-column>
                </el-table>
              </el-tab-pane>
              <!-- <el-tab-pane label="已通过">2</el-tab-pane> -->
            </el-tabs>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";

export default {
  name: "my-homepage",
  mixins: [mixin],
  components: {},
  data() {
    return {
      MyForm: {},
      CollectOfGame: [], //收藏的游戏
      CollectOfPost: [], //收藏的帖子
      removeCollect: {}, //取消收藏
      search: "",
      searchOfTitle: "",
      postListOfMe: [] //发布的列表
      // drawer: false,
      // collection: [], // 存放收藏的歌曲ID
      // collectList: [] // 收藏的歌曲
    };
  },
  computed: {
    ...mapGetters([
      "userId", // 用户id
      "id",
      "avatar",
      "loginIn"
      // "listOfSongs" // 存放的音乐
    ])
  },
  mounted() {
    this.getMsg(this.userId);
    this.getGameListOfCollect(this.userId);
    this.getPostListOfCollect(this.userId);
    this.getListPostOfMe(this.userId);
    // this.getCollection(this.userId);
  },
  methods: {
    searchNull() {
      this.search = "";
      this.searchOfTitle = "";
    },
    // 返回指定ID的用户
    getMsg(id) {
      if (this.loginIn) {
        HttpManager.getUserOfId(id)
          .then(res => {
            this.MyForm = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    getGameListOfCollect(userId) {
      HttpManager.getGameListOfCollect(userId).then(res => {
        if (res.code === 0) {
          this.CollectOfGame = res.data;
        }
      });
    },
    getPostListOfCollect(userId) {
      HttpManager.getPostListOfCollect(userId).then(res => {
        if (res.code === 0) {
          this.CollectOfPost = res.data;
        }
      });
    },
    startPlay(index, row) {
      window.open(row.officialWebsite, "_blank");
    },
    removeGameCollect(index, row) {
      let _this = this;
      this.removeCollect.uid = this.userId;
      this.removeCollect.type = 1;
      this.removeCollect.collectId = row.id;
      HttpManager.deleteCollect(this.removeCollect).then(res => {
        if (res.code === 0) {
          _this.notify(res.data, "success");

          this.getGameListOfCollect(this.userId);
        }
      });
    },
    // 编辑
    Edit(index, row) {
      this.$store.commit("setTempList", row);
      let routeUrl = this.$router.resolve({
        path: `md`
      });
      window.open(routeUrl.href, "_blank");
    },
    // 查看
    openEdit(index, row) {
      this.$store.commit("setTempList", row);
      let routeUrl = this.$router.resolve({
        path: `article-album/` + row.id
      });
      window.open(routeUrl.href, "_blank");
    },
    removePostCollect(index, row) {
      let _this = this;
      this.removeCollect.uid = this.userId;
      this.removeCollect.type = 0;
      this.removeCollect.collectId = row.id;
      HttpManager.deleteCollect(this.removeCollect).then(res => {
        if (res.code === 0) {
          _this.notify(res.data, "success");

          this.getPostListOfCollect(this.userId);
        }
      });
    },
    getListPostOfMe(id) {
      HttpManager.getListPostOfMe(id).then(res => {
        if (res.code === 0) {
          this.postListOfMe = res.data;
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/my-homepage.scss";
</style>
