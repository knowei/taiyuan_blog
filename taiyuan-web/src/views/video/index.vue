<template>
  <div class="video">
    <div class="cotainer">
      <iframe height=700px width=100%
              src="https://xbeibeix.com/api/bilibili/biliplayer/?url=https://www.bilibili.com/video/BV1P7411B71g/"
              scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
    </div>
  </div>
</template>

<script>
export default {
  meta: {
    index: 3
  },
}
</script>

<style lang="less" scoped>
.cotainer {
  margin-top: 100px;
  padding-bottom: 50px;
  background: rgba(255, 255, 255, 0.443);
  padding-top: 50px;
  position: relative;
  max-width: 80%;
  margin-left: auto;
  margin-right: auto;
  animation: header-menu 1.8s;
}
</style>