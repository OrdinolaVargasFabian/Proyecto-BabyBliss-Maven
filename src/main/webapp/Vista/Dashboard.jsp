<%@ include file="header.jsp" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muestra de graficos</title>
    </head>
    <style>
        label {
            padding-top:  20px;
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        select {
            width: 200px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: white;
            font-size: 16px;
            color: #333;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        select:focus {
            border-color: #007BFF;
            outline: none;
        }
    </style>
    <body>

        <div class="combo-box-container">
            <label for="comboBox">Selecciona una opción:</label>
            <select id="comboBox" name="options">
                <option value="opcion1">Usuario</option>
                <option value="opcion2">Productos</option>
                <option value="opcion3">Comentarios</option>
                
            </select>
        </div>
        
    </body>
</html>
