"use strict";

let linetimer; // Таймер с линиями, если они существуют.
let posTop; // OY скролла
let firstPageHeight; // высота первой страницы
let linesCount = 200; // Количество линий

function getRandom(min, max) {
    return Math.random() * (max - min) + min;
}

// Выключаем движение линий если их не видно
window.onscroll = function () {
    posTop = (window.pageYOffset !== undefined) ?
        window.pageYOffset :
        (document.documentElement || document.body.parentNode || document.body).scrollTop
        ;
    if (linetimer != undefined && posTop > firstPageHeight) DisableDecorLines();
    else if (linetimer == undefined && posTop < firstPageHeight) ActivateDecorLines();
}




// Почти как main
document.addEventListener("DOMContentLoaded", function () {
    firstPageHeight = parseInt($(".page1").css("height")) + 80;
    SetArrowsForButtons();
    SetDecorLines();
    ActivateDecorLines()
    SetScrollButtons();


});

function SetScrollButtons() {
    var $page = $('html, body');
    $('a[href*="#"]').click(function () {
        $page.animate({
            scrollTop: $($.attr(this, 'href')).offset().top - 75
        }, 400);
        return false;
    });
}

// Моргающие стрелки при наведении на кнопки хэдера
function SetArrowsForButtons() {
    let btns = [];
    class ButtonClass {
        constructor(ref, arrow) {
            this.ref = ref;
            this.arrow = arrow;
            this.timer = undefined;
        }
    }

    let counter = 0;
    let arrows = document.querySelectorAll(".header-buttons > .arrow");
    document.querySelectorAll(".header-buttons div:not(.arrow)").forEach(ref => {
        btns.push(new ButtonClass(ref, arrows[counter]));
        counter++;
    })

    btns.forEach(button => {
        button.ref.addEventListener("mouseenter", function (event) {
            button.arrow.setAttribute("style", "opacity: 1");

            button.timer = setInterval(() => {
                if (getComputedStyle(button.arrow).getPropertyValue("opacity") == 1) {
                    button.arrow.setAttribute("style", "opacity: 0");
                } else {
                    button.arrow.setAttribute("style", "opacity: 1");
                }
            }, 500);

        }, false)

        button.ref.addEventListener("mouseleave", function (event) {
            clearInterval(button.timer);
            button.arrow.setAttribute("style", "opacity: 0");
        }, false)


    });
}

// Линии на заднем плане лица страницы
function SetDecorLines() {
    let x = 60;
    for (let i = 0; i <= linesCount; i++) {
        let line = document.createElement("div");
        line.className = "jsline";
        line.setAttribute("style", `
            top: ${x}px; 
            left: ${Math.floor(Math.random() * 70)}%;
            opacity: 0;
        `,);
        x += 20;
        if (x > firstPageHeight) x = 60;
        line.opacityinc = true;
        line.speed = getRandom(0.3, 0.4);
        line.scounter = 0;
        //button.arrow.setAttribute("style", "opacity: 0");
        //getComputedStyle(button.arrow).getPropertyValue("opacity")
        let maininfo = document.querySelector('.maininfo');
        maininfo.parentNode.insertBefore(line, maininfo);

    }
}

function ActivateDecorLines() {
    let lines = document.querySelectorAll(".page1 > .jsline");
    let x = 60;
    linetimer = setInterval(() => {
        lines.forEach(line => {
            if (x > 400) x = 60;

            let opacity = line.style.getPropertyValue("opacity");
            if (line.opacityinc == true) opacity = +opacity + getRandom(0.001, 0.005);


            let str = line.style.getPropertyValue("top");

            let pxnumber = "";
            for (let i = 0; i < str.length; i++) {
                if (!isNaN(+str[i])) {
                    pxnumber += str[i];
                }
            }

            let boost = +pxnumber;

            line.scounter += line.speed;
            if (line.scounter > 1) {
                boost += 1;
                line.scounter = 0;
            }

            line.setAttribute("style", `
                top: ${boost}px;
                left: ${line.style.getPropertyValue("left")};
                opacity: ${opacity};
            `,);

            if (opacity >= 0.6) line.opacityinc = false;
            else if (opacity <= 0) line.opacityinc = true;

            if (boost + 1 > firstPageHeight) {
                line.setAttribute("style", `
                    top: 40px; 
                    left: ${Math.floor(Math.random() * 70)}%;
                    opacity: 0;
                `,);
                line.opacityinc = true;
            }
        });
    }, 15);
}

function DisableDecorLines() {
    clearInterval(linetimer);
    linetimer = undefined;
}



