<template>
  <div class="error-page">
    <div class="error-code">
      404
    </div>
    <div class="error-home">
      <el-button type="warning" @click="goHome">返回首页</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "error-page",
  methods: {
    goHome() {
      this.$router.push({ path: "/" });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/404.scss";
</style>
