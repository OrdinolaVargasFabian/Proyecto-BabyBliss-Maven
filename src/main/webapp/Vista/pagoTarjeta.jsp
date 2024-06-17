<%@ include file="header.jsp" %> 
<link href="../CSS/pagoTarjeta.css" rel="stylesheet" type="text/css"/>
<html>
<body>
    <div class="cont">
        <form action="">
            <div class="content">
                <div class="col">
                    <h3 class="title">Datos Personales</h3>
                    <div class="input">
                        <span>Nombre completo</span>
                        <input type="text" required>
                    </div>
                    <div class="input">
                        <span>Correo</span>
                        <input type="email" required>
                    </div>
                    <div class="input">
                        <span>Dirección</span>
                        <input type="text" required>
                    </div>
                    <div class="input">
                        <span>País</span>
                        <input type="text" required>
                    </div>
                    <div class="flex">
                        <div class="input">
                                <span>Ciudad</span>
                                <input type="text" required>
                            </div>
                        <div class="input">
                                <span>ZIP</span>
                                <input type="text" required>
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
                        <input type="text" required>
                    </div>
                    <div class="input">
                        <span>Número de la tarjeta</span>
                        <input type="number" required>
                    </div>
                    <div class="input">
                        <span>Mes</span>
                        <input type="text" required>
                    </div>

                    <div class="flex">
                    <div class="input">
                            <span>Año</span>
                            <input type="number" required>
                        </div>
                    <div class="input">
                            <span>CVV</span>
                            <input type="text" required>
                        </div>
                    </div>
                </div>
            </div>
<input type="submit" value="Pagar" class="submit-btn" id="pagarBtn">
        </form>
    </div>     

<script>
    document.getElementById('pagarBtn').addEventListener('click', function(event) {
        event.preventDefault(); // Evitar que el formulario se envíe automáticamente

        // Mostrar mensaje en ventana emergente
        alert('¡Gracias por comprar la membresía BabyGold! Será redirigido al inicio.');
        window.location.href = "index.jsp"; // Redirigir al usuario al inicio
    });
</script>
    
</body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->