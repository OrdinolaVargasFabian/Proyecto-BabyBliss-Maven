
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
        <h1>Catálogo</h1>
        <style>
            /* General container styling */
            .container-menu {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin: 20px;
                padding: 20px;
            }

            /* Individual item container */
            .container-items {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
            }

            /* Each product item */
            .item {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin: 15px;
                width: 300px;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            /* Hover effect on each item */
            .item:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            /* Image styling */
            .item figure img {
                width: 100%;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            /* Product information container */
            .info-product {
                padding: 15px;
                text-align: center;
            }

            /* Product name */
            .info-product h2 {
                font-size: 1.5em;
                margin: 10px 0;
                color: #333;
            }

            /* Price styling */
            .info-product .price {
                font-size: 1.2em;
                color: #e91e63;
                margin: 10px 0;
            }

            /* Add to cart button */
            .btn-add-cart {
                background-color: #e91e63;
                border: none;
                border-radius: 5px;
                color: white;
                cursor: pointer;
                font-size: 1em;
                padding: 10px 20px;
                text-transform: uppercase;
                transition: background-color 0.3s;
            }

            /* Hover effect for button */
            .btn-add-cart:hover {
                background-color: #d81b60;
            }

        </style>
       <div class="container-menu">
        <div class="animate__animated animate__bounceIn">
            <div class="container-items">
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/conjuntobabybliss.jpeg" alt="producto" />
                    </figure>
                    <div class="info-product">
                        <h2>Conjunto 1 para niña</h2>
                        <p class="price">$15.00</p>
                        <button class="btn-add-cart" data-name="Conjunto 1 para niña" data-price="15.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/shampoo.babybliss.png" alt="producto" />
                    </figure>
                    <div class="info-product">
                        <h2>Shampoo</h2>
                        <p class="price">$8.00</p>
                        <button class="btn-add-cart" data-name="Shampoo" data-price="8.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/pañalesbabybliss.jpeg" alt="producto" />
                    </figure>
                    <div class="info-product">
                        <h2>Pañales babysec</h2>
                        <p class="price">$10.00</p>
                        <button class="btn-add-cart" data-name="Pañales babysec" data-price="10.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/FormulaBEBA.png" alt="producto"/>
                    </figure>
                    <div class="info-product">
                        <h2>Formula BEBA</h2>
                        <p class="price">$17.00</p>
                        <button class="btn-add-cart" data-name="Formula BEBA" data-price="17.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/PackCuidado.png" alt="producto"/>
                    </figure>
                    <div class="info-product">
                        <h2>Pack Higiene</h2>
                        <p class="price">$42.00</p>
                        <button class="btn-add-cart" data-name="Pack Higiene" data-price="42.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/PelucheBabyBliss.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Peluche BabyBliss</h2>
                        <p class="price">$18.00</p>
                        <button class="btn-add-cart" data-name="Peluche BabyBliss" data-price="18.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/biberonBlue.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Biberon Blue</h2>
                        <p class="price">$8.00</p>
                        <button class="btn-add-cart" data-name="Biberon Blue" data-price="8.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/cocheBabyBliss.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Coche BabyBliss</h2>
                        <p class="price">$50.00</p>
                        <button class="btn-add-cart" data-name="Coche BabyBliss" data-price="50.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/johnsonbabyPACK.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Pack Johnson Baby</h2>
                        <p class="price">$28.00</p>
                        <button class="btn-add-cart" data-name="Pack Johnson Baby" data-price="28.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/megapack2.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Mega Pack 2</h2>
                        <p class="price">$288.00</p>
                        <button class="btn-add-cart" data-name="Mega Pack 2" data-price="288.00">Añadir al carrito</button>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img src="../IMG/Productos/megapackBabybliss.png" alt=""/>
                    </figure>
                    <div class="info-product">
                        <h2>Mega Pack BabyBliss</h2>
                        <p class="price">$298.00</p>
                        <button class="btn-add-cart" data-name="Mega Pack BabyBliss" data-price="298.00">Añadir al carrito</button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
        <!---<div class="listaProductos">
        <c:forEach var="p" items="${lista}">
            <div class="productos">
                <div>
                    <a href="#">
                        <picture>
                            <img src="Productos/${p.imagen}" alt="${p.nombre}"/>
                        </picture>
                    </a>
                    <div class="name-game">
                        <a href="#" title="${p.nombre}">
                            <h5>${p.nombre}</h5>
                        </a>
                        <p>Descripcion: ${p.descripcion}</p>
                        <p>Precio: ${p.precio}</p>
                    </div>
                </div>
            </div>
        </c:forEach>---->

    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

