<%-- 
    Document   : banner
    Created on : Jan 28, 2024, 9:49:58 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            height: 100vh;
            background-color: #0F1D2F !important;
        }
        .container {
            width: 80%;
            height: 30rem;
            margin: 50px auto;
            margin-bottom: 700px;
        }
        .main {
            height: 240%;
            margin-bottom:20px;
            position: relative;
            overflow: hidden;
        }
        .main>img {
            height: 100%;
            width: 100%;
        }
        .img-feature {
            transition: 1s;
        }
        .list-image {

            height: 60%;
            display: flex;
            overflow-x: auto;
            -ms-overflow-style: none;
            scrollbar-width: none;
            flex-wrap: nowrap;
            width: calc(100% / 6 * 6);
        }

        .list-image::-webkit-scrollbar {
            display: none;
        }

        .list-image div {
            flex: 0 0 auto;
            padding: 5px;
            cursor: pointer;
            width: calc(100% / 6);
        }

        .list-image img {
            height: 100%;
            width: auto;
            max-width: 100%;
        }

        .control {
            position: absolute;
            top: 50%;
            font-size: 50px;
            color: white;
            transform: translateY(-50%);
            cursor: pointer;
        }
        i:hover{
            color: orange;
        }
        div>i{
            background-color: orangered;
            border-radius: 50%;
        }
        .prev {
            left: 10px;
        }
        .next {
            right: 10px;
        }
        .active {
            background: orange;
        }
        @keyframes slideLeft {
            0%{
                transform: translateX(-100%);
            }
            100%{
                transform: translateX(0);
            }
        }
        @keyframes slideRight {
            0%{
                transform: translateX(100%);
            }
            100%{
                transform: translateX(0);
            }
        }
    </style>
    <body>
        <div class="container">
            <div class="main">
                <img src="fim_review/Mai.jpg" alt="" class="img-feature">
                <div class="control prev">
                    <i class='bx bx-chevron-left'></i>
                </div>
                <div class="control next">
                    <i class='bx bx-chevron-right'></i>
                </div>
            </div>
            <div class="list-image">
                <div><img src="fim_review/Mai.jpg" alt="" class="list-image"></div>
                <div><img src="fim_review/dune2024BANNER.jpg" alt="" class="list-image"></div>
                <div><img src="fim_review/gap-lai-chi-bau11.jpg" alt="" class="list-image"></div>
                <div><img src="fim_review/kung_fu.jpg" alt="" class="list-image"></div>
                <div><img src="fim_review/qu-co-thua-ke-2-750_1709707251031.jpg" alt="" class="list-image"></div>
                <div><img src="fim_review/quythaydauBANNER.jpg" alt="" class="list-image"></div>    
                <div><img src="fim_review/phim-hay-thang-32.jpg" alt="" class="list-image"></div> 
            </div>  
        </div>
        <script>
            var imgFeature = document.querySelector(".img-feature");
            var listImg = document.querySelectorAll(".list-image img");
            var prevBtn = document.querySelector(".prev");
            var nextBtn = document.querySelector(".next");

            var currentIndex = 0;
            var numVisibleImages = 6;

            function updateImgByIndex(index) {
                document.querySelectorAll(".list-image div").forEach(img => img.classList.remove("active"));
                currentIndex = index;
                imgFeature.src = listImg[index].getAttribute("src");
                listImg[index].parentElement.classList.add("active");
            }

             auto();

            function auto() {
                setInterval(() => {
                    nextBtn.click();
                }, 4000);
            }

            listImg.forEach((imgElement, index) => {
                imgElement.addEventListener("click", e => {
                    imgFeature.style.opacity = '0';

                    setTimeout(() => {
                        updateImgByIndex(index);
                        imgFeature.style.opacity = '1';
                    }, 400);
                });
            });

            prevBtn.addEventListener("click", e => {
                if (currentIndex === 0) {
                    currentIndex = listImg.length - 1;
                    document.querySelector(".list-image").scrollLeft = document.querySelector(".list-image").scrollWidth - document.querySelector(".list-image").clientWidth;
                } else {
                    currentIndex--;
                    if (currentIndex <= listImg.length - numVisibleImages - 1) {
                        document.querySelector(".list-image").scrollLeft -= listImg[0].parentElement.offsetWidth;
                    }
                }
                imgFeature.style.animation = '';
                setTimeout(() => {
                    updateImgByIndex(currentIndex);
                    imgFeature.style.animation = 'slideLeft 2s ease-in-out forwards';
                }, 100);
            });


            nextBtn.addEventListener("click", e => {
                if (currentIndex === listImg.length - 1) {
                    currentIndex = 0;
                    document.querySelector(".list-image").scrollLeft = 0;
                } else {
                    currentIndex++;
                    if (currentIndex >= listImg.length - numVisibleImages) {
                        document.querySelector(".list-image").scrollLeft += listImg[0].parentElement.offsetWidth;
                    }
                }
                imgFeature.style.animation = '';
                setTimeout(() => {
                    updateImgByIndex(currentIndex);
                    imgFeature.style.animation = 'slideRight 2s ease-in-out forwards';
                }, 100);
            });


        </script>
    </body>
</html>
