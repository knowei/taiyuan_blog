import request from '@/utils/request'

// 查询标签
export function listTag() {
  return request({
    url: '/tag/list',
    method: 'get'
  })
}

// 查询标签
export function pageTag(data) {
  return request({
    url: '/tag/page',
    method: 'post',
    data: data
  })
}

// 查询标签
export function getTag(id) {
  return request({
    url: '/tag/' + id,
    method: 'get'
  })
}


//删除
export function deleteTag(id) {
  return request({
    url: '/tag/' + id,
    method: 'delete'
  })
}

// 新增标签
export function saveOrUpdateTag(data) {
  return request({
    url: '/tag',
    method: 'post',
    data: data
  })
}
