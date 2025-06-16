import request from '@/utils/request'

// 查询文章列表
export function pagePost(data) {
  return request({
    url: '/post/page',
    method: 'post',
    data: data
  })
}

// 查询文章详细
export function getPost(postId) {
  return request({
    url: '/post/' + postId,
    method: 'get'
  })
}

// 新增文章
export function addPost(data) {
  return request({
    url: '/post',
    method: 'post',
    data: data
  })
}


// 删除文章
export function delPost(postId) {
  return request({
    url: '/post/' + postId,
    method: 'delete'
  })
}
