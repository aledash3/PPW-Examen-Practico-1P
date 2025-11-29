<%@include file="includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-ups-blue text-white text-center">
                    <h3>Iniciar Sesión</h3>
                </div>
                <div class="card-body">
                    <!-- Mensajes de Error -->
                    <% if(request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    <% if(request.getAttribute("mensaje") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("mensaje") %>
                        </div>
                    <% } %>

                    <form action="UsuarioServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Correo Electrónico:</label>
                            <input type="email" name="txtEmail" class="form-control" required placeholder="ejemplo@ups.edu.ec">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña:</label>
                            <input type="password" name="txtPass" class="form-control" required>
                        </div>
                        <div class="d-grid gap-2">
                            <input type="submit" name="accion" value="Login" class="btn btn-success">
                        </div>
                    </form>
                    <hr>
                    <div class="text-center">
                        <p>¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>