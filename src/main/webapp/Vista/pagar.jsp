<%@ include file="header.jsp" %> <!-- Incorpora el código del archivo header -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Pago</title>
    <link href="../CSS/pagoMembresia.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="content">
        <h1>Gracias por adquirir la membresía BabyGold</h1>
        <h2>Seleccione su método de pago</h2>
        <div class="payment-options">
            <div class="option" onclick="selectPayment('Tarjeta')">
                <img src="../IMG/TARJETA.png" alt="Tarjeta">
                <div class="circle" id="circle-Tarjeta"></div>
            </div>
            <div class="option" onclick="selectPayment('YAPE')">
                <img src="../IMG/YAPE.png" alt="Yape">
                <div class="circle" id="circle-YAPE"></div>
            </div>
            <div class="option" onclick="selectPayment('PLIN')">
                <img src="../IMG/PLIN.png" alt="Plin">
                <div class="circle" id="circle-PLIN"></div>
            </div>
            <div class="option" onclick="selectPayment('Transferencia')">
                <img src="../IMG/TRANSFERNCIA.png" alt="Transferencia">
                <div class="circle" id="circle-Transferencia"></div>
            </div>
        </div>
        <button onclick="proceedToPayment()">Proceder al pago</button>
    </div>
    <script src="../JS/pagarMembresia.js" type="text/javascript"></script>
</body>
</html>

<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->
