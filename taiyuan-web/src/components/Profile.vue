<template>
  <div class="pro">

    <div class="me">
      <section class="banner"></section>
    </div>

    <div class="pro-file">
      <div class="myinfo">
        <span class="texiao">KNOWEIのBLOG</span><br/>
        <div class="myinfo-yiQ">
          <div class="yiyan">我可以孑然一身，但不能心无所属</div>
          <div>
            <a href="">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-QQ1"></use>
              </svg>
            </a>
            <a href="">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-githubb"></use>
              </svg>
            </a>

            <a href="https://space.bilibili.com/225564141" target="_blank">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-bilibili"></use>
              </svg>
            </a>

          </div>
        </div>
      </div>
    </div>
    <div class="down" @click="goDown"></div>
  </div>
</template>

<script>
export default {
  methods: {
    goDown() {
      console.log(document.documentElement.clientHeight)

      let timer = -1
      let scrollTo = document.documentElement.scrollTop || document.body.scrollTop
      if (timer === -1) {
        timer = setInterval(() => {
          scrollTo += 20
          if (scrollTo >= document.documentElement.clientHeight) {
            scrollTo = document.documentElement.clientHeight
            window.clearInterval(timer)
            timer = -1
          }
          window.scrollTo(document.documentElement.clientHeight, scrollTo)
        }, 10);
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.myinfo-yiQ {
  background: #7f7f7f76;
  max-width: 400px;
  // align-content: center;
  padding: 10px;
  margin: 0 auto;
  border-radius: 7px;

  .yiyan {
    margin-bottom: 20px;
    z-index: 30;
    font-weight: 600;
    font-size: 1.2em;
    background-image: -webkit-linear-gradient(left, #e9a5a5, #b8c1c0 10%, #65c0e0 20%, #aea2db 30%, #81c1d9 40%, #e9a5a5 50%, #b8c1c0 60%, #65c0e0 70%, #aea2db 80%, #81c1d9 90%, #e9a5a5);
    color: transparent;
    -webkit-background-clip: text;
    background-size: 200% 100%;
    animation: a 5s infinite linear;
  }

  @keyframes a {
    0% {
      background-position: 0 0;
    }

    100% {
      background-position: -100% 0;
    }
  }

  svg {
    width: 26px;
    height: 26px;
    margin: 0 10px;
    cursor: pointer;
  }

}

.texiao {
  font-weight: 800;
  font-size: 3em;
  letter-spacing: 5px;
  color: #fff;
  mix-blend-mode: lighten;
  transition: all 1s;
}

.texiao:before {
  left: 1px;
  text-shadow: 5px 5px #22c8ed;
}

.texiao:hover {
  // color: #ed0909;
  left: -3px;
  text-shadow: 5px 5px #22aced;
}

// .texiao:before {
//     left: -1px;
//     text-shadow: 4px 0 #ff3f1a;
// }

.banner {
  position: relative;
  width: 100%;
  height: 100vh;
  //background: url(https://tvax1.sinaimg.cn/large/006MWoJqgy1h299wqkpalj31e010s1ip.jpg);
  background-size: cover;
}

.pro-file {
  width: 100%;
  height: 100%;
  background: rgba(94, 92, 92, 0.294);
  // border: 1px solid #ccc;
  position: absolute;
  top: 0;
  left: 0;

}

.myinfo {
  text-align: center;
  margin: 500px 0;
}

.down {
  color: rgb(254, 254, 254);
  width: 54px;
  height: 60px;
  position: absolute;
  cursor: pointer;
  left: 50%;
  bottom: 120px;
  margin-left: -27px;
  background: url("@/assets/img/jiantou.png") center no-repeat;
  -webkit-background-size: 100% 100%;
  background-size: 100% 100%;
  animation: arrow-load 2s infinite;
}

//动画
@keyframes arrow-load {
  0% {
    opacity: 0;
  }

  50% {
    opacity: 1;
    bottom: 90px;
  }

  100% {
    opacity: 1;
    bottom: 80px;
  }
}
</style>
