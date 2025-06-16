(function () {
    // 监听滚动条，加上样式
    window.addEventListener("scroll", function () {
        var header = this.document.querySelector(".header")
        header.classList.toggle("sticky", window.scrollY > 0);
    })
})()