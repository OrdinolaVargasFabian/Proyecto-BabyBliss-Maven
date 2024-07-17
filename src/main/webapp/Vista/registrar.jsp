<%-- 
    Document   : registrar
    Created on : 19 may 2024, 16:03:41
    Author     : Fabrizzio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar Sesión - BabyBliss</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            body {
                background-image: url('https://img.freepik.com/free-psd/maternity-baby-shower-background_23-2150237221.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .form-container {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
                max-width: 500px;
                width: 100%;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .col {
                flex: 1 1 calc(50% - 10px);
                min-width: calc(50% - 10px);
            }

            .form-floating {
                position: relative;
            }


            .form-floating input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ced4da;
                box-sizing: border-box;
            }

            .form-floating label {
                position: absolute;
                top: -10px;
                left: 10px;
                
                padding: 0 5px;
                font-size: 12px;
                color: #495057;
            }

            button {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            .text-body-secondary {
                color: #6c757d;
            }

            .mt-3 {
                margin-top: 1rem;
            }

            .mb-3 {
                margin-bottom: 1rem;
            }

            .form-container img {
                margin-bottom: 1rem;
            }
        </style>
    </head>
    <body>
        <main class="form-container">
            <form method="post"  action="<%=request.getContextPath()%>/svrRegistroUsuario" accept-charset="UTF-8">
                <center>
                    <img src="../babybliss_logo.png" alt="BabyBliss Logo" width="150" height="150">
                    <h1 class="h3 mb-3 fw-normal">Registrar Sesión</h1>
                </center>

                <div class="row mb-3">
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingNombre" name="txtNombre" placeholder="Nombre" required>
                            <label for="floatingNombre">Nombre</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingApellidoPaterno" name="txtApellidoPaterno" placeholder="Apellido Paterno" required>
                            <label for="floatingApellidoPaterno">Apellido Paterno</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingApellidoMaterno" name="txtApellidoMaterno" placeholder="Apellido Materno" required>
                            <label for="floatingApellidoMaterno">Apellido Materno</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingDNI" name="txtDNI" placeholder="DNI" required>
                            <label for="floatingDNI">DNI</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="date" class="form-control" id="floatingFechaNacimiento" name="txtFechaNacimiento" placeholder="Fecha de Nacimiento" required>
                            <label for="floatingFechaNacimiento">Fecha de Nacimiento</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingTelefono" name="txtTelefono" placeholder="Teléfono" required>
                            <label for="floatingTelefono">Teléfono</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingEmail" name="txtCorreo" placeholder="nombre@ejemplo.com" required>
                            <label for="floatingEmail">Correo</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" name="txtClave" placeholder="Contraseña" required>
                            <label for="floatingPassword">Contraseña</label>
                        </div>
                    </div>
                </div>

                <center>
                    <button class="btn btn-lg btn-primary" type="submit" >Registrar</button>

                    <div class="mt-3">
                        <p>¿Ya tienes una cuenta? <a href="login.jsp">Iniciar Sesión</a></p>
                    </div>
                    <p class="mt-5 mb-3 text-body-secondary">BabyBliss &copy; 2024</p>
                </center>

                <%
                    String mensaje = (String) request.getAttribute("mensaje");
                    if (mensaje != null) {
                        out.print("<p style='color: red; text-align: center;'>" + mensaje + "</p>");
                    }
                %>
            </form>
        </main>


    </body>
</html>
