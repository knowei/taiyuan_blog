<template>
  <div class="home">
    <Header/>

    <div v-show="!articleList.length">
      <Loading/>
    </div>

    <section v-if="this.$route.path != '/'">
      <transition :name="transitionName">
        <router-view :key="1"/>
      </transition>
    </section>
    <section v-else>
      <Profile/>
      <!-- //滚动条监听 -->
      <div class="index-content" flex="auto" @scroll=handleScrollScroll()>
        <div style="font-size: 16px; font-weight: 700;letter-spacing: 1px;margin-bottom: 10px;">文章</div>
        <hr style="margin-bottom: 20px;">

        <div class="box">

          <article class="article-item" v-for="(item, index) in articleList" :key="index">
            <div class="article-list">
              <div class="article-span " :class="{arright:index % 2 == 0}">
                <div class="article-time">
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-shijian"></use>
                  </svg>
                  发表于 {{ item.createTime }}
                </div>
                <div class="article-title">
                  <router-link to="/view">
                    <router-link :to="{name: 'article', params:{id: item.id}}">
                      <h1>{{ item.title }}</h1>
                    </router-link>
                  </router-link>
                </div>

                <div class="article-ex">
                  <div>
                    <svg class="icon" aria-hidden="true">
                      <use xlink:href="#icon-31pinglun"></use>
                    </svg>
                    {{ item.count }} 评论
                  </div>
                  <div>
                    <svg class="icon" aria-hidden="true">
                      <use xlink:href="#icon-wenjianjia"></use>
                    </svg>
                    {{ item.categoryName }}
                  </div>
                </div>
                <div class="article-des">
                  {{ item.summary }}
                </div>
              </div>
              <div class="article-item-right" :class="{arleft: index % 2 == 0}">
                <router-link :to="{name: 'article', params:{id: item.id}}"><img class="article-img"
                                                                                :class="{arright: index % 2 == 0}"
                                                                                :src="item.coverImage"/>
                </router-link>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <meting-js server="netease" type="playlist" id="7637776489" fixed="true" autoplay="false" loop="all" order="list"
               preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">
    </meting-js>

    <footer>
      <div class="my-footer">
        <div class="font-name">knowei by design</div>
      </div>
    </footer>
  </div>
</template>

<script>
import $ from "jquery"
import Header from '@/components/Header.vue';
import Profile from '@/components/Profile.vue';
//鼠标样式
// import "@/assets/js/shubiao"
import {getAtricleList} from "@/api/article"
import Loading from "@/components/loading/loading.vue";

export default {
  meta: {
    index: 0
  },
  name: 'Home',
  components: {
    Header,
    Profile,
    Loading
  },
  data() {
    return {
      current: 1,
      pageSize: '',
      total: '',
      articleList: [],
      pageVo: {
        pageNum: 1,
        page: '',
        pageSize: 10,
        total: ''
      },
      loading: false,
      transitionName: ''
    }
  },
  methods: {
    // 获取全部文章
    getAll() {
      getAtricleList(this.pageVo).then(res => {
        this.articleList = res.list
      })
    },
    // 加载更多文章
    onLoad() {
      for (let i = 0; this.pageVo.current < this.pageVo.pageSize, i <= 0; i++) {
        getAtricleList(this.pageVo.current + 1).then(res => {
          if (res.data.code === 200) {
            for (let i = 0; i < res.data.data.length; i++) {
              this.articleList.push(res.data.data[i])
            }
            this.pageVo = res.data.pageVo
          }
        })
      }

      // 加载状态结束
      this.loading = false;

      // 数据全部加载完成
      if (this.total >= 6) {
        this.finished = true;
      }
    },
    windowScroll() {
      //动画加载文章列表
      const list = document.querySelectorAll(".article-item");
      const windowHeight = window.innerHeight
      list.forEach(item => {
        const rect = item.getBoundingClientRect()
        const y = rect.y
        if (y > windowHeight - 100) {
          item.classList.remove("show")
        } else {
          item.classList.add("show")
        }
      })

      //下拉加载文章列表
      var scrollTop = document.documentElement.scrollTop;
      var scrollHeight = document.documentElement.scrollHeight;
      var windowHeight1 = document.documentElement.clientHeight;
      ;

      if (scrollTop + windowHeight1 == scrollHeight && this.pageVo.current * 2 <= this.pageVo.total) {
        this.onLoad()
      }
    }
  },
  mounted() {
    //监听滚动条增加动画
    window.addEventListener('scroll', this.windowScroll)

  },
  created() {
    this.getAll()


  },
  watch: {
    $route(to, from) {
      //如果to索引大于from索引,判断为前进状态,反之则为后退状态
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

<style lang="less" scoped>
@import url("@/assets/scss/lbtu.scss");
@import url("@/assets/css/APlayer.min.css");
@import url("@/assets/css/cur.css");

.arright {
  border-bottom-right-radius: 0px !important;
  border-top-right-radius: 0px !important;
  border-bottom-left-radius: 10px !important;
  border-top-left-radius: 10px !important;
}

.arleft {
  float: left;
  border-bottom-right-radius: 0px !important;
  border-top-right-radius: 0px !important;
  border-bottom-left-radius: 10px !important;
  border-top-left-radius: 10px !important;
}

.arright {
  float: right;
  margin-right: 15px;
}


span {
  display: block;
  position: absolute;
  border-radius: 50%;
  box-shadow: 0.4px 0.4px 0.4px 0px #fff;
}

footer {

  // position: fixed;
  clear: both;
  // position: absolute;
  min-height: 100px;
  padding: 15px 0;
  color: #888;
  line-height: 1.5;
  background-image: linear-gradient(135deg, #ABDCFF 10%, #0396FF 100%);


  .font-name {

    text-align: center;
    font-weight: 700;
    font-size: 20px;

  }
}

svg {
  height: 20px;
  width: 20px;
  padding-top: 3px;
  padding-right: 3px;
}
</style>