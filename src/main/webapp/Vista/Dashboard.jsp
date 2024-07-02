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
    <div class="form-floating">
        <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
            <option selected>Las tablas a su disposicion</option>
            <option value="1">Usuarios</option>
            <option value="2">Productos</option>
            <option value="3">Comentarios</option>
        </select>
        <label for="floatingSelect">Visualice su tabla</label>
    </div>

    <div id="infoTabla" style="margin-top: 20px;">
        <!-- Aquí se mostrará la información de la tabla -->
    </div>

    <script>
        function mostrarInformacion(opcion) {
            if (opcion == "") {
                document.getElementById("infoTabla").innerHTML = "Seleccione una opción para mostrar la información.";
                return;
            } else {
                var url = "";
                if (opcion === "Usuarios") {
                    url = "srvTablas";
                } else {
                    // Aquí puedes agregar otras opciones y sus correspondientes URLs de servlet
                }

                if (url !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            document.getElementById("infoTabla").innerHTML = this.responseText;
                        }
                    };
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                }
            }
        }
    </script>
</body>
</html>
