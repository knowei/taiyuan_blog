<template>
  <div class="tag" style="margin-bottom: 200px;">
    <div class="index-content" flex="auto" @scroll=handleScrollScroll()>

      <div class="category-list">
        <div class="category-item" v-for="(item, index) in tagList" @click="getPost(item.id)"> {{ item.name }}</div>
      </div>

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
                  {{ item.commentCount }} 评论
                </div>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-wenjianjia"></use>
                  </svg>
                  {{ getCategoryName(item.categoryId) }}
                </div>
              </div>
              <div class="article-des">
                {{ item.summary }}
              </div>
            </div>
            <div class="article-item-right" :class="{arleft: index % 2 == 0}">
              <router-link :to="{name: 'article', params:{id: item.id}}"><img class="article-img"
                                                                              :class="{arright: index % 2 == 0}"
                                                                              :src="item.coverImage	"/>
              </router-link>
            </div>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Profile from '@/components/Profile.vue';
//鼠标样式
import "@/assets/js/shubiao"
import {getAllTag, getArticlesById} from "@/api/tag"
import Loading from "@/components/loading/loading.vue";
import {getAllCategory} from "@/api/category";

export default {
  meta: {
    index: 2
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
      tagList: '',
      categoryList: ''
    }
  },
  methods: {
    go(id, str, name) {
      if (str === 'cate') {
        this.$router.push({
          name: 'category',
          params: {
            title: name,
            id: id

          }
        })
      }
    },
    getTag() {
      getAllTag().then(res => {
        this.tagList = res
      })
      getAllCategory().then(res => {
        this.categoryList = res
      })
    },
    getPost(id) {
      getArticlesById(id).then(res => {
        this.articleList = res
      })
    },
    getCategoryName(id) {
      const category = this.categoryList.find(item => item.id == id);
      return category ? category.name : '未知分类';
    }
  },
  mounted() {
    //监听滚动条增加动画
    window.addEventListener('scroll', this.windowScroll)

  },
  created() {
    this.getTag()
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

.category-list {
  display: flex;
  justify-content: flex-start;
  margin-bottom: 20px;

  .category-item {
    border: 1px solid #5cc8e4;
    display: inline-block;
    padding: 10px;
    margin-right: 40px;
    border-radius: 50px;
    cursor: pointer;
  }
}

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
