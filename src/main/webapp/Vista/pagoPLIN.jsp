<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<body>
<link href="../CSS/pagoPLIN.css" rel="stylesheet" type="text/css"/>
    <div class="cont">
        <img src="../IMG/QR_PLIN.png" alt="">
        <br><br>
        <div class="buttom">
            <form id="formulario" action="" method="post" enctype="multipart/form-data">
                <input type="file" id="evidencia" name="evidencia" accept="image/*" required>
 
                <br><br>
                <input type="submit" value="Enviar" id="enviarBtn">
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
</script>

<%@ include file="footer.jsp" %>
</body>
</html>

