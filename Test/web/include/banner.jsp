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
    <body>
        <div class="container">
        <div class="main">
            <img src="images/phim1.jpg" alt="" class="img-feature">
            <div class="control prev">
                <i class='bx bx-chevron-left'></i>
            </div>
            <div class="control next">
                <i class='bx bx-chevron-right'></i>
            </div>
        </div>
        <div class="list-image">
            <div><img src="images/phim1.jpg" alt="" class="list-image"></div>
            <div><img src="images/phim5.jpg" alt="" class="list-image"></div>
            <div><img src="images/phim2.jpg" alt="" class="list-image"></div>
            <div><img src="images/phim3.jpg" alt="" class="list-image"></div>
            <div><img src="images/phim4.jpg" alt="" class="list-image"></div>
        </div>
    </div>
        <script>
        var imgFeature = document.querySelector(".img-feature");
        var listImg = document.querySelectorAll(".list-image img");
        var prevBtn = document.querySelector(".prev");
        var nextBtn = document.querySelector(".next");

        var currentIndex = 0;
        function updateImgByIndex(index) {
            //remove active class
            document.querySelectorAll(".list-image div").forEach(img => img.classList.remove("active"));
            currentIndex = index;
            imgFeature.src = listImg[index].getAttribute("src");
            //add active class
            listImg[index].parentElement.classList.add("active");
        }

        auto(); 
        function auto() {
            setInterval(() => {
                nextBtn.click(); 
            }, 3000); 
        }

        listImg.forEach((imgElement,index) => {
            imgElement.addEventListener("click", e => {
                imgFeature.style.opacity = '0'

                setTimeout(() =>{
                    updateImgByIndex(index);
                    imgFeature.style.opacity = '1'
                },400)
            });
        });

        prevBtn.addEventListener("click", e => {
            if (currentIndex==0){
                currentIndex = listImg.length-1;
            }
            else{
                currentIndex--;
            }
            imgFeature.style.animation = '';
            setTimeout(()=>{
                updateImgByIndex(currentIndex);
                imgFeature.style.animation ='slideLeft 1s ease-in-out forwards';
            },200);
        });

        nextBtn.addEventListener("click", e => {
            if (currentIndex==listImg.length-1){
                currentIndex = 0;
            }
            else{
                currentIndex++;
            }
            imgFeature.style.animation = '';
            setTimeout(()=>{
                updateImgByIndex(currentIndex);
                imgFeature.style.animation ='slideRight 1s ease-in-out forwards';
            },200);
        });
    </script>
    </body>
</html>
