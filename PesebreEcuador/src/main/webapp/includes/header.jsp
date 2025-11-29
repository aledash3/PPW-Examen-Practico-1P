<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pesebre Ecuador - UPS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="css/estilos.css" rel="stylesheet">
    <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.1.1/model-viewer.min.js"></script>
</head>
<body>
    <!-- Topbar según prototipo -->
    <div class="container-fluid topbar">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <img src="<%= request.getContextPath() %>/img/ups.png" alt="Logo UPS" class="img-fluid me-3" style="max-height: 40px;">
                <span class="logo-text">EL PCB R</span>
            </div>
            
            <nav>
                <a href="index.jsp" class="mx-2 nav-link d-inline-block">HOME</a> |
                <a href="historia.jsp" class="mx-2 nav-link d-inline-block">HISTORIA</a> |
                <a href="personajes.jsp" class="mx-2 nav-link d-inline-block">PERSONAJES</a> |
                <a href="villancicos.jsp" class="mx-2 nav-link d-inline-block">VILLANCICOS</a> |
                <a href="contacto.jsp" class="mx-2 nav-link d-inline-block">CONTACTO</a>
            </nav>

            <div>
                <% if(usuario != null) { %>
                    <span class="me-2">Hola, <%= usuario.getNombre() %></span>
                    <% if("admin".equals(usuario.getRol())) { %>
                         <a href="UsuarioServlet?accion=Listar" class="btn btn-sm btn-outline-light me-1">Admin</a>
                    <% } %>
                    <a href="UsuarioServlet?accion=Logout" class="btn btn-sm btn-danger">Salir</a>
                <% } else { %>
                    <a href="login.jsp" class="btn btn-sm btn-outline-light">Login / Registro</a>
                <% } %>
            </div>
        </div>
    </div>