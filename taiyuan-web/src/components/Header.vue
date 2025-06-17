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

          <!--                    <ol class="two">-->
          <!--                        <li v-for="(item, index) in categoryList" :key="index" class="two-li"-->
          <!--                            @click="go(item.id,'cate',item.name)">{{item.name}}</li>-->
          <!--                    </ol>-->
        </li>
        <li class="one">
          <router-link to="/tag">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-biaoqian"></use>
            </svg>
          </router-link>
          <!--                    <ol class="two">-->
          <!--                        <li class="two-li" v-for="(item, index) in tagList" :key="index" @click="go(item.id,'tag',item.name)">-->
          <!--                            {{item.name}}</li>-->
          <!--                    </ol>-->
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
      </ul>
    </header>
  </div>
</template>

<script>
import "@/assets/js/header"
import $ from "jquery"
import {getAllTag} from "@/api/tag"
import {getAllCategory} from '@/api/category';
export default {
  data() {
    return {
      categoryList: [],
      tagList: []
    };
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
  },
  created() {
    this.getCategory(),
        this.getTags()
  }
}
</script>

<style lang="less" scoped>
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
