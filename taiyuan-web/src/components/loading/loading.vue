<template>
  <div class="htmleaf-container">
    <div class="loader">
      <div class="my-loading"></div>
      <div class="my-loading-text">加载中...</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "",
  data() {
    return {};
  },
  props: {},
  components: {},
  methods: {},
  created() {
  },
  mounted() {
  },
  beforeDestroy() {
  },
};
</script>

<style lang="scss" scoped>
/* .container-loading {
  height: 100%;
  width: 100%;
} */
.htmleaf-container {
  z-index: 1000;
  height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  font-size: 12px;

  min-height: 60px;
  background-color: rgba(255, 255, 255, 0.8);
}

.loader {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 60px;
}

.loader .my-loading {
  position: relative;
  width: 100%;
  height: 10px;
  border: 1px solid #419ae8;
  border-radius: 10px;
  animation: turn 1s linear 0.42s infinite;
}

.loader .my-loading:before {
  content: "";
  display: block;
  position: absolute;
  width: 0%;
  height: 100%;
  background: #419ae8;
  box-shadow: 10px 0px 15px 0px #419ae8;
  animation: load .5s linear infinite;
}

.loader .my-loading-text {
  width: 100%;
  position: absolute;
  top: 10px;
  color: #419ae8;
  text-align: center;
  animation: bounce .5s linear infinite;
}

@keyframes load {
  0% {
    width: 0%;
  }

  87.5%,
  100% {
    width: 100%;
  }
}

@keyframes turn {
  0% {
    transform: rotateY(0deg);
  }

  6.25%,
  50% {
    transform: rotateY(180deg);
  }

  56.25%,
  100% {
    transform: rotateY(360deg);
  }
}

@keyframes bounce {
  0%,
  100% {
    top: 10px;
  }

  12.5% {
    top: 30px;
  }
}
</style>