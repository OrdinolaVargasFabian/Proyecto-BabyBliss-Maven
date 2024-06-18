<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YAPE</title>
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
                <img src="../IMG/PagoYape.png" alt="QR">
            </div>
        </div>

        <link href="../CSS/pagoYAPE.css" rel="stylesheet" type="text/css"/>
        <div class="cont">
            <img src="../IMG/QR_YAPE.png" alt="">
            <br><br>
            <div class="buttom">
                <form id="formulario" action="" method="post" enctype="multipart/form-data">
                    <input type="file" id="evidencia" name="evidencia" accept="image/*" required>
                    <br><br>
                    <input type="submit" onclick="adquirirMembresia()" value="Enviar" id="enviarBtn">
                </form>
            </div>
        </div>

        <script>
            document.getElementById('formulario').addEventListener('submit', function(event) {
                event.preventDefault(); // Evitar que el formulario se envíe automáticamente

                // Mostrar mensaje en ventana emergente
                alert('¡Gracias por comprar la membresía BabyGold! Será redirigido al inicio.');
                window.location.href = "index.jsp";
            });
            
            function adquirirMembresia() {
                var id = $('#idUsuario').val();
                $.ajax({
                    type: "POST",
                    url: "../srvPagarMembresia?id=" + id,
                    beforeSend: function () {
                        swal.fire({
                            title: 'ESPERA',
                            html: 'Procesando...',
                            didOpen: () => {
                                swal.showLoading()
                            }
                        })
                    },
                    success: function (data, textStatus, jqXHR) {
                        swal.fire({
                            title: '¡Felicidades!',
                            text: 'Tu pago ha sido completado, disfruta tu membresia adquiridad',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.value) {
                                window.location.href = "index.jsp";
                            }
                        });
                    }
                });
            }
        </script>
    </body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->