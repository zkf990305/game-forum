<template>
  <div class="login-logo">
    <svg class="icon" aria-hidden="true">
      <use :xlink:href="GAME"></use>
    </svg>
  </div>
</template>

<script>
import { ICON } from "../assets/icon/index";

export default {
  name: "login-logo",
  data() {
    return {
      GAME: ICON.GAME
    };
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/login-logo.scss";
</style>
