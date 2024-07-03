<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Dashboard de Membresias</h1>
        <form action="<%=request.getContextPath()%>/srvObtenerMembresia">
            <input type="submit" value="Generar gráfico">
        </form> 
    </body>
</html>

