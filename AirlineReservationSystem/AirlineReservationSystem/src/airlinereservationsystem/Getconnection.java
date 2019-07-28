/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airlinereservationsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.swing.JOptionPane;

/**
 *
 * @author jing
 */
public class Getconnection {
    
    private final String username = "root";
    private final String password = "";
    private final String servername = "localhost";
    private final int portnumber = 3306;
    private final String dbname = "AIRLINES";
    
    
    /**
     * Get connection
     */
    public Connection getConnection() throws SQLException {
        Connection conn = null;
        Properties connectionProps = new Properties();
        connectionProps.put("user", this.username);
        connectionProps.put("password", this.password);


        conn = DriverManager.getConnection("jdbc:mysql://"
                        + this.servername + ":" + this.portnumber + "/" + this.dbname + "?serverTimezone=PST",
                        connectionProps);
//                            + this.servername + ":" + this.portnumber + "/" + this.dbname,
//                            connectionProps);

        return conn;
    }
    
    /**
     * Execute update
     */
    public boolean executeUpdate(Connection conn, String command) throws SQLException {
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            stmt.executeUpdate(command); // This will throw a SQLException if it fails
            return true;
        } finally {

            // This will run whether we throw an exception or not
            if (stmt != null) { stmt.close(); }
        }
    }
    
//    public static void main(String[] args){
//        Connection conn = null;
//        
//    }
 
}
