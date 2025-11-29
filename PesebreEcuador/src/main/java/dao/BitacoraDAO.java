package dao;

import modelo.Bitacora;
import util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BitacoraDAO {

    // Registrar una acción en la bitácora
    public void registrar(int idUsuario, String accion) {
        String sql = "INSERT INTO bitacora (usuario_id, accion) VALUES (?, ?)";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setString(2, accion);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Listar toda la bitácora (JOIN con usuarios para ver nombres)
    public List<Bitacora> listar() {
        List<Bitacora> lista = new ArrayList<>();
        String sql = "SELECT b.id, b.usuario_id, u.nombre, b.accion, b.fecha " +
                     "FROM bitacora b " +
                     "JOIN usuarios u ON b.usuario_id = u.id " +
                     "ORDER BY b.fecha DESC";
        
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Bitacora b = new Bitacora();
                b.setId(rs.getInt("id"));
                b.setUsuarioId(rs.getInt("usuario_id"));
                b.setNombreUsuario(rs.getString("nombre"));
                b.setAccion(rs.getString("accion"));
                b.setFecha(rs.getTimestamp("fecha"));
                lista.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}