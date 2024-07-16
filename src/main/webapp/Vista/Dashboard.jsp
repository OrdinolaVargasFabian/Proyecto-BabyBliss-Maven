<%@ include file="header.jsp" %>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Muestra de graficos</title>
        </head>
        <style>
            label {
                padding-top: 20px;
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
            <div class="form-floating">
                <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
                    onchange="mostrarInformacion(this.value)">
                    <option selected>Las tablas a su disposicion</option>
                    <option value="Usuarios">Usuarios</option>
                    <option value="Productos">Productos</option>
                    <option value="Comentarios">Comentarios</option>
                </select>
                <label for="floatingSelect">Visualice su tabla</label>
            </div>

            <div id="infoTabla" style="margin-top: 20px;">
                <!-- Aquí se mostrará la información de la tabla -->
            </div>

            <script>
                $.ajax({
                    url: 'srvTablas',
                    type: 'GET',
                    data: { opcion: 'Usuarios' },
                    success: function (response) {
                        $('#infotabla').html(response);
                    },
                    error: function () {
                        console.log('Error al obtener los datos');
                    }
                });

                function mostrarInformacion(opcion) {
                    if (opcion == "") {
                        document.getElementById("infoTabla").innerHTML = "Seleccione una opción para mostrar la información.";
                        return;
                    } else {
                        var url = "";
                        switch (opcion) {
                            case "Usuarios": // Asumiendo que el valor "1" corresponde a Usuarios
                                url = "../srvTablas?opcion=Usuarios";
                                break;
                            // Agrega casos adicionales según sea necesario
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
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->
        