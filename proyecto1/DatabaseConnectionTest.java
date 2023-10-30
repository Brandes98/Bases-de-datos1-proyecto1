/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author David
 */
public class DatabaseConnectionTest {
    public static void main(String[] args) {
        String url = "jdbc:oracle:thin:@localhost:1521:DBDAVID";
        String username = "ge";
        String password = "ge";

        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection successful.");
            connection.close();
        } catch (SQLException e) {
            System.err.println("Connection failed. Error: " + e.getMessage());
        }
    }
}
