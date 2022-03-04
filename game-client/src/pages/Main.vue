<template>
  <div>
    <the-header />
    <the-aside></the-aside>
    <router-view class="music-content" />

    <scroll-top />
    <the-footer />
  </div>
</template>

<script>
import ScrollTop from "../components/ScrollTop";
import TheHeader from "../components/TheHeader";
import TheFooter from "../components/TheFooter";
import TheAside from "../components/TheAside";

export default {
  components: {
    ScrollTop,
    TheHeader,
    TheFooter,
    TheAside
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/main.scss";
</style>
