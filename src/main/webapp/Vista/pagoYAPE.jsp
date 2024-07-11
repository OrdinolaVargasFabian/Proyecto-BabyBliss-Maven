<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YAPE</title>

    </head>
    <body>
        <link href="../CSS/pagoYAPE.css" rel="stylesheet" type="text/css"/>
        <div class="cont">
            <img src="../IMG/QR_YAPE.png" alt=""/>
            <br><br>
            <div class="buttom">
                <form id="formulario" action="" method="post" enctype="multipart/form-data" onsubmit="return false">
                    <input type="file" id="evidencia" name="evidencia" accept="image/*" required>
                    <br><br>
                    <input type="submit" onclick="pagar()" value="Enviar" id="enviarBtn">
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
            
            function pagarCarrito() {
                    var carrito = JSON.parse(localStorage.getItem('cart'));
                    $.ajax({
                        url: '../srvCarrito?total=' + total,
                        type: 'POST',
                        contentType: 'application/json', // Especifica que el tipo de contenido es JSON
                        data: JSON.stringify({carrito: carrito}), // Convierte el objeto a una cadena JSON
                        beforeSend: function () {
                            swal.fire({
                                title: 'ESPERA',
                                html: 'Procesando...',
                                didOpen: () => {
                                    swal.showLoading()
                                }
                            })
                        },
                        success: function (response) {
                            localStorage.clear();
                            swal.fire({
                                title: '¡Felicidades!',
                                text: 'Tu pago ha sido completado',
                                icon: 'success',
                                confirmButtonText: 'Aceptar'
                            }).then((result) => {
                                if (result.value) {
                                    window.location.href = "babyShop.jsp";
                                }
                            });
                        }
                    });
            }
            
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
            
            function pagar(){
                var pagar = localStorage.getItem('quePagarValor');
                if (pagar == 'carrito') {
                    pagarCarrito();
                    console.log("pagar carrito");
                } else if (pagar == 'membresia') {
                    adquirirMembresia();
                    console.log("pagar membresia");
                } else {
                    console.log("error");
                }
                console.log(localStorage.getItem('quePagarValor'));
                localStorage.removeItem('quePagarValor');
            }
        </script>
    </body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->