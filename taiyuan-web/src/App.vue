<template>
  <div id="app">
    <transition :name="transitionName">
      <router-view/>
    </transition>

  </div>
</template>

<script>
export default {
  data() {
    return {
      transitionName: ''
    }
  },
  watch: {
    $route(to, from) {
      if (to.meta.index > from.meta.index) {
        //设置动画名称
        this.transitionName = "slide-left";
      } else {
        this.transitionName = "slide-right";
      }

    }
  }
}
</script>

<style>


.slide-right-enter-active,
.slide-right-leave-active,
.slide-left-enter-active,
.slide-left-leave-active {
  will-change: transform;
  transition: all 500ms;
  /* position: absolute; */
}

.slide-right-enter {
  opacity: 0;
  transform: translateX(-100%);
}

.slide-right-leave-active {
  opacity: 0;
  transform: translateX(100%);
}

.slide-left-enter {
  opacity: 0;
  transform: translateX(100%);
}

.slide-left-leave-active {
  opacity: 0;
  transform: translateX(-100%);
}
</style>
