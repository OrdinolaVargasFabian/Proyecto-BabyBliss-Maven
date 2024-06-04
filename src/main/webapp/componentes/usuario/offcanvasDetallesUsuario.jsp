<div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="offcanvasMiPerfil" aria-labelledby="offcanvasLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasLabel">Mi Cuenta</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div>
            <div class="text-center">
                <%
                    out.print("<img src='../default.png' alt='' style='width: 80px' class='rounded-circle mb-3 " + marco_premium + "'>");
                    out.print("<h4>" + corona + nombre_completo + "</h4>");
                %>
                <hr>
            </div>
            <div class="px-3">    
            <%
                if (perfil_usuario == 2) {
                    Especialista especialista = (Especialista) session.getAttribute("user");
            %>
                <div class="row mb-3">
                    <label for="txtDni" class="form-label">DNI</label>
                    <input type="text" class="form-control" id="txtDni" value="<%=especialista.getDni()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="txtFechaNacimiento" value="<%=especialista.getFechaNac()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtCorreo" class="form-label">Correo</label>
                    <input type="email" class="form-control" id="txtCorreo" value="<%=especialista.getCorreo()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtTelefono" class="form-label">Teléfono</label>
                    <input type="text" class="form-control" id="txtTelefono" value="<%=especialista.getTelefono()%>" disabled>
                </div>
                <!--
                <div class="row mb-3">
                    <label for="txtEspecialidad" class="form-label">Especialidad</label>
                    <input type="text" class="form-control" id="txtEspecialidad" value="<%//=especialista.getEspecialidad()%>" disabled>
                </div>
                -->
                <%
                } else if (perfil_usuario == 1) {
                    Usuario usuario = (Usuario) session.getAttribute("user");
                %>
                <div class="row mb-3">
                    <label for="txtDni" class="form-label">DNI</label>
                    <input type="text" class="form-control" id="txtDni" value="<%=usuario.getDni()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="txtFechaNacimiento" value="<%=usuario.getFechaNac()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtCorreo" class="form-label">Correo</label>
                    <input type="email" class="form-control" id="txtCorreo" value="<%=usuario.getCorreo()%>" disabled>
                </div>
                <div class="row mb-3">
                    <label for="txtTelefono" class="form-label">Teléfono</label>
                    <input type="text" class="form-control" id="txtTelefono" value="<%=usuario.getTelefono()%>" disabled>
                </div>
            <%
                }
            %>
            </div>
        </div>
    </div>
</div>