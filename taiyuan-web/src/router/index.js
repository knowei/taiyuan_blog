import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
    {
        path: "/",
        name: "home",
        component: () => import("@/views/Home"),
        children: [
            {
                path: "/article/:id",
                name: "article",
                component: () => import("@/views/article/index"),
            },
            {
                path: "/video",
                name: "video",
                component: () => import("@/views/video/index"),
            },
            {
                path: "/archive",
                name: "archive",
                component: () => import("@/views/archive/index"),
            },
            {
                path: `/category`,
                name: 'category',
                component: () => import("@/views/category/index")
            },
            {
                path: `/tag`,
                name: 'tag',
                component: () => import("@/views/tag/index")
            },
            {
                path: '/my',
                name: 'my',
                component: () => import("@/views/my")
            }
        ],
    },
    {
        path: '/:pathMatch(.*)',
        name: 'NoPage404',
        component: () => import("@/views/404"),
    }
];

const router = new VueRouter({
    mode: "history",
    base: process.env.BASE_URL,
    routes,
});


// 缓存原型上的push函数
const originPush = VueRouter.prototype.push
const originReplace = VueRouter.prototype.replace
// 给原型对象上的push指定新函数函数
VueRouter.prototype.push = function (location, onComplete, onAbort) {
    // 判断如果没有指定回调函数, 通过call调用源函数并使用catch来处理错误
    if (onComplete === undefined && onAbort === undefined) {
        return originPush.call(this, location, onComplete, onAbort).catch(() => {
        })
    } else { // 如果有指定任意回调函数, 通过call调用源push函数处理
        originPush.call(this, location, onComplete, onAbort)
    }
}

// replace函数
VueRouter.prototype.replace = function (location, onComplete, onAbort) {
    if (onComplete === undefined && onAbort === undefined) {
        return originReplace.call(this, location, onComplete, onAbort).catch(() => {
        })
    } else {
        originReplace.call(this, location, onComplete, onAbort)
    }
}

/** 解决跳转重复路由报错问题 */
const routerPush = router.push;
router.push = path => {
    // 判断下当前路由是否就是要跳转的路由
    if (router.currentRoute.fullPath.includes(path)) return;
    return routerPush.call(router, path);
}

router.beforeEach((to, from, next) => {
    document.body.scrollTop = 0;
    document.documentElement.srcollTop = 0;

    window.scrollTo(0, 0);
    next();
});

export default router;
