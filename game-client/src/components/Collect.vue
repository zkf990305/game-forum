<template>
  <el-row style="margin-left: 10px;height: 50px;">
    <template>
      <el-button @click="Like" circle :class="isZan ? 'redZan' : 'Zan'">
        <svg class="icon" aria-hidden="true">
          <use :xlink:href="ZAN"></use>
        </svg>
      </el-button>
      点赞
    </template>

    <template>
      <el-button
        @click="Collect"
        icon="el-icon-star-off"
        circle
        :class="isCollect ? 'redZan' : 'Zan'"
      ></el-button>
      收藏
    </template>
  </el-row>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";
import { ICON } from "../assets/icon/index";

export default {
  name: "collect",
  mixins: [mixin],
  props: {
    playId: Number, // 帖子id / 游戏id
    type: Number // 收藏类型（0帖子 1游戏）
  },
  data() {
    return {
      isZan: false, //定义一个值,true变红色
      isCollect: false, //定义一个值,true变红色
      LikeForm: {}, //点赞内容
      CollectForm: {}, //收藏内容
      ZAN: ICON.ZAN,
      XIHUAN: ICON.XIHUAN
    };
  },
  computed: {
    ...mapGetters([
      "id",
      "userId", // 用户ID
      "index", // 列表中的序号
      "loginIn" // 用户是否登录
    ])
  },
  // watch: {
  //   id() {
  //     this.getComment();
  //   }
  // },
  mounted() {},
  created() {
    this.isPostLike();
    this.isPostCollect();
  },
  methods: {
    // 查看是否点赞了
    isPostLike() {
      if (this.loginIn) {
        this.LikeForm.uid = this.userId;
        this.LikeForm.type = this.type;
        this.LikeForm.likeId = this.playId;
        HttpManager.selectByLike(this.LikeForm)
          .then(res => {
            if (res.code === 0) {
              // 如果该用户已经点赞了
              if (res.data != null) {
                this.isZan = true;
              }
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    // 查看是否收藏了
    isPostCollect() {
      if (this.loginIn) {
        this.CollectForm.uid = this.userId;
        this.CollectForm.type = this.type;
        this.CollectForm.collectId = this.playId;
        HttpManager.selectByCollect(this.CollectForm)
          .then(res => {
            if (res.code === 0) {
              // 如果该用户已经收藏了
              if (res.data != null) {
                this.isCollect = true;
              }
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    // // 获取所有评论

    // 收藏
    Collect() {
      if (this.loginIn) {
        this.CollectForm.uid = this.userId;
        this.CollectForm.type = this.type;
        this.CollectForm.collectId = this.playId;

        if (this.isCollect) {
          HttpManager.deleteCollect(this.CollectForm)
            .then(res => {
              if (res.code === 0) {
                this.isCollect = !this.isCollect;
                this.notify(res.data, "success");
              } else {
                this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          // 0 代表帖子， 1 代表游戏
          HttpManager.setCollect(this.CollectForm)
            .then(res => {
              console.log(res);
              if (res.code === 0) {
                this.isCollect = !this.isCollect;
                this.notify(res.data, "success");
              } else {
                this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      } else {
        this.notify("请先登录", "warning");
      }
    },
    // 点赞
    Like() {
      if (this.loginIn) {
        this.LikeForm.uid = this.userId;
        this.LikeForm.type = this.type;
        this.LikeForm.likeId = this.playId;
        if (this.isZan) {
          HttpManager.deleteLike(this.LikeForm)
            .then(res => {
              if (res.code === 0) {
                this.isZan = !this.isZan;
                this.notify(res.data, "success");
              } else {
                this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          HttpManager.setLike(this.LikeForm)
            .then(res => {
              if (res.code === 0) {
                this.isZan = !this.isZan;
                this.notify(res.data, "success");
              } else {
                this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      } else {
        this.notify("请先登录", "warning");
      }
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/collect.scss";
</style>
