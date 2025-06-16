import request from '@/utils/request'

// 查询分类
export function listCategory() {
  return request({
    url: '/category/list',
    method: 'get'
  })
}

// 查询标签
export function pageCategory(data) {
  return request({
    url: '/category/page',
    method: 'post',
    data: data
  })
}

// 查询标签
export function getCategory(id) {
  return request({
    url: '/category/' + id,
    method: 'get'
  })
}


//删除
export function deleteCategory(id) {
  return request({
    url: '/category/' + id,
    method: 'delete'
  })
}

// 新增标签
export function saveOrUpdateCategory(data) {
  return request({
    url: '/category',
    method: 'post',
    data: data
  })
}