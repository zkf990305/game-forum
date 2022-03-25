<template>
  <div>
    <div class="comment">
      <h2>
        <span>评论</span>
        <span class="part__tit_desc">共 {{ commentList.length }} 条评论</span>
      </h2>
      <div class="comment-msg">
        <el-input
          class="comment-input"
          type="textarea"
          placeholder="期待您的精彩评论..."
          :rows="2"
          v-model="textarea"
        >
        </el-input>
      </div>
      <el-button type="primary" class="sub-btn" @click="postComment()"
        >发表评论</el-button
      >
    </div>
    <ul
      class="popular"
      v-for="(item, index) in commentList"
      :key="index"
      style="margin-top: 20px"
    >
      <li>
        <div class="popular-img">
          <img :src="attachImageUrl(userPic[index])" alt="" />
        </div>
        <div class="popular-msg">
          <ul>
            <li class="name">{{ userName[index] }}</li>
            <li class="content">{{ item.content }}</li>
            <li class="time">{{ item.gmtCreate }}</li>
          </ul>
        </div>
        <div
          class="like"
          ref="like"
          @click="postLike(item.id, item.like, index)"
        >
          <svg class="icon" aria-hidden="true">
            <use :xlink:href="ZAN"></use>
          </svg>
          {{ item.like }}
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";
import { ICON } from "../assets/icon/index";

export default {
  name: "comment",
  mixins: [mixin],
  props: {
    playId: Number, // 帖子id / 游戏id
    type: Number // 评论类型（0帖子 1游戏）
  },
  data() {
    return {
      CommentForm: {}, //添加评论内容
      commentList: [], // 存放评论内容
      userPic: [], // 保存评论用户头像
      userName: [], // 保存评论用户名字
      textarea: "", // 存放输入内容
      likeForm: {}, // 点赞
      ZAN: ICON.ZAN
    };
  },
  computed: {
    ...mapGetters([
      "id",
      "userId", // 用户ID
      "index", // 列表中的序号
      "loginIn", // 用户是否登录
      "avatar" // 用户头像
    ])
  },
  watch: {
    id() {
      this.getComment();
    }
  },
  mounted() {
    this.getComment();
  },
  methods: {
    // 查看是否点赞了
    // isPostLike() {
    //   if (this.loginIn) {
    //     let temp = 0;
    //     for (let item of this.commentList) {
    //       console.log("--", item);
    //       this.likeForm.uid = this.userId;
    //       this.likeForm.type = 2;
    //       this.likeForm.likeId = item.id;
    //       HttpManager.selectByLike(this.likeForm)
    //         .then(res => {
    //           if (res.code === 0) {
    //             // 如果该用户已经点赞了
    //             if (res.data != null) {
    //               this.$refs.like[temp].children[0].style.color = "#2796dd";
    //             }
    //           }
    //         })
    //         .catch(err => {
    //           console.log(err);
    //         });
    //       temp = temp + 1;
    //     }
    //   }
    // },
    // 获取所有评论
    getComment() {
      HttpManager.getAllComment(this.type, this.playId)
        .then(res => {
          if (res.code === 0) {
            this.commentList = res.data;
            for (let item of res.data) {
              this.getUsers(item.uid);
            }
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取评论用户的昵称和头像
    getUsers(id) {
      HttpManager.getGfUserInfoByUserId(id)
        .then(res => {
          if (res.code === 0) {
            this.userPic.push(res.data.avatarUrl);
            this.userName.push(res.data.username);
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 提交评论
    postComment() {
      if (
        this.textarea == "undefined" ||
        this.textarea == null ||
        this.textarea == ""
      ) {
        this.notify("评论内容不能为空", "error");
        return;
      }
      if (this.loginIn) {
        // console.log(this.userId + "---" + this.playId);
        // if (this.userId == this.playId) {
        //   this.CommentForm.status = 1;
        // }
        this.CommentForm.uid = this.userId;
        this.CommentForm.type = this.type;
        this.CommentForm.commentId = this.playId;
        this.CommentForm.content = this.textarea;
        // 0 代表帖子， 1 代表游戏
        HttpManager.setComment(this.CommentForm)
          .then(res => {
            if (res.code === 0) {
              this.textarea = "";
              this.getComment();
              this.notify("评论成功", "success");
            } else {
              this.notify("评论失败", "error");
            }
          })
          .catch(err => {
            console.log(err);
          });
      } else {
        this.notify("请先登录", "warning");
      }
    },
    // 点赞
    postLike(id, like, index) {
      if (this.loginIn) {
        this.likeForm.uid = this.userId;
        this.likeForm.type = 2;
        this.likeForm.likeId = id;
        HttpManager.setLike(this.likeForm)
          .then(res => {
            if (res.code === 0) {
              this.$refs.like[index].children[0].style.color = "#2796dd";
              this.getComment();
            } else {
              this.notify(res.message, "error");
            }
          })
          .catch(err => {
            console.log(err);
          });
      } else {
        this.notify("请先登录", "warning");
      }
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/comment.scss";
</style>
