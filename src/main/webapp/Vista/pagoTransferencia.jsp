<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Estilos generales */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0; /* Color de fondo general */
            }

            .content {
                width: 80%;
                max-width: 1200px;
                margin: 20px auto; /* Centra el contenido */
                padding: 20px; /* Espaciado interno */
                background-color: #fff; /* Color de fondo para el contenido */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra */
                text-align: center; /* Centra el contenido */
            }

            h1 {
                font-size: 3rem; /* Tamaño de fuente grande */
                color: #333; /* Color de texto */
            }

            p {
                font-size: 1.5rem; /* Tamaño de fuente mediano */
                color: #666; /* Color de texto gris */
            }
        </style>
    </head>
    <body>
        <div class="content">
            <h1>Pago por Transferencia Bancaria</h1>
            <p>Por favor, realiza la transferencia a la siguiente cuenta bancaria:</p>
            <p><strong>Banco:</strong> Banco De Crédito del Perú</p>
            <p><strong>Número de cuenta:</strong> 123456789012345</p>
            <p><strong>Titular:</strong> Fabian Vargas Ordinola</p>
            <p><strong>Concepto:</strong> Adquicision de membresia BabyBliss</p>
        </div>
    </body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->
