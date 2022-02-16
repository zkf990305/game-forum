<template>
  <div class="search">
    <nav class="searchList-nav" ref="change">
      <span
        :class="{ isActive: toggle === 'Games' }"
        @click="handleChangeView('Games', 0)"
        >游戏</span
      >
      <span
        :class="{ isActive: toggle === 'Posts' }"
        @click="handleChangeView('Posts', 1)"
        >帖子</span
      >
    </nav>
    <component :is="currentView"></component>
  </div>
</template>

<script>
import mixin from "../mixins";
import SearchGames from "../components/search/SearchGames";
import SearchPosts from "../components/search/SearchPosts";
import { mapGetters } from "vuex";

export default {
  name: "search",
  mixins: [mixin],
  components: {
    SearchGames,
    SearchPosts
  },
  data() {
    return {
      toggle: "Games",
      currentView: "searchGames"
    };
  },
  computed: {
    ...mapGetters(["searchword"])
  },
  watch: {
    searchword: function() {
      this.getSong();
    }
  },
  methods: {
    // 切换组件
    handleChangeView: function(component) {
      this.currentView = "search" + component;
      this.toggle = component;
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/search.scss";
</style>
