import service from "@/plugin/service";

//提交评论
export function Comment(data) {
    return service({
        method: 'post',
        url: '/portal/comment',
        data
    })
}

//根据id获取文章评论
export function GetComment(id) {
    return service({
        method: 'get',
        url: `/portal/comment/${id}`,
    })
}

//获取QQ号信息
export function GetAv(id) {
    return service({
        method: 'post',
        url: `https://api.ilingku.com/int/v1/qqname?qq=${id}`,
    })
}
