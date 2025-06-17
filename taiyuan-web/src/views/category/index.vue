<template>
  <div class="category" style="margin-bottom: 200px;">
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
                    <h1>{{ item.articleTitle }}</h1>
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
                  {{ item.category.categoryName }}
                </div>
              </div>
              <div class="article-des">
                {{ item.articleDescribe }}
              </div>
            </div>
            <div class="article-item-right" :class="{arleft: index % 2 == 0}">
              <router-link :to="{name: 'article', params:{id: item.id}}"><img class="article-img"
                                                                              :class="{arright: index % 2 == 0}"
                                                                              :src="item.articleCover"/>
              </router-link>
            </div>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>

<script>
import $ from "jquery"
import Header from '@/components/Header.vue';
import Profile from '@/components/Profile.vue';
//鼠标样式
import "@/assets/js/shubiao"
import {getAtricleList} from "@/api/article"
import {getCategoryById} from "@/api/category"
import Loading from "@/components/loading/loading.vue";

export default {
  meta: {
    index: 1
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
      categoryName: ''

    }
  },
  methods: {
    // 获取全部文章
    getAll() {

      getCategoryById(this.$route.params.id).then(res => {
        if (res.data.code === 200) {
          this.articleList = res.data.data
          this.total = this.articleList[0].category.count
        }
      })
    },
  },
  mounted() {
    //监听滚动条增加动画
    window.addEventListener('scroll', this.windowScroll)

  },
  created() {
    this.getAll()
  },
  watch: {
    '$route'(to, from) {
      //你在create里的方法
      //你在mounted里的方法
      this.getAll()
    }
  },
}
</script>

<style lang="less" scoped>
@import url("@/assets/scss/lbtu.scss");

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
svg {
  height: 20px;
  width: 20px;
  padding-top: 3px;
  padding-right: 3px;
}
</style>