package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectaBD {
    public String usuario = "root";
    public String senha = "admin";

    public Connection Conectar() throws Exception {
        // Class.forName("com.mysql.jdbc.Driver");
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/empregos";
        java.sql.Connection conn = DriverManager.getConnection(url, usuario, senha);
        return conn;
    }

}
