<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - BabyBliss</title>
    
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
            background-image: url(https://img.freepik.com/free-psd/maternity-baby-shower-background_23-2150237221.jpg);
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
            max-width: 400px;
            width: 100%;
        }

        .form-floating > label {
            padding-left: 1rem;
        }

        .form-floating > .form-control {
            padding-left: 1rem;
        }

        .form-container img {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

<main class="form-container">
    <form method="post" action="../srvIniciarSesion?accion=verificar">
        <center>
            <img src="../babybliss_logo.png" alt="BabyBliss Logo" width="150" height="150">
            <h1 class="h3 mb-3 fw-normal">Inicia sesión</h1>
        </center>

        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" name="txtCorreo" placeholder="nombre@ejemplo.com" required>
            <label for="floatingInput">Correo</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" name="txtClave" placeholder="Contraseña" required>
            <label for="floatingPassword">Contraseña</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Recordar contraseña
            </label>
        </div>

        <center>
            <button class="btn btn-lg btn-primary" type="submit">Inicia Sesion</button>

            <div class="mt-3">
                <p>¿No tienes una cuenta? <a href="registrar.jsp">Registrarse</a></p>
            </div>
            <p class="mt-5 mb-3 text-body-secondary">BabyBliss &copy; 2024</p>
        </center>

        <%
            String mensaje = (String)request.getAttribute("mensaje");
            if (mensaje != null) {
                out.print("<p style='color: red; text-align: center;'>"+mensaje+"</p>");
            }
        %>
    </form>
</main>

</body>
</html>



