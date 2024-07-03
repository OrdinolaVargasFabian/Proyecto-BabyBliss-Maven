<%@ include file="header.jsp" %> <!-- Incorpora el código del archivo header -->
<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-revisarPublicaciones" class="table table-striped m-3"></table>
</div>
<script>
    $(document).ready(function () {
        $('#datatable-revisarPublicaciones').DataTable({
            "ajax": "../srvControladorComunidad?accion=listar",
            "columns": [
                { "data": "idForo" },
                { "data": "titulo" },
                { "data": "contenido" }
            ],
            columnDefs: [
                {
                    // Actions
                    targets: -1,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, full, meta) {
                        var btnEliminar = "<button onclick='(\"" + full['item_id'] + "\")' type='button' class='btn btn-icon btn-outline-danger  me-2'><i class='tf-icons bx bxs-trash'></i></button>"
                        var btnAceptar = "<button onclick='(\"" + full['item_id'] + "\")' type='button' class='btn btn-icon btn-outline-success  me-2'><i class='bx bxs-check-circle'></i></button>"

                        return (
                                '<div class="d-inline-block text-nowrap">' +
                                btnAceptar +
                                btnEliminar +
                                '</div>'
                                );
                    }
                }
            ],
            order: [[0, 'desc']],
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
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->