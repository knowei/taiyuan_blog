import axios from "axios";
import {Message} from 'element-ui'

const service = axios.create({
    baseURL: '/api',
    timeout: 3000
})


// 请求拦截器
service.interceptors.request.use(
    config => {
        // 可添加 token
        const token = localStorage.getItem('token')
        if (token) {
            config.headers['Authorization'] = token
        }
        return config
    },
    error => Promise.reject(error)
)

// 响应拦截器
service.interceptors.response.use(
    response => {
        const res = response.data

        // 假设你的后端返回格式是 { code: 200, message: 'OK', data: {...} }
        if (res.code !== 200) {
            Message.error(res.message || '请求失败')
            // 拦截后续业务逻辑
            return Promise.reject(res)
        }

        // 返回业务数据
        return res.data
    },
    error => {
        Message.error(error.message || '请求异常')
        return Promise.reject(error)
    }
)

export default service
