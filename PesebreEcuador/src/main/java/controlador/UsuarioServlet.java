package controlador;

import dao.BitacoraDAO;
import dao.UsuarioDAO;
import modelo.Bitacora;
import modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    BitacoraDAO bitacoraDAO = new BitacoraDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        switch (accion) {
            case "Login":
                login(request, response);
                break;
            case "Registrar":
                registrar(request, response);
                break;
            case "Logout":
                logout(request, response);
                break;
            case "Listar": // Listar Usuarios
                listarUsuarios(request, response);
                break;
            case "VerBitacora": // Listar Bitácora
                listarBitacora(request, response);
                break;
            case "Bloquear":
                cambiarEstado(request, response, false);
                break;
            case "Activar":
                cambiarEstado(request, response, true);
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("txtEmail");
        String pass = request.getParameter("txtPass");
        
        Usuario user = usuarioDAO.validarLogin(email, pass);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", user);
            
            // Registro en bitácora
            bitacoraDAO.registrar(user.getId(), "Inicio de Sesión");

            // Redirección según rol
            if("admin".equals(user.getRol())){
                response.sendRedirect("UsuarioServlet?accion=Listar");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("error", "Credenciales incorrectas o usuario bloqueado");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombre = request.getParameter("txtNombre");
        String email = request.getParameter("txtEmail");
        String pass = request.getParameter("txtPass");

        // Validar longitud de contraseña
        if(pass.length() < 8){
            request.setAttribute("error", "La contraseña debe tener mínimo 8 caracteres");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        // Validar dominio del correo
        String regex = "^[A-Za-z0-9._%+-]+@(est\\.ups\\.edu\\.ec|ups\\.edu\\.ec)$";
        if(!email.matches(regex)){
            request.setAttribute("error", "El correo debe ser institucional: @est.ups.edu.ec o @ups.edu.ec");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        // Rol por defecto: estudiante
        Usuario u = new Usuario(nombre, email, pass, "estudiante");

        if(usuarioDAO.registrar(u)){
            request.setAttribute("mensaje", "Registro exitoso, por favor inicie sesión.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "El correo ya está registrado en el sistema.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
        if(u != null) {
            bitacoraDAO.registrar(u.getId(), "Cierre de Sesión");
        }
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

    // Métodos de Administrador
    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!esAdmin(request)) { response.sendRedirect("index.jsp"); return; }
        
        List<Usuario> lista = usuarioDAO.listarUsuarios();
        request.setAttribute("listaUsuarios", lista);
        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
    }
    
    private void listarBitacora(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!esAdmin(request)) { response.sendRedirect("index.jsp"); return; }
        
        List<Bitacora> lista = bitacoraDAO.listar();
        request.setAttribute("listaBitacora", lista);
        request.getRequestDispatcher("admin_bitacora.jsp").forward(request, response);
    }
    
    private void cambiarEstado(HttpServletRequest request, HttpServletResponse response, boolean estado) throws IOException {
        if(!esAdmin(request)) { response.sendRedirect("index.jsp"); return; }
        
        int id = Integer.parseInt(request.getParameter("id"));
        usuarioDAO.cambiarEstado(id, estado);
        
        // Registrar acción administrativa
        Usuario admin = (Usuario) request.getSession().getAttribute("usuarioLogueado");
        String accion = estado ? "Activó usuario ID: " + id : "Bloqueó usuario ID: " + id;
        bitacoraDAO.registrar(admin.getId(), accion);
        
        response.sendRedirect("UsuarioServlet?accion=Listar");
    }

    private boolean esAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
        return u != null && "admin".equals(u.getRol());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
