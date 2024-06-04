<%-- 
    Document   : SHOP
    Created on : 3 jun. 2024, 14:11:00
    Author     : Frank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <!-- Incluir productos de la base de datos -->
        <jsp:include page="components/Navegacion.jsp" />


        <p>${item.nombre}</p> 


        <div class="container-fluid mt-2">
            <h5>Catálogo de productos</h5> 
            <hr />

            <div class="row">
                <c:forEach items="${producto}" var="item">
                    <div class="col-sm-3 mt-1">
                        <form action="CarritoControlador" method="get">
                            <div class="card">
                                <!-- Incluir las imagenes de la base de datos -->    
                                <img src="../IMG/tienda/${item.imagen}" width="100%"
                                     alt="${item.nombre}"/>
                                <div class="card-body">
                                    <!-- nombre del producto resaltado -->
                                    <p class="fw-bold">${item.nombre}</p>
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="${item.id}"
                                    <div class="d-flex justify-content-between aling-items-center">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            <i class="fa fa-shopping-cart"></i>Agregar al carrito
                                        </button>
                                        <small class="fw-bold">$/${item.precio}</small>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>





                </div>

            </c:forEach>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
