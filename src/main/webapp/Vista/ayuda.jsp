

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Yellowtail&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        

        .fab-container {
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
            user-select: none;
            position: sticky;
            padding-left: 95%;
            bottom: 30px;
            right: 30px;
        }

        .fab {
            position: relative;
            height: 70px;
            width: 70px;
            background-color: #4ba2ff;
            border-radius: 50%;
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .fab-content .material-symbols-outlined {
            color: white;
            font-size: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            width: 100%;
        }

        .sub-button {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            bottom: 10px;
            right: 10px;
            height: 50px;
            width: 50px;
            background-color: #4ba2ff;
            border-radius: 50px;
            transition: all 0.3s ease;
            opacity: 0;
            visibility: hidden;
        }

        .sub-button a .material-symbols-outlined {
            color: white;
            font-size: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            width: 100%;

        }

        .sub-button a {
            text-decoration: none;
            /* Quita el subrayado de los enlaces */
        }
       

        .fab-container.open .sub-button:nth-child(2) {
            transform: translateY(-80px);
            opacity: 1;
            visibility: visible;
        }

        .fab-container.open .sub-button:nth-child(3) {
            transform: translateY(-140px);
            opacity: 1;
            visibility: visible;
        }

        .fab-container.open .sub-button:nth-child(4) {
            transform: translateY(-200px);
            opacity: 1;
            visibility: visible;
        }

        .fab-container.open .sub-button:nth-child(5) {
            transform: translateY(-260px);
            opacity: 1;
            visibility: visible;
        }
    </style>
</head>


    <div class="fab-container">
        <div class="fab shadow" onclick="toggleFab()">
            <div class="fab-content">
                <span class="material-symbols-outlined">help</span>

            </div>
        </div>
        <div class="sub-button shadow">
            <a href="" target="_blank">
                <span class="material-symbols-outlined">call</span>
            </a>
        </div>
        <div class="sub-button shadow">
            <a href="" target="_blank">
                <span class="material-symbols-outlined">support_agent</span>
            </a>
        </div>

    </div>
    
    <script>
        function toggleFab() {
            document.querySelector('.fab-container').classList.toggle('open');
        }
    
        window.addEventListener('scroll', function() {
            const fabContainer = document.querySelector('.fab-container');
            const scrollY = window.scrollY;
    
            // Ajusta la posición de la fab-container basado en el scroll
            fabContainer.style.transform = `translateY(${scrollY}px)`;
        });
    </script>
    

</html>
