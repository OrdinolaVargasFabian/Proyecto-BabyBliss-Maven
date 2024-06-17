<%-- 
    Document   : pagoExitoso
    Created on : 16 jun. 2024, 22:14:44
    Author     : Frank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pago Exitoso</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
            }

            .container {
                width: 80%;
                max-width: 600px;
                margin: 100px auto;
                text-align: center;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #009900;
            }

            .btn {
                display: inline-block;
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                margin-top: 20px;
            }

            .btn:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Pago Exitoso</h1>
            <p>¡Gracias por tu compra en BabyBliss!</p>
            <p>Tu pago ha sido procesado con éxito.</p>
            <p>Recibirás un correo electrónico de confirmación en breve.</p>
            <a href="index.jsp" class="btn">Volver al inicio</a>
        </div>
    </body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->