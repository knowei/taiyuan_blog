import service from "@/plugin/service";

//提交评论
export function Comment(data) {
    return service({
        method: 'post',
        url: '/comment',
        data
    })
}

//根据id获取文章评论
export function GetComment(id) {
    return service({
        method: 'get',
        url: `/comment/${id}`,
    })
}

//获取QQ号信息
export function GetAv(id) {
    return service({
        method: 'get',
        url: `https://api.usuuu.com/qq/${id}`,
    })
}