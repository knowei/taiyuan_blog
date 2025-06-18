<template>
  <div class="my-header">
    <header class="header">
      <router-link to="/" class="logo">LOGO</router-link>
      <ul>
        <li>
          <router-link to="/">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-shouye"></use>
            </svg>
          </router-link>
        </li>
        <li class="one">
          <router-link to="/category">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-biji"></use>
            </svg>
          </router-link>

        </li>
        <li class="one">
          <router-link to="/tag">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-biaoqian"></use>
            </svg>
          </router-link>
        </li>
        <li>
          <router-link to="/video">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-dianshijuA"></use>
            </svg>
          </router-link>
        </li>
        <li>
          <router-link to="/archive">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-guidang"></use>
            </svg>
          </router-link>
        </li>
        <li>
          <router-link to="/my">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-shoucang"></use>
            </svg>
          </router-link>
        </li>
        <li @click="openSearch">
          <a to="">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-a-rongqi2021x"></use>
            </svg>
          </a>
        </li>
      </ul>
    </header>

    <transition @before-enter="beforeEnter"
                @after-enter="afterEnter"
                @before-leave="beforeLeave"
                @after-leave="afterLeave" name="search-fade">
      <!-- 全屏搜索弹窗 -->
      <div class="search-overlay" v-if="showSearch">
        <div class="search-container">
          <input class="search-input" ref="searchInput" v-model="searchText" placeholder="请输入"
                 @keyup.enter="searchArticle">
          <hr class="hr-dashed2">
          <div v-for="(item, index) in searchResults">
            <a class="search-a" @click="toPost(item.id)">
              <h1>{{ item.title }}</h1>
            </a>
            <hr class="hr-solid">
        </div>
      </div>
      </div>
    </transition>

  </div>
</template>

<script>
import "@/assets/js/header"
import {getAllTag} from "@/api/tag"
import {getAllCategory} from '@/api/category';
import {getAtricleList} from '@/api/article'

export default {
  data() {
    return {
      categoryList: [],
      tagList: [],
      showSearch: false,
      searchText: '',
      searchResults: [] // 存储搜索结果
    };
  },
  methods: {
    toPost(id) {
      this.$router.push({
        name: 'article',
        params: {
          id: id
        }
      })
      this.closeSearch()
    },
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
      if (str === 'tag') {
        this.$router.push({
          name: 'tag',
          params: {
            title: name,
            id: id

          }
        })
      }
    },
    getCategory() {
      getAllCategory().then(res => {
        console.log(res)
        this.categoryList = res
      })
    },
    getTags() {
      getAllTag().then(res => {
        this.tagList = res
      })
    },
    openSearch() {
      this.showSearch = true;
      // 确保DOM更新后聚焦到输入框
      // this.$nextTick(() => {
      //   this.$refs.searchInput.focus();
      // });

      // 添加键盘ESC事件监听
      document.addEventListener('keydown', this.handleKeyDown);
      // // 禁止背景滚动
      document.body.classList.add('no-scroll');
    },
    closeSearch() {
      this.showSearch = false;
      this.searchResults = []
      // 移除事件监听
      document.removeEventListener('keydown', this.handleKeyDown);
      // 恢复背景滚动
      document.body.classList.remove('no-scroll');
    },
    handleKeyDown(event) {
      // 按ESC键关闭搜索框
      if (event.key === 'Escape') {
        this.closeSearch();
      }
    },
    searchArticle() {
      getAtricleList({title: this.searchText}).then(res => {
        this.searchResults = res.list
      })
    },
    beforeEnter(el) {
      el.classList.add('enter-active');
    },
    afterEnter(el) {
      el.classList.remove('enter-active');
    },
    beforeLeave(el) {
      el.classList.add('leave-active');
    },
    afterLeave(el) {
      el.classList.remove('leave-active');
    },
  },
  created() {
    this.getCategory()
    this.getTags()
    // document.body.classList.add('no-scroll');

  },

  beforeDestroy() {
    // 组件销毁前移除事件监听
    document.removeEventListener('keydown', this.handleKeyDown);
    document.body.classList.remove('no-scroll');
  }

}
</script>

<style lang="less" scoped>

.search-a {
  text-decoration: none;
}

.hr-solid {
  margin: 15px 0;
  border: 0;
  border-top: 1px solid #d0d0d5;
}

.hr-dashed2 {
  margin: 20px 0;
  border: 0;
  border-top: 2px dashed #a2a9b6;
}

/* 全屏搜索弹窗样式 */
.search-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgb(87, 85, 85);
  z-index: 1000;
  opacity: 0.9;
  display: flex;
  justify-content: center;
  //align-items: center;
  backdrop-filter: blur(5px);

}

/* 进入动画 */
.search-overlay.enter-active {
  animation: fadeInOut 0.3s;
}

/* 退出动画 */
.search-overlay.leave-active {
  animation: fadeOutIn 0.3s;
}

@keyframes fadeOutIn {
  0% {
    opacity: 0.9;
  }
  100% {
    opacity: 0;
    transform: scale(0.6);
  }
}

@keyframes fadeInOut {
  0% {
    opacity: 0;
    transform: scale(0.6);
  }
  100% {
    opacity: 0.9;
  }
}

.search-container {
  width: 90%;
  max-width: 800px;
  position: relative;

  .search-input {
    width: 100%;
    height: 50px;
    border: 2px solid white;
    padding: 10px 20px;
    margin-top: 30px;
    color: white;
    border-radius: 50px;
    background: transparent;
    outline: none;
  }
}

.search-close {
  position: absolute;
  top: -60px;
  right: 0;
  background: transparent;
  border: none;
  color: #fff;
  font-size: 28px;
  cursor: pointer;
  transition: transform 0.3s;

  .icon {
    width: 30px;
    height: 30px;
    fill: white;
  }

  &:hover {
    transform: rotate(90deg);
  }
}

svg {
  width: 25px;
  height: 25px;
  margin: 0 10px;
}

.header {
  background-image: linear-gradient(25deg, #a7bdf377, #c1cfe274, #d7e3d186, #ebf6be73);
  z-index: 100;
  position: fixed;
  top: 0;
  left: 0;

  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  transition: 0.6s;
  padding: 20px 100px;

  .logo {
    position: relative;
    text-decoration: none;
    text-transform: uppercase;
    font-weight: 700;
    color: black;
    letter-spacing: 2px;
    font-size: 2em;
    transition: 0.6s;
  }

  ul {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;

    li {
      position: relative;
      list-style: none;

      a {
        position: relative;
        margin: 0 15px;
        text-decoration: none;
        color: #fff;
        letter-spacing: 2px;
        font-weight: 500px;
        transition: 0.6s;
      }
    }
  }

}

.header.sticky {
  padding: 5px 100px;
  background: #fdfdfeea;
  box-shadow: 0px 12px 8px -12px rgba(0, 0, 0, 0.443);
  transform: translateX(-10);

  a {
    color: #000;
    font-weight: 700;
  }
}

.two {
  transform: translate(20px, -25px);
  position: absolute;
  transition: all 0.5s;

  .two-li {
    height: 0;
    font-size: 16px;
    font-weight: 800;
  }

  opacity: 0;
}

.one:hover .two {
  background: #fdfdfe;
  border-radius: 10px;
  padding: 10px;
  transform: translateY(0);
  opacity: 1;

  .two-li {
    // height: 20px;
    padding: 20px 10px;
  }
}

.two-li:hover {
  cursor: pointer;
  color: chocolate;
}
</style>
