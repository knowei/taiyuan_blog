<template>
  <div class="archive">
    <div class="archive-header">
      <div>
        <div class="archive-title">
          <div style="padding-right: 10px;
    border-right: 1px dashed #ACC0D8;">归档
          </div>
          <div style="padding-left: 10px;">Archive</div>
        </div>
      </div>
    </div>


    <div class="archive-content">
      <div class="article-sort" v-for="(item, index) in archive" :key="index">
        <div class="article-sort-item year"><span>{{ item.year }}</span></div>
        <div class="article-sort-item no-article-cover" v-for="(it, ind) in item.articleList" :key="ind">
          <div class="article-sort-item-info">
            <div class="article-sort-item-time my-time">{{ it.createTime }}</div>
            <router-link class="article-sort-item-title" :to="{name: 'article', params:{id: it.id}}">
              {{ it.articleTitle }}
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {archive} from "@/api/archive"

export default {
  meta: {
    index: 4
  },
  data() {
    return {
      archive: []
    }
  },
  methods: {
    getArchive() {
      archive().then(res => {
        console.log(res.data)
        if (res.data.code === 200) {
          this.archive = res.data.data
        }
      })
    }
  },
  created() {
    this.getArchive()
  }
}
</script>

<style lang="less" scoped>
.archive-header {
  height: 300px;

  .archive-title {
    div {
      display: inline;
    }

    position: absolute;
    font-size: 25px;
    color: #676767;
    font-weight: 700;
    letter-spacing: 3px;
    left: 50%;
    top: 20%;
    margin-left: -90px;
  }
}

.archive-content {
  max-width: 80%;
  // background: #676767;
  margin-left: auto;
  margin-right: auto;

  .article-sort {
    margin: 0 100px;
  }

  li {
    list-style: none;
  }

  .article-sort-item {
    // margin: 20px 0 0;
    // position: absolute;
    position: relative;
    display: -webkit-box;
    display: -moz-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: box;
    display: flex;
    -webkit-box-align: center;
    -moz-box-align: center;
    -o-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
    margin: 0 0 0 10px;
    -webkit-transition: all 0.2s ease-in-out;
    -moz-transition: all 0.2s ease-in-out;
    -o-transition: all 0.2s ease-in-out;
    -ms-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;

  }

  .article-sort-item {
    padding: 20px 0;

    a {
      text-decoration: none;
    }
  }

  .year {
    span {
      margin-left: 20px;
      font-size: 2em;
      font-weight: 600;
    }
  }

  .year:hover {
    padding-bottom: 30px;
  }


  .article-sort-item-info {
    margin-left: 20px;

    a {
      color: #676767;
      font-weight: 700;
    }

    .article-sort-item-time {
      margin: 0 0 15px;

      font-size: 17px;
      font-weight: 500;

    }

    transition: all 0.7s ease-in-out;
  }

  .article-sort-item-info:hover, article-sort-item-time:hover {
    padding-top: 30px;
  }

  .article-sort-item::before {
    margin-left: -17px;
    left: calc(-20px - 17px);
    width: 6px;
    height: 6px;
    border: 3px solid #49b1f5;
    border-radius: 6px;
    background: var(--card-bg);
    content: '';
    -webkit-transition: all 0.2s ease-in-out;
    -moz-transition: all 0.2s ease-in-out;
    -o-transition: all 0.2s ease-in-out;
    -ms-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;
  }

  .article-sort {
    border-left: 2px solid #aadafa;
  }
}
</style>