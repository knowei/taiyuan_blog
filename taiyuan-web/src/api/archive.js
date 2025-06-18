import service from "@/plugin/service";

// 获取归档页面数据
export function archive() {
    return service({
        method: 'get',
        url: '/portal/archive'
    })
}
