<%@ include file="header.jsp" %> <!-- Incorpora el cÃ³digo del archivo header -->
<link href="../CSS/index.css" rel="stylesheet" type="text/css"/>
<body>
    <!-------------------------------------------- CARRUSEL --------------------------------------------------------------------------------------------->  
    <div id="carouselExampleIndicators" class="carousel slide">
      <h4>¡OFERTAS ESPECIALES!</h4>
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="100"> <!-- LINK TIENDA ALIMENTACIÓN --> 
             <img src="../IMG/CARRUSEL1.jpg" alt=""/>
        </div>
        <div class="carousel-item" data-bs-interval="100"> <!-- LINK TIENDA COCHES DE BEBE --> 
             <img src="../IMG/CARRUSEL2.jpg" alt=""/>
        </div>
        <div class="carousel-item">
             <img src="../IMG/CARRUSEL3.jpg" alt=""/> <!-- LINK TIENDA COCHES DE BEBE --> 
        </div>
        <div class="carousel-item">
             <img src="../IMG/CARRUSEL4.jpg" alt=""/> <!-- LINK TIENDA GENERAL --> 
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div> 
    <header class="header">
      <!-------------------------------------------- INICIO --------------------------------------------------------------------------------------------->  
      <div class="content py-5 shadow">
        <h1>Cuidamos lo que más amas</h1>
           <p>
             ¡Bienvenidos a nuestro rinconcito para bebés! 
             Aquí encontrarás todo lo que necesitas para cuidar, mimar y hacer felices a tus pequeñitos. 
             Desde ropa, alimentación y juguetes tiernos hasta accesorios prácticos. 
             ¡Nuestra tienda está llena de amor y ternura para tu familia! 
             Adelante, descubre el mundo de dulzura que hemos preparado para ti y tu bebé.
           </p>
           <a href="#" class="btn-1">¡Descrube quienes somos!</a><!-- LINK DESCRIPCIÓN WEB--> 
      </div>
    </header> 
    <!-------------------------------------------- DETALLES ---------------------------------------------------------------------------------------------> 
    <div class="det my-5">
        <!-- ICONO GARANTIA --> 
        <div class="garantia shadow">
            <i class='bx bxs-medal' ></i>
            <h2>Garantía de 6 meses</h2>
            <p>Aplican condiciones</p>
        </div>
        <!-- ICONO PAGO SEGURO --> 
        <div class="pago shadow">
            <i class='bx bxs-baby-carriage'></i>
            <h2>Pago seguro</h2>
            <p>Todos los medios de pago</p>
        </div>
    </div>
    <!-------------------------------------------- GUIAS --------------------------------------------------------------------------------------------->  
    <!-------------------------------------------- ALIMENTACIÓN------------------------------------------------------------------------------------------> 
    <div class="guias">   
        <div class="guiaAl pb-4 shadow"> 
            <h3>Guias redactadas por nuestros especialistas</h3>
            <img src="../IMG/BANNER_GUIA_ALIMENTACION.jpg" alt=""/>
            <p>GUIAS DE ALIMENTACIÓN</p>
        </div>
        <!-- GUIA 1 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia Alimentación Complementaria 6-12 años</h3>
                <hr>
                <p>Esta guía proporciona información esencial para padres y cuidadores 
                  sobre cómo introducir una variedad de alimentos saludables en la dieta de un bebé en desarrollo.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_ALIMENTACION1.jpg" class="rounded float-start" alt=""/>
            </a>
        </div>
        <!-- GUIA 2 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia Alimentación Complementaria Saludable</h3>
                <hr>
                <p>La guía de alimentación saludable aborda la introducción gradual de alimentos sólidos,
                   también incluye consejos sobre la preparación segura de alimentos, la textura adecuada según la etapa del bebé, 
                   la frecuencia de las comidas y señales de hambre/saciedad.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_ALIMENTACION2.jpg" class="rounded float-end" alt=""/>
            </a> 
        </div>
       <!-------------------------------------------- EDUCACIÓN------------------------------------------------------------------------------------------> 
        <div class="guiaEd pb-4 shadow"> 
            <img src="../IMG/BANNER_GUIA_EDUCACION.jpg" alt=""/>
            <p>GUIAS DE EDUCACIÓN</p>
        </div>
        <!-- GUIA 1 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia de orientación del buen trato a niños y niñas</h3>
                <hr>
                <p>Esta guía proporciona estrategias prácticas para fomentar el desarrollo del lenguaje en bebés durante los primeros 24 meses de vida. 
                    Incluye una serie de actividades diseñadas para estimular la capacidad de escucha,
                    comprensión y expresión verbal de los bebés.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_EDUCACION1.jpg" class="rounded float-start" alt=""/>
            </a>
        </div>
        <!-- GUIA 2 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia de Estimulación Temprana</h3>
                <hr>
                <p>Esta guía ofrece una serie de actividades y consejos para padres y cuidadores sobre cómo promover el desarrollo cognitivo, 
                    motor y emocional de los bebés desde el nacimiento hasta los 12 meses. 
                    La estimulación temprana se centra en aprovechar los primeros años de vida del bebé, 
                    cuando el cerebro es más receptivo a nuevos aprendizajes.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_EDUCACION2.jpg" class="rounded float-end" alt=""/>
            </a> 
        </div>
        <!-------------------------------------------- HIGIENE------------------------------------------------------------------------------------------> 
        <div class="guiaHi pb-4 shadow"> 
            <img src="../IMG/BANNER_GUIA_HIGIENE.jpg" alt=""/>
            <p>GUIAS DE HIGIENE</p>
        </div>
        <!-- GUIA 1 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia para niños: Aseo Personal</h3>
                <hr>
                <p>Esta guía proporciona información esencial para padres y cuidadores sobre cómo mantener una adecuada higiene en los bebés, 
                    desde el nacimiento hasta los 12 meses. Se incluyen instrucciones detalladas sobre el baño del bebé, 
                    cambio de pañales, cuidado del cordón umbilical y la higiene bucal.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_HIGIENE1.jpg" class="rounded float-start" alt=""/>
            </a>
        </div>
        <!-- GUIA 2 --> 
        <div class="container d-flex bg-white rounded shadow p-4 my-4">
            <div class="p-4">
                <h3 class="mb-4" style="color: #9999ff">Guia de Higiene y Cuidado de la Piel del Bebé</h3>
                <hr>
                <p>Esta guía está diseñada para ayudar a los padres y cuidadores a mantener la piel del bebé saludable y 
                    libre de irritaciones. Aborda temas cruciales como la elección de productos de higiene, 
                    la rutina diaria de limpieza, y cómo proteger 
                    la piel del bebé de factores ambientales adversos.</p>
             </div>
            <a href="">
             <img src="../IMG/GUIA_HIGIENE2.jpg" class="rounded float-end" alt=""/>
            </a> 
        </div>
    </div> 

    <!-------------------------------------------- ACCESO DIRECTO TIENDA --------------------------------------------------------------------------------------------->  

</body>
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->
