<div class="modal fade modal-lg" id="mdlConfigBD" tabindex="-1" aria-labelledby="mdlConfigBD" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container p-5">
                    <h3 class="text-center mb-5">Detalles Base de Datos<i class='bx bx-data ms-3'></i></h3>
                    <div class="row mb-3">
                        <div class="col">
                            <label>Nombre Base de Datos:</label>
                            <input type="text" class="form-control" id="nombreBD" value="nombreBD" disabled>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label>Servidor:</label>
                            <input type="text" class="form-control" id="servidor" value="servidor" disabled>
                        </div>
                        <div class="col">
                            <label>Puerto:</label>
                            <input type="text" class="form-control" id="puerto" value="puerto" disabled>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label>Usuario:</label>
                            <input type="text" class="form-control" id="usuario" value="usuario" disabled>
                        </div>
                        <div class="col">
                            <label>Clave:</label>
                            <input type="text" class="form-control" id="contrasena" value="contrasena" disabled>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label>URL:</label>
                            <input type="text" class="form-control" id="url" value="url" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function mostrarConfigBD() {
        $.ajax({
            url: '../srvConfiguracionBD',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                console.log(response);
                mostrarConfiguracionBD(response.nombreBD, response.servidor, response.puerto, response.usuario, response.clave, response.url);
                $('#mdlConfigBD').modal('show');
            }
        });
    }

    function mostrarConfiguracionBD(nombreBD, servidor, puerto, usuario, contrasena, url) {
        document.getElementById("nombreBD").value = nombreBD;
        document.getElementById("servidor").value = servidor;
        document.getElementById("puerto").value = puerto;
        document.getElementById("usuario").value = usuario;
        document.getElementById("contrasena").value = contrasena;
        document.getElementById("url").value = url;
    }
</script>