package com.odev;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://dpg-ct4cdttds78s73bhu7s0-a.frankfurt-postgres.render.com:5432/odev1";
    private static final String USER = "sa";
    private static final String PASSWORD = "qNgqTkPT8lnyPhO92vofBAiaQcHZpAsk";

    public static Connection connect() throws ClassNotFoundException {
        Connection connection = null;

    	try {	
        	Class.forName("org.postgresql.Driver");

        	connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Veritabanına başarıyla bağlanıldı.");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Sürücüsü bulunamadı: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Veritabanına bağlanırken hata oluştu: " + e.getMessage());
        }
        return connection;
    }
}
