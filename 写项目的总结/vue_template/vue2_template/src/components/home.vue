<template>
  <div>
    <h1>home</h1>

    <router-view name="homeView"></router-view>
    <button @click="goto()">hello</button>
  </div>
</template>

<script>
export default {
  name: "VueTemplateHome",

  data() {
    return {};
  },

  mounted() {},

  methods: {
    goto() {
      this.$router.push({
        name: "hello",
        params: {
          num: "111",
        },
      });
    },
  },
};
</script>

<style lang="css" scoped>
</style>