<template>
  <div>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <span>是否放弃编辑？</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="goHome">确 定</el-button>
      </span>
    </el-dialog>

    <el-container>
      <el-header>
        <div class="md-header">
          <!--图标-->
          <el-tooltip
            class="item"
            effect="dark"
            content="Game 首页"
            placement="top-start"
          >
            <div class="header-logo" @click="goHome">
              <svg class="icon" aria-hidden="true">
                <use :xlink:href="GAME"></use>
              </svg>
              <span>{{ gameName }}</span>
            </div>
          </el-tooltip>

          <el-link
            class="navbar"
            href="https://element.eleme.io"
            target="_blank"
            ><i class="el-icon-arrow-left"></i> 帖子管理</el-link
          >

          <!--设置-->
          <div class="header-right" v-show="loginIn">
            <el-button type="info" plain @click="dialogVisible = true"
              >取消</el-button
            >

            <el-button type="success" round @click="addPost"
              >发布文章</el-button
            >

            <div id="user">
              <!-- 头像 -->

              <el-avatar
                :size="60"
                :src="attachImageUrl(avatar)"
                @error="errorHandler"
              >
                <img
                  src="https://cube.elemecdn.com/e/fd/0fc7d20532fdaf769a25683617711png.png"
                />
              </el-avatar>
            </div>
            <ul class="menu">
              <li
                v-for="(item, index) in postMenuList"
                :key="index"
                @click="goMenuList(item.path)"
              >
                {{ item.name }}
              </li>
            </ul>
          </div>
        </div>
      </el-header>
      <el-container style="padding-top: 15px">
        <el-main>
          <el-form :model="postForm" :rules="rules" ref="postForm">
            <el-form-item label="标题" prop="title">
              <el-input
                placeholder="请输入文章标题"
                v-model="postForm.title"
                style="width: 95%"
                maxlength="100"
                show-word-limit
                clearable
              ></el-input>
            </el-form-item>

            <div id="div1"></div>
          </el-form>
        </el-main>
        <el-aside
          width="300px"
          style="box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1); "
        >
          <div style="margin-left: 20px;">
            <el-form :model="postForm" :rules="rules" ref="postForm">
              <el-form-item label="文章标签:" prop="tags">
                <!-- <br /> -->
                <el-select
                  v-model="postForm.tags"
                  multiple
                  value-key="id"
                  collapse-tags
                  placeholder="请选择"
                >
                  <el-option
                    v-for="item in postTag"
                    :key="item.id"
                    :label="item.tag"
                    :value="item"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="选择分类:" prop="classify">
                <!-- <br /> -->
                <el-select
                  v-model="postForm.classify"
                  placeholder="请选择"
                  value-key="id"
                  size="medium"
                  clearable
                >
                  <el-option
                    v-for="item in postClassify"
                    :key="item.id"
                    :label="item.classify"
                    :value="item"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                配置封面:
                <br />
                <el-upload
                  class="avatar-uploader"
                  action="https://jsonplaceholder.typicode.com/posts/"
                  :show-file-list="false"
                  :on-success="handleAvatarSuccess"
                  :before-upload="beforeAvatarUpload"
                >
                  <img v-if="imageUrl" :src="imageUrl" class="avatar" />
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
                <label style="color:#909399"
                  >建议上传320*180的 jpg、jpeg、png图片</label
                >
              </el-form-item>
              <el-form-item>
                配置摘要（选填）：
                <br />
                <el-input
                  type="textarea"
                  placeholder="请输入内容摘要"
                  v-model="postForm.outline"
                  maxlength="100"
                  show-word-limit
                >
                </el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-aside>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import mixin from "../mixins";
import { BASE_URL } from "../api/config";
import E from "wangeditor";
import { mapGetters } from "vuex";
import { postMenuList } from "../assets/data/header";
import { ICON } from "../assets/icon/index";
import { HttpManager } from "../api/index";
import TheFooter from "../components/TheFooter.vue";

let editor;
export default {
  components: { TheFooter },
  name: "md",
  mixins: [mixin],
  BASE_URL: [BASE_URL],
  data() {
    return {
      imageUrl: "",
      // 帖子分类列表
      postClassify: [],
      // 帖子标签列表
      postTag: [],
      dialogVisible: false,
      postForm: {
        title: "【无标题】",
        tags: []
      },
      rules: {
        title: [
          { required: true, message: "请输入文章标题", trigger: "blur" },
          {
            min: 5,
            max: 100,
            message: "标题长度在 5 到 100 个字符之间",
            trigger: "blur"
          }
        ],
        tags: [{ required: true, message: "请添加文章标签", trigger: "blur" }],
        classify: [
          { required: true, message: "请添加文章分类", trigger: "blur" }
        ]
      },
      gameName: "Game",

      GAME: ICON.GAME,
      postMenuList: postMenuList // 用户下拉菜单项
    };
  },
  computed: {
    ...mapGetters(["userId", "activeName", "avatar", "username", "loginIn"])
  },
  mounted() {
    document.querySelector("#user").addEventListener(
      "click",
      function(e) {
        document.querySelector(".menu").classList.add("show");
        e.stopPropagation(); // 关键在于阻止冒泡
      },
      false
    );
    // 点击“菜单”内部时，阻止事件冒泡。(这样点击内部时，菜单不会关闭)
    document.querySelector(".menu").addEventListener(
      "click",
      function(e) {
        e.stopPropagation();
      },
      false
    );
    document.addEventListener(
      "click",
      function() {
        document.querySelector(".menu").classList.remove("show");
      },
      false
    );

    this.load();
    this.getAllPostClassify();
    this.getAllPostTag();
  },
  methods: {
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
    errorHandler() {
      return true;
    },
    goHome() {
      this.dialogVisible = false;
      this.$router.push({ path: "/" });
    },
    load() {
      editor = new E("#div1");
      editor.config.zIndex = 5;
      // 设置编辑区域高度为 500px
      editor.config.height = 900;

      // 配置颜色（文字颜色、背景色）
      editor.config.colors = ["#000000", "#eeece0", "#1c487f", "#4d80bf"];
      // 配置 server 接口地址
      editor.config.uploadImgServer = BASE_URL + "/files/editor/upload";
      // 设置上传参数名称
      editor.config.uploadFileName = "file";
      // 限制大小
      editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M
      editor.config.uploadImgMaxLength = 5; // 一次最多上传 5 个图片
      editor.config.uploadImgHooks = {
        // 上传图片之前
        before: function(xhr) {
          // console.log(xhr);
          // 可阻止图片上传
          // return {
          //   prevent: true,
          //   msg: "需要提示给用户的错误信息"
          // };
        },
        // 图片上传并返回了结果，图片插入已成功
        success: function(xhr) {
          console.log("success", xhr, "上传成功");
        },
        // 图片上传并返回了结果，但图片插入时出错了
        fail: function(xhr, editor, resData) {
          console.log("上传失败,原因是", "fail", resData);
        },
        // 上传图片出错，一般为 http 请求的错误
        error: function(xhr, editor, resData) {
          console.log("error", xhr, resData, "上传出错");
        },
        // 上传图片超时
        timeout: function(xhr) {
          console.log("timeout", "上传超时");
        }
        // 图片上传并返回了结果，想要自己把图片插入到编辑器中
        // 例如服务器端返回的不是 { errno: 0, data: [...] } 这种格式，可使用 customInsert
        // customInsert: function(insertImgFn, result) {
        //   // result 即服务端返回的接口
        //   console.log("customInsert", result);

        //   // insertImgFn 可把图片插入到编辑器，传入图片 src ，执行函数即可
        //   insertImgFn(result.data[0]);
        // }
      };
      editor.create();
    },
    // 获取帖子分类列表
    getAllPostClassify() {
      HttpManager.getAllPostClassify()
        .then(res => {
          if (res.code === 0) {
            console.log(res.data);
            this.postClassify = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取帖子标签列表
    getAllPostTag() {
      HttpManager.getAllPostTag()
        .then(res => {
          if (res.code === 0) {
            this.postTag = res.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    addPost() {
      let _this = this;

      this.$refs["postForm"].validate(valid => {
        if (valid) {
          this.postForm.content = editor.txt.html();
          this.postForm.authorId = this.userId;
          this.postForm.authorName = this.username;
          this.postForm.authorAvatar = this.avatar;
          this.postForm.gmtCreate = new Date();
          this.postForm.gmtUpdate = new Date();
          this.postForm.status = 0;
          console.log(this.postForm);
          // // 日期格式转
          HttpManager.addPost(this.postForm)
            .then(res => {
              console.log(res);
              if (res.code === 0) {
                _this.notify("发布成功", "success");
                setTimeout(function() {
                  // _this.$router.push({ path: "/" });
                }, 2000);
              } else {
                _this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      });
    },
    // 上传图片
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    }
  }
};
</script>

<style lang="scss" scoped>
.el-aside {
  background-color: #ffffff;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
@import "../assets/css/md-header.scss";
</style>
