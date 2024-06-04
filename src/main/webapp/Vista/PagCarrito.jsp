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


        <div class="container-fluid mt-3">
            <h5>Carrito</h5> 
            <hr />

            <div class="row">
                <div class="col-sm-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead style="background-color: #9999ff">
                                        <tr>
                                            <th>Imagen</th>
                                            <th>Producto</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Importe</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${carrito}" var="item" varStatus="loop">
                                            <tr>
                                                <td>
                                                    <img src="../IMG/tienda/${item.imagen}" width="50%"
                                                         alt="${item.producto.nombre}"/> 
                                                </td>
                                                <td>${item.producto.nombre}</td>
                                                <td>${item.producto.precio}</td>
                                                <td>${item.cantidad}</td>
                                                <td>${item.Importe()}</td>
                                                <td>
                                                    <a href="CarritoControlador?accion=eliminar&indice=${loop.index}" title="eliminar" class="btn btn-danger btn-sm">
                                                        <i class="fa fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${!(carrito != null && carrito.size()>0)}">
                                            <tr class="text-center">
                                                <td colspan="6">Carrito Vacio!</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <form action="PedidoControlador" method="post">
                                <div clas="row">
                                <h5>RESUMEN COMPRA</h5>
                                <hr />
                                <div class="d-flex justify-content-between mb-4">
                                    <p class="mb-2">Total</p>
                                    <p class="mb-2">S/${total}</p>

                                </div>
                                    <input type="hidden" name="accion" value="procesar">
                                    <button ${carrito.size() == 0 ? 'disabled': ''} type="submit" class="btn btn-warning btn-block btn-lg">
                                    <div class="d-flex justify-content-between">
                                        <span><i class="fa fa-credit-card"></i>PROCESAR</span>
                                    </div>

                                </button>
                            </div>
                            </form>                        </div>
                    </div>

                </div>


            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
