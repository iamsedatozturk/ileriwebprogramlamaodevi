package com.odev.application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = AppContext.getContextParam("dbUrl");
    private static final String USER = AppContext.getContextParam("dbUser");
    private static final String PASSWORD = AppContext.getContextParam("dbPassword");

    public static Connection connect() throws ClassNotFoundException {
        Connection connection = null;

        System.out.print("URL:"  + URL);
        
    	try {	
        	Class.forName("org.postgresql.Driver");

        	connection = DriverManager.getConnection(URL, USER, PASSWORD);
            //System.out.println("Veritabanına başarıyla bağlanıldı.");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Sürücüsü bulunamadı: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Veritabanına bağlanırken hata oluştu: " + e.getMessage());
        }
        return connection;
    }
}
