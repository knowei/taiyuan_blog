<template>
  <div class="app-container">
    <el-form ref="form" :model="post" :rules="rules" size="medium" label-width="100px">
      <el-form-item label="标题" prop="title">
        <el-input v-model="post.title" placeholder="请输入标题" clearable :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="文章略缩图" prop="coverImage">
        <el-input v-model="post.coverImage" placeholder="请输入文章略缩图链接" clearable
                  :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="摘要" prop="summary">
        <el-input v-model="post.summary" placeholder="请输入摘要" clearable :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="post.categoryId" placeholder="请选择分类" clearable :style="{width: '100%'}">
          <el-option v-for="(item, index) in category_idOptions" :key="index" :label="item.label"
                     :value="item.value" :disabled="item.disabled"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="标签" prop="tagIds">
        <el-select v-model="post.tagIds" placeholder="请选择标签" multiple filterable clearable
                   :style="{width: '100%'}">
          <el-option v-for="(item, index) in tag_idOptions" :key="index" :label="item.label"
                     :value="item.value" :disabled="item.disabled"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="内容" prop="content">
        <v-md-editor v-model="post.content" height="400px"></v-md-editor>
      </el-form-item>
      <el-form-item label="是否置顶" prop="isTop">
        <el-switch v-model="post.isTop"></el-switch>
      </el-form-item>
      <el-form-item label="是否资源贴" prop="isUrl">
        <el-switch v-model="post.isUrl"></el-switch>
      </el-form-item>
      <el-form-item v-if="post.isUrl" label="资源链接" prop="url">
        <el-input v-model="post.url" placeholder="请输入资源链接" clearable :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item v-if="post.isUrl" label="提取密码" prop="openPassword">
        <el-input v-model="post.openPassword" placeholder="请输入提取密码" clearable
                  :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item v-if="post.isUrl" label="解压密码" prop="decompressionPassword">
        <el-input v-model="post.decompressionPassword" placeholder="请输入解压密码" clearable
                  :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm(1)">发布</el-button>
        <el-button type="primary" @click="submitForm(0)">草稿</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import {addPost, getPost} from "@/api/post/post"
import {listCategory} from "@/api/post/category"
import {listTag} from "@/api/post/tag"

export default {
  components: {},
  props: [],
  data() {
    return {
      post: {
        title: undefined,
        summary: undefined,
        category_id: 1,
        content: "",
      },
      rules: {
        title: [{
          required: true,
          message: '请输入标题',
          trigger: 'blur'
        }],
        summary: [{
          required: true,
          message: '请输入摘要',
          trigger: 'blur'
        }],
        category_id: [{
          required: true,
          message: '请选择分类',
          trigger: 'change'
        }],
      },
      category_idOptions: [],
      tag_idOptions: []
    }
  },
  computed: {},
  watch: {},
  created() {
    this.getListTag()
    this.getListCategory()
  },
  mounted() {
    const id = this.$route.query.id
    if (id) {
      getPost(id).then(res => {
        this.post = res.data
        this.post.isTop = this.post.isTop === 1
        this.post.isUrl = this.post.isUrl === "1"
      }).catch(err => {
        this.$message.error('获取文章失败')
      })
    }
  },
  methods: {
    getListTag() {
      listTag().then(res => {
        this.tag_idOptions = res.data.map(item => ({
          label: item.name,
          value: item.id,
          disabled: false
        }))
      })
    },
    getListCategory() {
      listCategory().then(res => {
        this.category_idOptions = res.data.map(item => ({
          label: item.name,
          value: item.id,
          disabled: false
        }))
      })
    },
    submitForm(status) {
      this.post.status = status

      // 将 isTop 转换为数字
      this.post.isTop = this.post.isTop ? 1 : 0

      // 将 isUrl 转换为数字
      this.post.isUrl = this.post.isUrl ? 1 : 0

      this.$refs['form'].validate(valid => {
        if (!valid) return
        addPost(this.post).then(() => {
          this.$message.success('发布成功')
          this.resetForm()
          this.$router.push({path: '/post/list'})
        }).catch(err => {
          this.$message.error('发布失败')
        })
      })
    },
    resetForm() {
      this.$refs['form'].resetFields()
    },
  }
}

</script>
<style>
</style>
