<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@include file="includes/header.jsp" %>

<%
    // =================================================================
    // 1. CHEQUEO DE SEGURIDAD
    // Asegura que solo los usuarios con rol 'admin' puedan acceder.
    // =================================================================
    Usuario uLog = (Usuario) session.getAttribute("usuarioLogueado");
    if(uLog == null || !"admin".equals(uLog.getRol())){
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Obtener la lista de usuarios enviada desde UsuarioServlet?accion=Listar
    List<Usuario> lista = (List<Usuario>) request.getAttribute("listaUsuarios");
%>

<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- Título principal -->
        <h2 class="text-ups-green"><i class="fas fa-cogs"></i> Panel de Administración</h2>
        <div>
            <!-- BOTÓN para ver la Bitácora (Requerimiento 2.2) -->
            <a href="UsuarioServlet?accion=VerBitacora" class="btn btn-warning me-2 fw-bold shadow-sm">
                <i class="fas fa-history"></i> Ver Bitácora
            </a>
            <!-- Indicador del usuario logueado -->
            <span class="badge bg-ups-blue">Bienvenido Administrador: <%= uLog.getNombre() %></span>
        </div>
    </div>

    <!-- Tarjeta principal para la gestión de usuarios -->
    <div class="card shadow">
        <div class="card-header bg-ups-blue text-white">
            <h5 class="mb-0"><i class="fas fa-users"></i> Gestión de Usuarios del PesebreEcuador</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered mb-0 text-center">
                    <thead class="bg-ups-light-green text-white">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Rol</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(lista != null && !lista.isEmpty()) { 
                            for(Usuario u : lista) { %>
                            <tr>
                                <td><%= u.getId() %></td>
                                <td class="text-start"><%= u.getNombre() %></td>
                                <td class="text-start"><%= u.getEmail() %></td>
                                <td>
                                    <!-- Muestra el rol con un badge -->
                                    <span class="badge <%= "admin".equals(u.getRol()) ? "bg-dark" : "bg-info text-dark" %>">
                                        <%= u.getRol().toUpperCase() %>
                                    </span>
                                </td>
                                <td>
                                    <!-- Muestra el estado con colores -->
                                    <% if(u.isActivo()) { %>
                                        <span class="badge bg-success">Activo</span>
                                    <% } else { %>
                                        <span class="badge bg-danger">Bloqueado</span>
                                    <% } %>
                                </td>
                                <td>
                                    <!-- Las acciones no se aplican al propio administrador (Regla de negocio) -->
                                    <% if(!"admin".equals(u.getRol())) { %>
                                        <% if(u.isActivo()) { %>
                                            <!-- Botón para Bloquear -->
                                            <a href="UsuarioServlet?accion=Bloquear&id=<%= u.getId() %>" class="btn btn-sm btn-outline-danger" title="Bloquear Acceso al Sitio">
                                                <i class="fas fa-ban"></i> Bloquear
                                            </a>
                                        <% } else { %>
                                            <!-- Botón para Activar -->
                                            <a href="UsuarioServlet?accion=Activar&id=<%= u.getId() %>" class="btn btn-sm btn-outline-success" title="Reactivar Acceso al Sitio">
                                                <i class="fas fa-check-circle"></i> Activar
                                            </a>
                                        <% } %>
                                    <% } else { %>
                                        <span class="text-muted">N/A</span>
                                    <% } %>
                                </td>
                            </tr>
                        <%  } 
                           } else { %>
                            <tr>
                                <td colspan="6" class="text-center py-4">
                                    <i class="fas fa-exclamation-circle text-warning"></i> No se encontraron usuarios registrados, excepto el administrador.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>