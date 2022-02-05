package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectaBD{ 
	public String usuario = "root";
    public String senha = "admin";

    public Connection Conectar() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/empregos";
        java.sql.Connection conn = DriverManager.getConnection(url, usuario, senha);
        return conn;
    }
	
	/*
    	public String usuario = "root";
		public String senha = "admin";
		public Connection Conectar() throws Exception {
		
    	Connection connection = null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    	} catch (ClassNotFoundException e) {
    		System.out.println("Driver não encontrado. " +e);
    	}
    	
    	try {
    		String url = "jdbc:mysql://localhost/empregos";
    		String usuario = "root";
    	    String senha = "admin";
    	    
    	    connection = DriverManager.getConnection(url, usuario, senha);
    	} catch (Exception e) {
    		System.out.println("Driver não encontrado. " +e);
    	}
        return connection;
    }*/
}
