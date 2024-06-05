<%@ include file="header.jsp" %> <!-- Incorpora el código del archivo header -->
<div class="row">
    <div class="col container bg-white shadow rounded m-4 p-3">

    </div>
    <div class="col container bg-white shadow rounded m-4 p-3">
        <div class="row p-4">
            <select class="form-select" aria-label="Seleccionar Metodo de Pago">
                <option selected>[Seleccione un metodo de pago]</option>
                <option value="1">Tarjeta de cr�dito / d�bito</option>
                <option value="2">Yape</option>
                <option value="3">Plin</option>
                <option value="4">Transferencia bancaria</option>
            </select>
        </div>
        <div class="row p-4" id="formPagoBox"></div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var id = $('#idUsuario').val();
        $('.form-select').change(function () {
            var selected = $(this).children("option:selected").val();
            if (selected == 1) {
                $('#formPagoBox').empty();
                $('#formPagoBox').append('<div class="col p-3 container bg-white shadow rounded"><form method="post"><div class="mb-3"><label for="tarjeta" class="form-label">Número de tarjeta</label><input type="text" class="form-control" id="tarjeta" name="tarjeta"></div><div class="mb-3"><label for="propietario" class="form-label">Propietario de la tarjeta</label><input type="text" class="form-control" id="propietario" name="propietario"></div><div class="mb-3"><label for="cvv" class="form-label">CVV</label><input type="text" class="form-control" id="cvv" name="cvv"></div><div class="mb-3"><label for="fecha" class="form-label">Fecha de vencimiento</label><input type="text" class="form-control" id="fecha" name="fecha"></div><button onclick="adquirirMembresia()" class="btn btn-primary">Pagar</button></form></div>');
            } else if (selected == 2) {
                $('#formPagoBox').empty();
                $('#formPagoBox').append('<img src="../IMG/PagoYape.png" alt="Yape" class="img-fluid text-center" style="max-width: 500px;"><p>Envía el monto a la cuenta Yape</p><button onclick="adquirirMembresia()" class="btn btn-primary">Pagar</button>')
            } else if (selected == 3) {
                $('#formPagoBox').empty();
                $('#formPagoBox').append('<img src="../IMG/PagoPlin.png" alt="Plin" class="img-fluid text-center" style="max-width: 500px;"><p>Envía el monto a la cuenta Plin</p><button onclick="adquirirMembresia()" class="btn btn-primary">Pagar</button>')
            } else if (selected == 4) {
                 $('#formPagoBox').empty();
                $('#formPagoBox').append('<div class="col p-3 container bg-white shadow rounded"><form method="post"><div class="mb-3"><label for="cc" class="form-label">CC</label><input type="text" class="form-control" id="cc" name="cc"></div><div class="mb-3"><label for="cci" class="form-label">CCI</label><input type="text" class="form-control" id="cci" name="cci"></div><button onclick="adquirirMembresia()" class="btn btn-primary">Pagar</button></form></div>');
            }
        });
    });

    function adquirirMembresia() {
        var id = $('#idUsuario').val();
        $.ajax({
            type: "POST",
            url: "../srvPagarMembresia?id="+id,
            beforeSend: function () {
                swal.fire({
                    title: 'ESPERA',
                    html: 'Procesando...',
                    didOpen: () => {
                        swal.showLoading()
                    }
                })
            },
            success: function (data, textStatus, jqXHR) {
                
            }
        });
    }
</script>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->