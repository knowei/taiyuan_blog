import service from "@/plugin/service";

// 获取全部标签
export function getAllTag() {
    return service({
        method: 'get',
        url: '/portal/tag/list'
    })
}

// 获取id下的文章
export function getArticlesById(id) {
    return service({
        method: 'post',
        url: `/portal/tag/${id}`
    })
}
