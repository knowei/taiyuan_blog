// 向上的样式
(function () {
    let x = 0;
    document.addEventListener("scroll", () => {
        //代表隐藏scro，隐藏guanbi
        const flag = true;
        const list = document.getElementById("gdt");
        if (document.documentElement.scrollTop < 400 && flag == true && x == 2) {
            list.classList.add("guanbi");
            list.classList.remove("scro");
            this.flag = false;
        } else if (document.documentElement.scrollTop > 400 || flag == false) {
            //添加样式来实现动画
            list.classList.remove("guanbi");
            list.classList.add("scro");
            this.flag = true;
            x = 2;
        }
    });
})();
