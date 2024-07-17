<%@ include file="header.jsp" %> <!-- Incorpora el cÃ³digo del archivo header -->
<div>
    <%        //Se verifica si el usuario actual es especialista
        if (perfil_usuario == 2) {
    %>
    <!-- (ADMINISTRADOR) Redireccionar a REVISAR PUBLICACIONES PENDIENTES -->
    <div class="container bg-white rounded p-4 shadow">
        <a href="revisarPublicaciones.jsp" class="mt-3"><i class='bx bx-time me-2'></i>Revisar publicaciones pendientes</a>
    </div>
    <%
        }
    %>
    <%
        //Se verifica si hay un usuario logueado
        if (perfil_usuario != 0) {
    %>
    <!-- Form para hacer una publicaciÃ³n -->
    <div class="container mt-3 bg-white rounded p-4 shadow">
        <form id="frmAgregarPublicacion" method="POST" onsubmit="return false">
            <div class="mb-3">
                <label for="titulo" class="form-label">Titulo:</label>
                <input type="text" class="form-control" name="titulo" id="titulo">
            </div>
            <div class="mb-3">
                <label for="contenido" class="form-label">Mensaje:</label>
                <textarea class="form-control" name="contenido" id="contenido" rows="3" placeholder="Mensaje..."></textarea>
            </div>
            <div class="d-inline-flex gap-1">
                <button class="btn btn-primary" onclick="agregarPublicacion()">Publicar</button>
            </div>
        </form>
    </div>
    <%
    } else {
    %>
    <div class="alert alert-primary alert-dismissible fade show" role="alert">
        <strong>¡Bienvenido(a) a la sección de comunidad!</strong> Puedes iniciar sesión para compartir tus dudas.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <div id="comunidad-box"></div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        cargarComunidad();
    });
    function agregarComentario(idForo) {
        let comentario = $('#comentario' + idForo).val();
        $.ajax({
            url: '../srvControladorComunidad?accion=agregarComentario',
            type: 'post',
            data: {
                idForo: idForo,
                comentario: comentario
            },
            success: function (response) {
                console.log("Comentario agregado correctamente");
                cargarComunidad();
            },
            error: function (xhr, status, error) {
                console.error("Error al agregar comentario: " + error);
            }
        });
    }
    function mostrarReacciones(idForo) {
        $('#reacciones' + idForo).toggle();
    }

    function reaccionar(idForo, tipoReaccion) {
        $('#reaccion' + idForo).text(tipoReaccion);
        $('#reacciones' + idForo).hide();
    }



    function ocultarComentar(id) {
        $('#collapseComentario' + id).collapse('hide');
    }


    function cargarComunidad() {
        $.ajax({
            url: '../srvControladorComunidad?accion=listar',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                $('#comunidad-box').empty();
                for (var i = 0; i < data.length; i++) {
                    $('#comunidad-box').append(
                            '<div class="container mt-3 bg-white rounded p-4 shadow">' +
                            '<div class="d-flex align-items-center">' +
                            '<div class="">' +
                            '<img src="../default.png" alt="User" class="rounded-circle" style="width: 50px;">' +
                            '</div>' +
                            '<div>' +
                            '<strong class="ml-2 row ms-2">' + data[i].usuario + '</strong>' +
                            '<small class="row ms-2">' + data[i].fechaCreacion + '</small>' +
                            '</div>' +
                            '</div>' +
                            '<hr>' +
                            '<div class="ps-3 pe-3">' +
                            '<h4 class="mt-3">' + data[i].titulo + '</h4>' +
                            '<p class="">' + data[i].contenido + '</p>' +
                            '</div>' +
                            '<hr>' +
                            '<div class="d-flex justify-content-between align-items-center">' +
                            '<a href="#" class="btn btn-outline-primary" onclick="mostrarReacciones(' + data[i].idForo + ')"><i class="fas fa-thumbs-up me-2"></i><small id="reaccion' + data[i].idForo + '">Reaccionar</small></a>' +
                            '<button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseComentario' + data[i].idForo + '" aria-expanded="false" aria-controls="collapseExample">' +
                            '<i class="fas fa-comment me-2"></i><small>Comentar</small>' +
                            '</button>' +
                            '</div>' +
                            '<div class="collapse mt-3" id="collapseComentario' + data[i].idForo + '">' +
                            '<div class="card card-body">' +
                            '<form method="POST" onsubmit="return false">' +
                            '<div class="mb-3">' +
                            '<label for="comentario" class="form-label">Comentario:</label>' +
                            '<textarea class="form-control" id="comentario' + data[i].idForo + '" rows="2" placeholder="Mensaje..."></textarea>' +
                            '</div>' +
                            '<div class="d-inline-flex gap-1">' +
                            '<button class="btn btn-primary" onclick="agregarComentario(' + data[i].idForo + ')">Comentar</button>' +
                            '<button class="btn btn-danger" onclick="ocultarComentar(' + data[i].idForo + ')">Cancelar</button>' +
                            '</div>' +
                            '</form>' +
                            '</div>' +
                            '</div>' +
                            '<div id="reacciones' + data[i].idForo + '" style="display: none;">' +
                            '<button class="btn btn-outline-primary" onclick="reaccionar(' + data[i].idForo + ', \'Me gusta\')"><i class="fas fa-thumbs-up me-2"></i>Me gusta</button>' +
                            '<button class="btn btn-outline-primary" onclick="reaccionar(' + data[i].idForo + ', \'Me encanta\')"><i class="fas fa-heart me-2"></i>Me encanta</button>' +
                            '<button class="btn btn-outline-primary" onclick="reaccionar(' + data[i].idForo + ', \'Me importa\')"><i class="fas fa-hand-holding-heart me-2"></i>Me importa</button>' +
                            '<button class="btn btn-outline-primary" onclick="reaccionar(' + data[i].idForo + ', \'Me entristece\')"><i class="fas fa-sad-tear me-2"></i>Me entristece</button>' +
                            '<button class="btn btn-outline-primary" onclick="reaccionar(' + data[i].idForo + ', \'Me enfada\')"><i class="fas fa-angry me-2"></i>Me enfada</button>' +
                            '</div>' +
                            '</div>'
                            );
                }
            },
            error: function (xhr, status, error) {
                console.error("Error al cargar comunidad: " + error);
            }
        });
    }
    $(document).ready(function () {
        cargarComunidad();
    });
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->