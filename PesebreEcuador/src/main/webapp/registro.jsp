<%@include file="includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow border-success">
                <div class="card-header bg-ups-green text-white text-center">
                    <h3>Registro de Usuario</h3>
                </div>
                <div class="card-body">
                    <% if(request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                    <% } %>

                    <form action="UsuarioServlet" method="POST" onsubmit="return validarFormulario()">
                        <div class="mb-3">
                            <label class="form-label">Nombre Completo:</label>
                            <input type="text" name="txtNombre" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Correo Institucional/Personal:</label>
                            <input type="email" name="txtEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña (Mínimo 8 caracteres):</label>
                            <input type="password" id="pass" name="txtPass" class="form-control" required>
                            <small class="text-danger" id="msgPass"></small>
                        </div>
                        <div class="d-grid gap-2">
                            <input type="submit" name="accion" value="Registrar" class="btn btn-outline-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function validarFormulario() {
        var pass = document.getElementById("pass").value;
        if (pass.length < 8) {
            document.getElementById("msgPass").innerText = "La contraseña debe tener al menos 8 caracteres.";
            return false;
        }
        return true;
    }
</script>

<%@include file="includes/footer.jsp" %>