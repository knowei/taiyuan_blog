import Vue from 'vue'
import App from './App.vue'
import router from './router'

// 引入饿了么
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// 引入阿里图标库
import '@/assets/inconfont/iconfont.css'
import '@/assets/inconfont/iconfont.js'
import "@/assets/css/reset.css"

// import 'github-markdown-css/github-markdown.css'
//导入代码高亮文件
import hljs from 'highlight.js'
//导入代码高亮样式
import 'highlight.js/styles/vs2015.css'
//自定义一个代码高亮指令

import Viewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'

Vue.config.productionTip = false

Vue.directive('highlight', function (el) {
    let highlight = el.querySelectorAll('pre code');
    highlight.forEach((block) => {
        hljs.highlightBlock(block)
    })
})

Vue.use(Viewer)
Viewer.setDefaults({
    Options: { // Options必须，否则会出现默认打开等等不可预知的错误
        'inline': true,
        'button': true, // 显示右上角关闭按钮
        'navbar': true, // 缩略图导航
        'title': true, // 是否显示当前图片的标题
        'toolbar': true, // 显示工具栏
        'tooltip': true, // 显示缩放百分比
        'movable': true, // 图片是否可移动
        'zoomable': true, // 是否可缩放
        'rotatable': true, // 是否可旋转
        'scalable': true, // 是否可翻转
        'transition': true, // 是否使用 CSS3 过度
        'fullscreen': true, // 播放时是否全屏
        'keyboard': true, // 是否支持键盘
        'url': 'data-source' // 设置大图片的 url
    }
})

Vue.use(ElementUI);

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')
