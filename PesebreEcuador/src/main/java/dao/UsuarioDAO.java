package dao;
import modelo.Usuario;
import util.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public Usuario validarLogin(String email, String password) {
        Usuario usu = null;
        String sql = "SELECT * FROM usuarios WHERE email=? AND password=? AND activo=TRUE";
        
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usu = new Usuario();
                    usu.setId(rs.getInt("id"));
                    usu.setNombre(rs.getString("nombre"));
                    usu.setEmail(rs.getString("email"));
                    usu.setRol(rs.getString("rol"));
                    usu.setActivo(rs.getBoolean("activo"));
                    registrarBitacora(usu.getId(), "Login Exitoso");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usu;
    }

    public boolean registrar(Usuario usu) {
        String sql = "INSERT INTO usuarios (nombre, email, password, rol, activo) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usu.getNombre());
            ps.setString(2, usu.getEmail());
            ps.setString(3, usu.getPassword());
            ps.setString(4, usu.getRol());
            ps.setBoolean(5, true);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Método para Admin: Listar usuarios
    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios ORDER BY id";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setRol(rs.getString("rol"));
                u.setActivo(rs.getBoolean("activo"));
                lista.add(u);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // Método para Admin: Bloquear usuario
    public void cambiarEstado(int id, boolean estado) {
        String sql = "UPDATE usuarios SET activo=? WHERE id=?";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setBoolean(1, estado);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    private void registrarBitacora(int idUsuario, String accion) {
        String sql = "INSERT INTO bitacora (usuario_id, accion) VALUES (?, ?)";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setString(2, accion);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}