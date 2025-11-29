<%@page import="java.util.List"%>
<%@page import="modelo.Bitacora"%>
<%@page import="modelo.Usuario"%>
<%@include file="includes/header.jsp" %>

<%
    // Seguridad
    Usuario uLog = (Usuario) session.getAttribute("usuarioLogueado");
    if(uLog == null || !"admin".equals(uLog.getRol())){
        response.sendRedirect("index.jsp");
        return;
    }
    
    List<Bitacora> lista = (List<Bitacora>) request.getAttribute("listaBitacora");
%>

<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-ups-green"><i class="fas fa-clipboard-list"></i> Bitácora de Actividades</h2>
        <div>
            <a href="UsuarioServlet?accion=Listar" class="btn btn-outline-secondary me-2">Volver a Usuarios</a>
            <span class="badge bg-secondary">Admin: <%= uLog.getNombre() %></span>
        </div>
    </div>

    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0">Registro de Eventos del Sistema</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover text-center">
                    <thead class="table-light">
                        <tr>
                            <th>ID Evento</th>
                            <th>Usuario</th>
                            <th>Acción Realizada</th>
                            <th>Fecha y Hora</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(lista != null && !lista.isEmpty()) { 
                            for(Bitacora b : lista) { %>
                            <tr>
                                <td><%= b.getId() %></td>
                                <td class="fw-bold"><%= b.getNombreUsuario() %> (ID: <%= b.getUsuarioId() %>)</td>
                                <td><%= b.getAccion() %></td>
                                <td><%= b.getFecha() %></td>
                            </tr>
                        <%  } 
                           } else { %>
                            <tr>
                                <td colspan="4" class="text-muted">No hay registros de actividad.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>