<div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="offcanvasAgregarGuia" aria-labelledby="offcanvasLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasLabel">Redactar Guia</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <form action="" method="post" onsubmit="return false">
                    <div class="mb-3">
                        <label for="inputNombre" class="form-label">Nombre de la guia</label>
                        <input type="text" class="form-control" id="inputNombre" name="nombreGuia">
                    </div>
                    <div class="mb-3">
                        <label for="inputDescripcion" class="form-label">Descripcion de la guia</label>
                        <textarea class="form-control" id="inputDescripcion" name="descripcionGuia" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="inputArchivo" class="form-label">Archivo de la guia</label>
                        <input type="file" class="form-control" id="inputArchivo" name="archivoGuia">
                    </div>
                    <button class="btn btn-primary">Agregar Guia</button>
                </form>
  </div>
</div>