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
        .excel-button {
            position: absolute;
            right: 20px;

            padding: 10px 20px;
            background-color: #4CAF50;
            padding-top: 1.5%;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .excel-button:hover {
            background-color: #45a049;
        }
        .form-floating {
            margin-bottom: 20px;
        }
        #infoTabla {
            margin-top: 60px; /* Asegura que el contenido tenga suficiente espacio respecto al botón */
        }

    </style>

    <body>
        <div class="form-floating m-3">
            <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
                    onchange="mostrarInformacion(this.value)">
                <option selected>Las tablas a su disposicion</option>
                <option value="Usuarios">Usuarios</option>
                <option value="Productos">Productos</option>
                <option value="Comentarios">Comentarios</option>
            </select>
            <label for="floatingSelect">Seleccione una tabla:</label>
        </div>

        <div id="infoTabla" class="m-3 p-3 shadow rounded bg-white" style="margin-top: 20px; align-content: center;">
            <div id='btnExport' class="mb-3"></div>
            <table id='tblDinamica' class="m-3"></table>
        </div>
        
        <script>
            $.ajax({
                url: 'srvTablas',
                type: 'GET',
                data: {opcion: 'Usuarios'},
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
                                //document.getElementById("infoTabla").innerHTML = this.responseText;
                                generarTablaEstilo(this.responseText);
                            }
                        };
                        xmlhttp.open("GET", url, true);
                        xmlhttp.send();
                    }
                }
            }

            function generarTablaEstilo(table) {
                if ($.fn.DataTable.isDataTable('#tblDinamica')) {
                    $('#tblDinamica').DataTable().destroy(); // Destruye la instancia existente
                    $('#tblDinamica').empty(); // Limpia el contenido de la tabla
                }
                $('#tblDinamica').html(table);
                $('#btnExport').empty();
                $('#btnExport').append('<a href="../exportaApachePOI" type="button" class="btn btn-success"><i class="bx bxs-file-export me-2"></i>Excel</a>');
                $('#tblDinamica').DataTable({
                    columnDefs: [],
                    order: [[0, 'asc']],
                    dom: '<"row mx-2"' +
                            '<"col-md-2"<"me-3"l>>' +
                            '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0"fB>>' +
                            '>t' +
                            '<"row mx-2"' +
                            '<"col-sm-12 col-md-6"i>' +
                            '<"col-sm-12 col-md-6"p>' +
                            '>',
                    language: {
                        sLengthMenu: '_MENU_',
                        search: '',
                        searchPlaceholder: 'Search..'
                    },
                    buttons: [],
                    responsive: true
                });

            }

            function aplicarEstiloExcel() {
                var tabla = document.querySelector("#infoTabla table");
                if (tabla) {
                    tabla.classList.add("excel-style");
                }
            }
        </script>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Incorpora el cÃ³digo del archivo footer -->
