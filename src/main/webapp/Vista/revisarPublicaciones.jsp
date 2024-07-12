<%@ include file="header.jsp" %> <!-- Incorpora el cÃ³digo del archivo header -->
<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <button class="btn btn-primary mb-3" onclick="recargarTabla()"><i class='bx bx-revision me-2'></i>Refrescar</button>
    <table id="datatable-revisarPublicaciones" class="table table-striped m-3">
        <thead>
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Titulo</th>
                <th>Contenido</th>
                <th>Fecha de Publicación</th>
                <th>Usuario</th>
                <th>Acciones</th>
            </tr>
        </thead>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('#datatable-revisarPublicaciones').DataTable({
            "ajax": {
                "url": "../srvControladorComunidad?accion=listarDT",
                "type": "POST",
                "dataSrc": "data"
            },
            "columns": [
                {"data": ""},
                {"data": "idForo"},
                {"data": "titulo"},
                {"data": "contenido"},
                {"data": "fechaCreacion"},
                {"data": "usuario"},
                {"data": ""}
            ],
            columnDefs: [
                {
                    // Numeracion de las filas
                    targets: 0,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, full, meta) {
                        return meta.row + 1;
                    }
                },
                {
                    // Actions
                    targets: -1,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, full, meta) {
                        var btnEliminar = "<button onclick='rechazarPublicacion(\"" + full['idForo'] + "\", \"" + full['correo'] + "\")' type='button' class='btn btn-icon btn-outline-danger  me-2'><i class='tf-icons bx bxs-trash'></i></button>"
                        var btnAceptar = "<button onclick='aceptarPublicacion(\"" + full['idForo'] + "\", \"" + full['correo'] + "\")' type='button' class='btn btn-icon btn-outline-success  me-2'><i class='bx bxs-check-circle'></i></button>"

                        return (
                                '<div class="d-inline-block text-nowrap">' +
                                btnAceptar +
                                btnEliminar +
                                '</div>'
                                );
                    }
                }
            ],
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
                searchPlaceholder: 'Search..',
                "emptyTable": "No hay publicaciones disponibles para revisar"
            },
            buttons: [
                {
                    extend: 'print',
                    text: '<i class="bx bxs-printer me-2"></i>Imprimir',
                    titleAttr: 'Imprimir',
                    className: 'btn btn-info text-white rounded ms-4'
                }
            ]
        });
    });

    function recargarTabla() {
        $('#datatable-revisarPublicaciones').DataTable().ajax.reload();
    }

    function aceptarPublicacion(id, correo) {
        $.ajax({
            url: '../srvControladorComunidad?accion=editar',
            type: 'POST',
            data: {
                idForo: id,
                correo: correo
            },
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
                swal.fire({
                    title: 'CORRECTO',
                    text: 'El comunicado ha sido aprobado y será visible para todos los usuarios',
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                });
                recargarTabla();
            }
        });
    }

    function rechazarPublicacion(id, correo) {
        swal.fire({
            title: 'Rechazar Publicación',
            text: 'Por favor, describe el motivo del rechazo:',
            input: 'textarea',
            inputPlaceholder: 'Escribe el motivo­...',
            showCancelButton: true,
            confirmButtonText: 'Enviar',
            cancelButtonText: 'Cancelar',
            inputValidator: (value) => {
                if (!value) {
                    return '¡Necesitas escribir un motivo!';
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../srvControladorComunidad?accion=eliminar',
                    type: 'POST',
                    data: {
                        idForo: id,
                        motivo: result.value,
                        correo: correo
                    },
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
                        swal.fire({
                            title: 'CORRECTO',
                            text: 'El comunicado ha sido rechazado',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        });
                        console.log(result.value);
                        recargarTabla();
                    }
                });
            }
        });
    }
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el cÃ³digo del archivo footer -->