package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:postgresql://localhost:5432/pesebre_db";
    private static final String USER = "postgres"; 
    private static final String PASS = "postgres"; // CAMBIAR ESTO
    
    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conexión exitosa a PostgreSQL");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
        }
        return con;
    }
}