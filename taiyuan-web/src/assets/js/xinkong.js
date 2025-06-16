(function () {
    window.onload = function () {
        var screenW = document.documentElement.clientWidth;
        var screenH = document.documentElement.clientHeight;
        var home = document.querySelector(".home");
        var colorArr = ['#fff', 'skyblue', 'orange'];
        console.log(screenW);
        for (var i = 0; i < 800; i++) {
            var span = document.createElement('span');
            var width = Math.random() * 3;
            var colorIndex = parseInt(Math.random() * 3);
            var x = parseInt(Math.random() * screenW);
            var y = parseInt(Math.random() * screenH);
            span.style.width = parseInt(width) + 'px';
            span.style.height = parseInt(width) + 'px';
            span.style.background = colorArr[colorIndex];
            span.style.left = x + 'px';
            span.style.top = y + 'px';

            home.appendChild(span);
        }
    }
    alert(1)
})()
