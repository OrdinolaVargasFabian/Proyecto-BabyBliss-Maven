<%@ include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seleccionar Dashboard</title>
<style>

        h1 {
            margin-bottom: 20px;
        }

    </style>
<body>
    <h1>Seleccionar Tipo de Dashboard</h1>
    <form action="direccionargrafico.jsp" method="post">
        <input type="radio" id="tipoCircular" name="tipoDashboard" value="circulo">
        <label for="tipoCircular">Dashboard de Membresias</label><br>
        <input type="radio" id="tipoBarras" name="tipoDashboard" value="barras">
        <label for="tipoBarras">Dashboard de Productos mas vendidos</label><br><br>
        <input type="submit" value="Generar Gráfico">
    </form>
</body>
</html>
