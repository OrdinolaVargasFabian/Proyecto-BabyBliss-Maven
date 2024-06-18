<%@ include file="header.jsp" %> 
<link href="../CSS/pagoTarjeta.css" rel="stylesheet" type="text/css"/>
<html>
    <body>
        <div class="cont">
            <form method="post"> <!-- Formulario que envía los datos al servlet -->
                <div class="content">
                    <div class="col">
                        <h3 class="title">Datos Personales</h3>
                        <div class="input">
                            <span>Nombre completo</span>
                            <input type="text" name="nombreCompleto" required>
                        </div>
                        <div class="input">
                            <span>Correo</span>
                            <input type="email" name="correo" required>
                        </div>
                        <div class="input">
                            <span>Dirección</span>
                            <input type="text" name="direccion" required>
                        </div>
                        <div class="input">
                            <span>País</span>
                            <input type="text" name="pais" required>
                        </div>
                        <div class="flex">
                            <div class="input">
                                <span>Ciudad</span>
                                <input type="text" name="ciudad" required>
                            </div>
                            <div class="input">
                                <span>ZIP</span>
                                <input type="text" name="zip" required>
                            </div>
                        </div>
                    </div>           
                    <div class="col">
                        <h3 class="title">Método de pago</h3>
                        <div class="input">
                            <span>Tarjetas aceptadas</span>
                            <img src="../IMG/TARJETAS.png" alt=""/>
                        </div>
                        <div class="input">
                            <span>Nombre del titular</span>
                            <input type="text" name="nombreTitular" required>
                        </div>
                        <div class="input">
                            <span>Número de la tarjeta</span>
                            <input type="number" name="numeroTarjeta" required>
                        </div>
                        <div class="input">
                            <span>Mes</span>
                            <input type="text" name="mes" required>
                        </div>

                        <div class="flex">
                            <div class="input">
                                <span>Año</span>
                                <input type="number" name="anio" required>
                            </div>
                            <div class="input">
                                <span>CVV</span>
                                <input type="text" name="cvv" required>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" value="Pagar" class="submit-btn" onclick="adquirirMembresia()">
            </form>
        </div>
        <script>
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