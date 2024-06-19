<%@ include file="header.jsp" %> 
<link href="../CSS/pagoTarjeta.css" rel="stylesheet" type="text/css"/>
<html>
<body>
	<div class="contenedor">     
		<!-- Tarjeta -->
		<section class="tarjeta" id="tarjeta">
			<div class="delantera">
				<div class="logo-marca" id="logo-marca">
					<img src="../IMG/visa.png" alt="">
                                        
				</div>
				<img src="../IMG/chip-tarjeta.png" class="chip" alt="">
				<div class="datos">
					<div class="grupo" id="numero">
						<p class="label">Número Tarjeta</p>
						<p class="numero">#### #### #### ####</p>
					</div>
					<div class="flexbox">
						<div class="grupo" id="nombre">
							<p class="label">Nombre Tarjeta</p>
							<p class="nombre"></p>
						</div>

						<div class="grupo" id="expiracion">
							<p class="label">Expiracion</p>
							<p class="expiracion"><span class="mes">MM</span> / <span class="year">AA</span></p>
						</div>
					</div>
				</div>
			</div>

			<div class="trasera">
				<div class="barra-magnetica"></div>
				<div class="datos">

					<div class="grupo" id="ccv">
						<p class="label">CCV</p>
						<p class="ccv"></p>
					</div>
				</div>
				<p class="leyenda">_________________________________________________</p>	
                                <br></br>                               
			</div>
		</section>

		<!-- Contenedor Boton Abrir Formulario -->
		<div class="contenedor-btn">
			<button class="btn-abrir-formulario" id="btn-abrir-formulario">
				<i class='bx bx-plus' ></i>
			</button>
		</div>

		<!-- Formulario -->
		<form id="formulario-tarjeta" class="formulario-tarjeta" method="post">
			<div class="grupo">
				<label for="inputNumero">Número Tarjeta</label>
				<input type="text" id="inputNumero" maxlength="19" autocomplete="off">
			</div>
			<div class="grupo">
				<label for="inputNombre">Nombre</label>
				<input type="text" id="inputNombre" maxlength="19" autocomplete="off" required>
			</div>
			<div class="flexbox">
				<div class="grupo expira">
					<label for="selectMes">Expiracion</label>
					<div class="flexbox">
						<div class="grupo-select">
							<select name="mes" id="selectMes">
								<option disabled selected>Mes</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
						<div class="grupo-select">
							<select name="year" id="selectYear">
								<option disabled selected>Año</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
					</div>
				</div>

				<div class="grupo ccv">
					<label for="inputCCV">CCV</label>
					<input type="text" id="inputCCV" maxlength="3" required>
				</div>
			</div>	
                        <input type="submit" class="btn-enviar" onclick="adquirirMembresia()">
		</form>  
	</div>
      <!-- Revisar -->
        <script>
            function adquirirMembresia() {
                var id = $('#idUsuario').val();
                $.ajax({
                    type: "POST",
                    url: "../srvPagarMembresia?id=" + id,
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
                        swal.fire({
                            title: '¡Felicidades!',
                            text: 'Tu pago ha sido completado, disfruta tu membresia adquiridad',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.value) {
                                window.location.href = "index.jsp";
                            }
                        });
                    }
                });
            }
        </script>
    <script src="../JS/Tarjeta.js" type="text/javascript"></script>
</body>
</html>
<%@ include file="footer.jsp" %> <!-- Incorpora el código del archivo footer -->