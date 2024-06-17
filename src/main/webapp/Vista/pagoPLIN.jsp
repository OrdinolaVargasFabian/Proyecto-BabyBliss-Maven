<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Estilos generales */
            body {             
                margin: 0;
                padding: 0;
            }

            .content {
                width: 80%;
                max-width: 1200px;
                margin: 20px auto; /* Centra el contenido */
                overflow: hidden; /* Limpia el float de los elementos internos */
            }

            .telefono {
                float: left; /* Alinea el número de teléfono a la izquierda */
                width: 50%; /* Ocupa el 50% del ancho */
                box-sizing: border-box; /* Incluye el padding en el ancho */
                padding: 20px; /* Espaciado interno */
                background-color: #ffcccc; /* Color de fondo para el número */
                color: #330033; /* Color de texto */
                font-size: 5rem; /* Tamaño de fuente grande */
                text-align: center; /* Alineación centrada */
                font-family: 'Helvetica', sans-serif; /* Cambia el tipo de letra */              
            }

            .qr {
                float: right; /* Alinea el QR a la derecha */
                width: 50%; /* Ocupa el 50% del ancho */
                box-sizing: border-box; /* Incluye el padding en el ancho */
                padding: 20px; /* Espaciado interno */             
                text-align: center; /* Centra la imagen */
            }

            .qr img {
                max-width: 100%; /* Asegura que la imagen del QR sea responsiva */
                height: auto;
                max-width: 300px; /* Tamaño máximo del QR */
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="telefono">
                <h2>Mi número</h2>
                <h1>992245544</h1>             
            </div>
            <div class="qr">
                <img src="../IMG/PagoPlin.png" alt="QR">
            </div>
        </div>
    </body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->
