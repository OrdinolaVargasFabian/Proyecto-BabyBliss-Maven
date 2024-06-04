<div class="modal fade modal-lg" id="mdlProgramarReunion" tabindex="-1" aria-labelledby="mdlProgramarReunion" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Elige la modalidad</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container bg-white rounded shadow p-5">
                    <ul class="nav nav-pills mb-3" id="pills-tab-reunion" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-RPresencial-tab" data-bs-toggle="pill" data-bs-target="#pills-RPresencial" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Reunión Presencial</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-RRemota-tab" data-bs-toggle="pill" data-bs-target="#pills-RRemota" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Reunión Remota</button>
                        </li>
                    </ul>
                    <hr>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-RPresencial" role="tabpanel" aria-labelledby="pills-RPresencial-tab" tabindex="0">
                            <form action="" method="post" onsubmit="return false">
                                <div class="mb-3">
                                    <label for="inputNombre" class="form-label">Nombre de la reunión</label>
                                    <input type="text" class="form-control" id="inputNombre" name="nombreReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputFecha" class="form-label">Fecha de la reunión</label>
                                    <input type="date" class="form-control" id="inputFecha" name="fechaReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputHora" class="form-label">Hora de la reunion</label>
                                    <input type="time" class="form-control" id="inputHora" name="horaReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputLugar" class="form-label">Lugar de la reunión</label>
                                    <select class="form-select" id="inputLugar" name="lugarReunion">
                                        <option selected>Selecciona un lugar</option>
                                        <option value="1">Clinica 1</option>
                                        <option value="2">Clinica 2</option>
                                        <option value="3">Clinica 3</option>
                                        <option value="4">Otro</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="inputTema" class="form-label">Tema de la reunión</label>
                                    <textarea class="form-control" id="inputTema" name="temaReunion" rows="3"></textarea>
                                </div>
                                <button onclick="agregarReunionPresencial()" class="btn btn-primary">Programar Reunión</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="pills-RRemota" role="tabpanel" aria-labelledby="pills-RRemota-tab" tabindex="0">
                            <form action="" method="post" onsubmit="return false">
                                <div class="mb-3">
                                    <label for="inputNombre" class="form-label">Nombre de la reunión</label>
                                    <input type="text" class="form-control" id="inputNombre" name="nombreReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputFecha" class="form-label">Fecha de la reunión</label>
                                    <input type="date" class="form-control" id="inputFecha" name="fechaReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputHora" class="form-label">Hora de la reunión</label>
                                    <input type="time" class="form-control" id="inputHora" name="horaReunion">
                                </div>
                                <div class="mb-3">
                                    <label for="inputTema" class="form-label">Tema de la reunión</label>
                                    <textarea class="form-control" id="inputTema" name="temaReunion" rows="3"></textarea>
                                </div>
                                <p class="text-danger">La reuni&oacuten remota se llevar&aacute a cabo mediante la plataforma de videollamadas ZOOM, se le otorgar&aacute el link de invitación después de concluir la programación.</p>
                                <button onclick="agregarReunionRemota()" class="btn btn-primary">Programar Reunión</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>