<template>
  <transition name="slide-fade">
    <div class="the-aside" v-if="showAside">
      <h2 class="title">提交留言</h2>
      <el-divider></el-divider>
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="姓名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="ruleForm.phone"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input
            :autosize="{ minRows: 3, maxRows: 4 }"
            type="textarea"
            v-model="ruleForm.content"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addMessage" :disabled="submitButton"
            >提交</el-button
          >
          <el-button @click="setShowAside">取消</el-button>
        </el-form-item>
      </el-form>
    </div>
  </transition>
</template>

<script>
import mixin from "../mixins";
import { mapGetters } from "vuex";
import { HttpManager } from "../api/index";

export default {
  name: "the-aside",
  mixins: [mixin],
  computed: {
    ...mapGetters([
      "showAside" // 是否显示侧边栏
    ])
  },
  data() {
    return {
      submitButton: false,
      ruleForm: {},
      rules: {
        name: [
          { required: true, message: "请输入留言人姓名", trigger: "blur" }
        ],
        phone: [{ required: true, message: "请输入手机号", trigger: "blur" }],
        content: [
          { required: true, message: "请输入留言内容", trigger: "blur" }
        ]
      }
    };
  },

  mounted() {
    // let _this = this;
    // document.addEventListener(
    //   "click",
    //   function() {
    //     _this.$store.commit("setShowAside", false);
    //   },
    //   true
    // );
  },
  methods: {
    setShowAside() {
      this.$store.commit("setShowAside", false);
    },
    addMessage() {
      let _this = this;

      this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          HttpManager.addMessage(this.ruleForm)
            .then(res => {
              if (res.code === 0) {
                this.ruleForm = {};
                _this.notify("留言成功,5秒后可再次提交", "success");
                _this.submitButton = true;
                setTimeout(function() {
                  _this.submitButton = false;
                }, 5000);
              } else {
                _this.notify(res.message, "error");
              }
            })
            .catch(err => {
              console.log(err);
            });
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/the-aside.scss";
</style>
