<%-- 
    Document   : wait
    Created on : Mar 15, 2024, 10:53:21 PM
    Author     : DUYAN
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Five Stars Cinema</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                width: 100%;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #191940;
                overflow: hidden;
            }

            .loader{
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                width: 360px;
                height: 100vh;
                position: relative;
            }

            .balls {
                display: flex;
                height: 100%;
                width: 100%;
                position: absolute;
            }

            .ball {
                position: absolute;
                top: -50px;
                width: 50px;
                height: 50px;
                background: peru;
                border-radius: 50%;
                margin: 0 20px;
                animation: ball 4s infinite;
            }

            .ball--1 {
                background-image: linear-gradient(
                    to bottom, #ffe93e, #ff952a);
            }

            .ball--2 {
                background-image: linear-gradient(
                    to bottom, #ff009e, #ff0038);
            }

            .ball--3 {
                background-image: linear-gradient(
                    to bottom, #00f4fe, #00bdfb);
            }

            .ball--4 {
                background-image: linear-gradient(
                    to bottom, #fc00f9, #b500f9);
            }

            .balls-1 .ball--1 {
                left: 20px;
                animation-delay: 0;
            }

            .balls-1 .ball--2 {
                left: 100px;
                animation-delay: 0.05s;
            }

            .balls-1 .ball--3 {
                left: 180px;
                animation-delay: 0.1s;
            }

            .balls-1 .ball--4 {
                left: 260px;
                animation-delay: 0.15s;
            }

            .balls-2 .ball--1 {
                left: 20px;
                animation-delay: 2s;
            }

            .balls-2 .ball--2 {
                left: 100px;
                animation-delay: 2.05s;
            }

            .balls-2 .ball--3 {
                left: 180px;
                animation-delay: 2.1s;
            }

            .balls-2 .ball--4 {
                left: 260px;
                animation-delay: 2.15s;
            }

            @keyframes ball {
                0%,
                25% {
                    top: -50px;
                }
                35% {
                    top: calc(60% - 50px);
                }
                40% {
                    top: calc(45% - 50px);
                }
                45% {
                    top: calc(55% - 50px);
                }
                50%,
                70% {
                    top: calc(50% - 25px);
                }
                80%,
                100% {
                    top: 100%;
                }
            }
            .content {
                text-align: center;
                font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                margin-top: 20px;
                color: white;
                position: absolute;
                top: 60%
            }
            .icon {
                color: #ffe93e;
                font-size: 24px;
                animation: moveUpDown 2s infinite alternate;
            }

            @keyframes moveUpDown {
                0% {
                    transform: translateY(0);
                }
                100% {
                    transform: translateY(-10px);
                }
            }
        </style>
    </head>
    <body>
        <div class="loader">
            <div class="balls-1 balls">
                <div class="ball--1 ball"></div>
                <div class="ball--2 ball"></div>
                <div class="ball--3 ball"></div>
                <div class="ball--4 ball"></div>
            </div>
            <div class="balls-2 balls">
                <div class="ball--1 ball"></div>
                <div class="ball--2 ball"></div>
                <div class="ball--3 ball"></div>
                <div class="ball--4 ball"></div>
            </div>
        </div>
        <div class="content">
            <h2>Your request is being processed
                <i class='icon bx bxs-ghost'></i>
                <i class='icon bx bxs-ghost'></i>
                <i class='icon bx bxs-ghost'></i>
            </h2>
        </div>
        
        <script>
            function redirectToAnotherPage() {
                setTimeout(function () {
                    window.location.href = 'home';
                }, 3000);
            }
            window.onload = redirectToAnotherPage;
        </script>
    </body>
</html>

