import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Statement;
import java.util.Scanner;

public class ReservationSystem {
	
	private final String username = "root";
	private final String password = "root";
	private final String servername = "localhost";
	private final int portnumber = 3306;
	private final String dbname = "Airline";
	
	/**
	 * Get a new database connection
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		Properties connectionProps = new Properties();
		connectionProps.put("user", this.username);
		connectionProps.put("password", this.password);

		conn = DriverManager.getConnection("jdbc:mysql://"
				+ this.servername + ":" + this.portnumber + "/" + this.dbname,
				connectionProps);
		
		return conn;
	}
	
	/**
	 * Run a SQL command which does not return a recordset:
	 * CREATE/INSERT/UPDATE/DELETE/DROP/etc.
	 * 
	 * @throws SQLException If something goes wrong
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

	public void run() {
		
		// Connect to MySQL
		Connection conn = null;
		try {
			conn = this.getConnection();
			System.out.println("Connected to Airline Reservation System");
		} catch (SQLException e) {
			System.out.println("ERROR: Could not connect to Airline Reservation System");
			e.printStackTrace();
			return;
		}
		
		boolean done = false;
		Scanner sc = new Scanner(System.in);
		
		while (!done) {
			System.out.println("Please enter which action to take: ");
			System.out.println("1: Create new account");
			System.out.println("2: Login");
			System.out.println("3: Quit");
			
				if (sc.hasNextInt()) {
					int choice = sc.nextInt();
					
					switch (choice) {
						case 1: 
							//All these must be checked if valid
							System.out.println("Please enter your first and last name: ");
							String name = sc.next();
							System.out.println("Please enter a password: ");
							String password = sc.next();
							System.out.println("Please enter your phone: ");
							String phone = sc.next();
							System.out.println("Please enter your email: ");
							String email = sc.next();
							System.out.println("Please enter your credit card: ");
							String cc = sc.next();
							
							//This creates a Customer table, not needed in app but used to check if working
							try {
							    String createString =
								        "CREATE TABLE Customer ( " +
								        "CUSTOM_ID INTEGER NOT NULL, " +
								        "PASSWORD varchar(30) NOT NULL, " +
								        "NAME varchar(30) NOT NULL, " +
								        "PHONE varchar(30) NOT NULL, " +
								        "EMAIL varchar(30) NOT NULL, " +
								        "CC varchar(30), " +
								        "PRIMARY KEY (CUSTOM_ID))";
								this.executeUpdate(conn, createString);
								System.out.println("Created a table");
						    } catch (SQLException e) {
								System.out.println("ERROR: Could not create the table");
								e.printStackTrace();
								return;
							}
							
							//Inserts the values into Customer
							try {
							    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Customer (custom_id, password, name, phone, email, cc) VALUE"
							    		+ " (?, ?, ?, ?, ?, ?)");
							    
							    //Fix this to auto increment
							    pstmt.setInt(1, 1000);
							    
							    pstmt.setString(2, password);
							    pstmt.setString(3, name);
							    pstmt.setString(4, phone);
							    pstmt.setString(5, email);
							    pstmt.setString(6, cc);
								pstmt.executeUpdate();
								System.out.println("Inserted into Customer");
						    } catch (SQLException e) {
								System.out.println("ERROR: Could not insert into Customer");
								e.printStackTrace();
								return;
							}
							
							System.out.println("Account created.");
							
						case 2:
							
							//Implement
							sc.next();
							
						case 3: 
							done = true;
							sc.close();
					}
				}
				else {
					System.out.println("Invalid choice. Please enter a valid number.");
					sc.next();
				}
		}
	}
	
	public static void main(String[] args) {
		ReservationSystem rs = new ReservationSystem();
		rs.run();
	}
}