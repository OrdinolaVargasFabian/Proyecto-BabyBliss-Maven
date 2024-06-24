
<%@ include file="header.jsp" %> 
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <style>
            body {
                font-family: Times New Roman, sans-serif;
                background: linear-gradient(to right, #d9faff, #ffe6f2);
                color: #333;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                margin-top: 0px;
                margin-bottom: 60px;
                font-size: 2.5em;
                color: #ff6699;
            }

            .listaProductos {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .productos {
                background: white;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                width: 300px;
                text-align: center;
                transition: transform 0.3s ease;
            }

            .productos:hover {
                transform: scale(1.05);
            }

            .productos img {
                width: 100%;
                height: auto;
                max-width: 200px; /* Ajusta el tamaño máximo según sea necesario */
                max-height: 200px; /* Ajusta el tamaño máximo según sea necesario */
                min-height: 200px;
                min-width: 200px;
                object-fit: contain; /* Asegura que la imagen mantenga su proporción */
                margin: 0 auto; /* Centra la imagen dentro del contenedor */
                display: block;
            }

            .name-productos {
                padding: 15px;


            }

            .name-productos h5 {
                margin: 0 0 10px;
                font-size: 1.5em;
                color: #ff6699;
            }

            .name-productos p {
                margin: 5px 0;
                font-size: 1.2em;
                color: #666;
            }

            .name-productos a {
                text-decoration: none;
                color: #ff6699;
            }

            .name-productos a:hover {
                text-decoration: underline;
            }
            .add-to-cart {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #ff6699;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 0.9em;
                transition: background-color 0.3s ease;
            }

            .add-to-cart:hover {
                background-color: #ff3366;
            }
            h1{
                padding-bottom: 10px;
            }
        </style>
        <h1>Catálogo</h1>

        <div id="productos-box" class="container"></div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                cargarTienda();
            });

            function cargarTienda() {
                $.ajax({
                    url: '../srvObtenerProductos',
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        data.forEach(function (producto) {
                            $('#productos-box').empty();
                            $('#productos-box').append(`
                                <div class="productos">
                                    <img src="${producto.imagen}" alt="${producto.nombre}">
                                    <div class="name-productos">
                                        <h5>${producto.nombre}</h5>
                                        <p>${producto.precio}</p>
                                        <button class="add-to-cart" onclick="agregarAlCarrito(${producto.id})">Agregar al carrito</button>
                                    </div>
                                </div>
                            `);
                            console.log(producto.nombre + ': ' + producto.precio);
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error("Error redirección: " + error);
                    }
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>

