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
        <strong>ï¿½Bienvenido(a) a la secciï¿½n de comunidad!</strong> Puedes iniciar sesiï¿½n para compartir tus dudas.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <div id="comunidad-box"></div>
    <div class="container mt-3 bg-white rounded p-4 shadow">
        <!-- Encabezado de la publicaciÃ³n -->
        <div class="d-flex align-items-center">
            <div class="">
                <img src="../default.png" alt="User" class="rounded-circle" style="width: 50px;">
            </div>
            <div>
                <strong class="ml-2 row ms-2">Nombre de usuario</strong>
                <small class="row ms-2">12:22 | 06/05/2024</small>
            </div>
        </div>
        <hr>
        <!-- Contenido de la publicaciÃ³n -->
        <div class="ps-3 pe-3">
            <h4 class="mt-3">Alimentos naturales para mi hija</h4>
            <p class="">Hola, espero me puedan ayudar sugiriendome alimentos naturales para mi hija.</p>
        </div>
        <hr>
        <!-- Botones de reacciÃ³n y comentarios -->
        <div class="d-flex justify-content-between align-items-center">
            <a href="#" class="btn btn-outline-primary"><i class='bx bx-like me-2'></i><small>0</small></a>
            <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseComentario" aria-expanded="false" aria-controls="collapseExample">
                <i class='bx bx-comment me-2'></i><small>Comentar</small>
            </button>
        </div>
        <!-- Mostrar form para comentar -->
        <div class="collapse mt-3" id="collapseComentario">
            <div class="card card-body">
                <form>
                    <div class="mb-3">
                        <label for="comentario" class="form-label">Comentario:</label>
                        <textarea class="form-control" id="comentario" rows="2" placeholder="Mensaje..."></textarea>
                    </div>
                    <div class="d-inline-flex gap-1">
                        <button class="btn btn-primary">Comentar</button>
                        <button class="btn btn-danger">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
        <hr>
        <!-- Comentarios de la publicaciÃ³n -->
        <div class="mt-3 ps-3 pe-3">
            <div class="d-flex align-items-center">
                <div class="">
                    <img src="../default.png" alt="User" class="rounded-circle" style="width: 50px;">
                </div>
                <div>
                    <strong class="ml-2 row ms-2">Nombre de usuario</strong>
                    <small class="row ms-2">12:58 | 06/05/2024</small>
                </div>
            </div>
            <hr>
            <div class="ps-3 pe-3">
                <p class="">Hola! Deberias de probar prepararle extractos de beterraga, son muy saludables.</p>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        cargarComunidad();
    });
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
                            '<strong class="ml-2 row ms-2">Prueba Nombre</strong>' +
                            '<small class="row ms-2">12:22 | 06/05/2024</small>' +
                            '</div>' +
                            '</div>' +
                            '<hr>' +
                            '<div class="ps-3 pe-3">' +
                            '<h4 class="mt-3">'+data[i].titulo+'</h4>' +
                            '<p class="">'+data[i].contenido+'</p>' +
                            '</div>' +
                            '<hr>' +
                            '<div class="d-flex justify-content-between align-items-center">' +
                            '<a href="#" class="btn btn-outline-primary"><i class="bx bx-like me-2"></i><small>0</small></a>' +
                            '<button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseComentario'+data[i].idForo+'" aria-expanded="false" aria-controls="collapseExample">' +
                            '<i class="bx bx-comment me-2"></i><small>Comentar</small>' +
                            '</button>' +
                            '</div>' +
                            '<div class="collapse mt-3" id="collapseComentario'+data[i].idForo+'">' +
                            '<div class="card card-body">' +
                            '<form method="POST" onsubmit="return false">' +
                            '<div class="mb-3">' +
                            '<label for="comentario" class="form-label">Comentario:</label>' +
                            '<textarea class="form-control" id="comentario" rows="2" placeholder="Mensaje..."></textarea>' +
                            '</div>' +
                            '<div class="d-inline-flex gap-1">' +
                            '<button class="btn btn-primary">Comentar</button>' +
                            '<button class="btn btn-danger" onclick="ocultarComentar('+data[i].idForo+')">Cancelar</button>' +
                            '</div>' +
                            '</form>' +
                            '</div>' +
                            '</div>' +
                            '</div>'
                            );
                }
            },
            error: function (xhr, status, error) {
                console.error("Error obtener comunidad " + error);
            }
        });
    }

    function agregarPublicacion() {
        let titulo = $('#titulo').val();
        let mensaje = $('#contenido').val();
        $.ajax({
            url: '../srvControladorComunidad?accion=agregar&titulo='+titulo+'&mensaje='+mensaje,
            type: 'post',
            data: {},
            beforeSend: function () {
                swal.fire({
                    title: 'ESPERA',
                    html: 'Procesando...',
                    didOpen: () => {
                        swal.showLoading()
                    }
                })
            },
            success: function (response) {
                document.getElementById('frmAgregarPublicacion').reset();
                swal.fire({
                    title: '¡Felicidades!',
                    text: 'Tu publicación ha sido completada y estarï¿½ en revisión, se te notificará cuando sea publicada',
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                });
            }
        });
    }
    
    function ocultarComentar(id) {
        $('#collapseComentario'+id).collapse('hide');
    }
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->