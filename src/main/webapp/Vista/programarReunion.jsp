<%@ include file="header.jsp" %> <!-- Incorpora el código del archivo header -->
<%
    //Se valida si el usuario tiene una membresia y evita cargar la página si no la tiene
    if (membresia == 2) {
%>
<h2 class="ms-3 mb-3 text-center fw-bold" style="color: #9999ff;">SELECCIONAR ESPECIALISTA</h2>
<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-especialistasDisponibles" class="table table-striped m-3">
        <thead>
            <tr>
                <td class="text-center">#</td>
                <td class="text-center">NOMBRE COMPLETO</td>
                <td class="text-center">ESPECIALIDAD</td>
                <td class="text-center">ESTADO</td>
                <td class="text-center">ACCIONES</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-center">1</td>
                <td class="text-center">Jorge Perez Zapata</td>
                <td class="text-center">Pediatra</td>
                <td class="text-center"></td>
                <td class="text-center"></td>
            </tr>
        </tbody>
    </table>
</div>
<%@ include file="../componentes/usuario/modalProgramarReunion.jsp" %>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->
<script>
    $(document).ready(function () {
        $('#datatable-especialistasDisponibles').DataTable({
            columnDefs: [
                {
                    target: 3,
                    render: function (data, type, full, meta) {
                        return '<i class="bx bxs-circle text-success"></i>';
                    }
                },
                {
                    // Actions
                    targets: -1,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, full, meta) {
                        var btnProgramarReu = "<button onclick='(\"" + full['item_id'] + "\")' type='button' class='btn btn-icon btn-outline-success  me-2' data-bs-toggle='modal' data-bs-target='#mdlProgramarReunion'><i class='bx bxs-check-circle me-2'></i>Seleccionar</button>"

                        return (
                                '<div class="d-inline-block text-nowrap">' +
                                btnProgramarReu +
                                '</div>'
                                );
                    }
                }
            ],
            order: [[0, 'desc']],
            dom:'<"row mx-2"' +
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
            buttons: [
                {
                    extend: 'excel',
                    text: '<i class="bx bxs-file-export me-2"></i>Excel',
                    titleAttr: 'Exportar a Excel',
                    className: 'btn btn-success mx-3 rounded'
                },
                {
                    extend: 'print',
                    text: '<i class="bx bxs-printer me-2"></i>Imprimir',
                    titleAttr: 'Imprimir',
                    className: 'btn btn-info text-white rounded'
                }
            ],
            responsive: true
        });
    });

    function agregarReunionPresencial(){
        swal.fire({
            title: 'Reunion programada',
            text: 'La reunion ha sido programada exitosamente',
            icon: 'success',
            confirmButtonText: 'Aceptar'
        });
    }

    function agregarReunionRemota(){
        swal.fire({
            title: 'Reunion programada',
            text: 'La reunion ha sido programada exitosamente',
            icon: 'success',
            confirmButtonText: 'Aceptar'
        });
    }
</script>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>