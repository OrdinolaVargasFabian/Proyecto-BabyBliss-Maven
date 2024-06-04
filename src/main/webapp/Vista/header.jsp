<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*" %> <!-- Importa la clase Usuario y Especialista -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--JQuery--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <%--Bootstrap--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <%--CSS Tablas Dinamicas--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
        <link href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        
        <%--JS Tablas Dinamicas--%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.min.js"></script>

        <%--Botones Tablas Dinamicas--%>
        <link href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap5.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
        
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>

        <%--Iconos--%>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <%--Pop Ups--%>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <%--Fuentes de letra--%>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Yellowtail&display=swap" rel="stylesheet">

        <link rel="icon" type="image/x-icon" href="../babybliss_logo.png">

        <title>BabyBliss</title>
    </head>
    <body style="background: linear-gradient(to right, lightcyan, lightpink); padding-top: 12%;">
            <%
                session = request.getSession(false);

                //Se inicializa la variable perfil_usuario - 0: No hay usuario, 1: Usuario, 2: Especialista
                int perfil_usuario = 0;
                String nombre_completo = null;

                int membresia = 0;
                //Se inicializa la variable marco_premium
                String marco_premium = "";
                //Se inicializa la variable corona para el nombre de los usuarios premium
                String corona = "";
                
                //Se verifica si hay una sesion activa
                if (session.getAttribute("user") == null) {
                    perfil_usuario = 0;
                } else {
                    //se verifica si es un usuario o un especialista
                    if (session.getAttribute("user").toString().contains("Usuario")) {
                        // out.print("Usuario");
                        perfil_usuario = 1;
                        Usuario usuario = (Usuario) session.getAttribute("user");

                        nombre_completo = usuario.getNombre() + " " + usuario.getAppat() + " " + usuario.getApmat();

                        if (usuario.getMembresia() != 0){
                            membresia = usuario.getMembresia();
                        }

                        marco_premium = membresia == 2 ? "border border-warning rounded-circle border-2" : "";
                        corona = membresia == 2 ? "<i class='bx bxs-crown text-warning me-2'></i>" : "";
                    } else if (session.getAttribute("user").toString().contains("Especialista")) {
                        // out.print("Especialista");
                        perfil_usuario = 2;
                        Especialista especialista = (Especialista) session.getAttribute("user");

                        nombre_completo = especialista.getNombre() + " " + especialista.getAppat() + " " + especialista.getApmat();
                    }
                }
            %>
        <div class="fixed-top">
            <%--Barra principal--%>
            <div class="d-flex justify-content-between align-items-center p-2" style="background: linear-gradient(to right, #C99FF4, #EDCEE9);">
                <%--Logo de BabyBliss--%>
                <a href="index.jsp" class="d-flex align-items-center" style="text-decoration: none; color: black;">
                    <img src="../babybliss_logo.png" alt="BabyBliss" style="width: 70px">
                    <h2 class="ms-3" style='font-family: "Yellowtail", cursive; font-size: 50px;'>BabyBliss</h2>
                </a>
            
                <div class="d-inline-flex gap-4 align-items-center">
                    <%--Menu desplegable de carrito de compras--%>
                    <div class="dropdown">
                        <a class="btn rounded-pill btn-icon btn-secondary float-end" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class='bx bxs-baby-carriage' style="font-size: 20px;"></i>
                        </a>
                        <ul class="text-center dropdown-menu" style="width: 200px">
                            <li>VACIO</li>
                        </ul>
                    </div>
                    <%--Menu desplegable de notificaciones--%>
                    <div class="dropdown">
                        <a class="btn rounded-pill btn-icon btn-secondary float-end" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class='bx bxs-bell' style="font-size: 20px;"></i>
                        </a>
                        <ul class="text-center dropdown-menu" style="width: 200px">
                            <li>NO TIENES NOTIFICACIONES PENDIENTES</li>
                        </ul>
                    </div>
                    <%
                        //Se verifica si hay un usuario logueado
                        if (perfil_usuario != 0) {
                    %>
                    <%--Menu de usuario desplegable--%>
                    <div class="dropdown">
                        <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <%
                            out.print("<img src='../default.png' alt='' style='width: 50px' class='rounded-circle "+marco_premium+"'>");
                            %>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" data-bs-toggle="offcanvas" href="#offcanvasMiPerfil" role="button" aria-controls="offcanvasMiPerfil"><i class='bx bxs-user-circle me-2'></i>Mi cuenta</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <%
                                //Se verifica si el usuario tiene una membresia
                                if (membresia != 2 && perfil_usuario != 2) {
                            %>
                            <li><button class="dropdown-item" data-bs-toggle='modal' data-bs-target='#mdlAquirirMembresia'><i class='bx bxs-crown me-2'></i>Suscribirse</button></li>
                            <li><hr class="dropdown-divider"></li>
                            <%
                                //Se verifica si es un especialista para la opción de crear una guia
                                } 
                                if (perfil_usuario == 2) {
                            %>
                            <li><a class="dropdown-item" data-bs-toggle="offcanvas" href="#offcanvasAgregarGuia" role="button" aria-controls="offcanvasAgregarGuia"><i class='bx bxs-pen me-2'></i>Redactar Guia</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <%
                                }
                            %>
                            <li><a class="dropdown-item" href="../srvIniciarSesion?accion=cerrar"><i class='bx bx-log-out me-2'></i>Cerrar Sesión</a></li>
                        </ul>
                    </div>
                    <%
                        //Si no hay un usuario logueado se muestra el boton de acceder
                        } else {
                    %>
                    <a href="login.jsp" class="btn btn-outline-primary"><i class='bx bx-user-circle me-1'></i>Acceder</a>
                    <%
                        }
                    %>
                </div>
            </div>
            <%@ include file="../componentes/usuario/offcanvasDetallesUsuario.jsp" %> <!-- Incorpora el código del offcanvas para ver los datos del usuario -->
            <%--Barra de navegacion--%>
            <ul class="nav justify-content-center nav-pills nav-fill p-3 bg-white">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class='bx bxs-home me-2'></i>Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="comunidad.jsp"><i class='bx bxs-group me-2'></i>Comunidad de apoyo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tienda.jsp"><i class='bx bxs-store me-2'></i>Tienda</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="calendario.jsp"><i class='bx bxs-calendar me-2'></i>Calendario</a>
                </li> 
                <%
                    //Se verifica si el usuario tiene una membresia
                    if (membresia == 2) {
                %>
                <%--(MEMBRESIA HABILITADA)--%>
                <li class="nav-item">
                    <a class="nav-link" href="programarReunion.jsp"><i class='bx bxs-calendar-plus me-2'></i>Programar Reunion</a>
                </li>
                <%
                    }
                %>
            </ul>
            <% 
                if (perfil_usuario == 2){
            %>
            <%@ include file="../componentes/especialista/offcanvasAgregarGuia.jsp" %>
            <%
                }
            %>
        </div>
        <%@ include file="../componentes/usuario/modalAdquirirMembresia.jsp" %> <!-- Incorpora el modal para la membresia -->
