<template>
  <div>


    <div class="rig">
      <span>404喽</span>
    </div>

    <div class="img">

    </div>
  </div>
</template>

<script>
export default {}
</script>

<style lang="less" scoped>
.img {
  // position: relative;

  float: right;
  width: 50%;
  height: 100vh;
  background: url("@/assets/img/404.png");
  background-size: cover;
}

.rig {
  position: absolute;
  width: 50%;
  height: 100vh;
  display: block;

  span {
    position: absolute;
    margin-top: 50%;
    font-size: 40px;
    margin-left: 40%;
    font-weight: 900;
    letter-spacing: 10px;
  }
}
</style>