import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Statement;
import java.util.Scanner;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class ReservationSystem {
	
	private final String username = "root";
	private final String password = "root";
	private final String servername = "localhost";
	private final int portnumber = 3306;
	private final String dbname = "Airlines";
	
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
		boolean loggedin = false;
		Scanner sc = new Scanner(System.in);
		
		while (!done) {
			System.out.println("Please enter which action to take: ");
			System.out.println("1: Quit");
			System.out.println("2: Create new account");
			System.out.println("3: Login");
			
			if (loggedin) {
				System.out.println("4: Check available flights");
				System.out.println("5: Reserve a flight");
			}
			else {
				
			}
			
			if (sc.hasNextInt()) {
				int choice = sc.nextInt();
					
				switch (choice) {
				
					case 1: 
						done = true;
						sc.close();
						break;
						
					case 2: 
						//All these must be checked if valid
						System.out.println("Please enter your first name: ");
						String fname = sc.next();
						System.out.println("Please enter your last name: ");
						String lname = sc.next();
						System.out.println("Please enter a password: ");
						String password = sc.next();
						System.out.println("Please enter your phone: ");
						String phone = sc.next();
						System.out.println("Please enter your email: ");
						String email = sc.next();
						System.out.println("Please enter your credit card: ");
						String cc = sc.next();
						
						//Inserts the values into Customer
						try {
							CallableStatement cstmt = conn.prepareCall("{call addUser(?, ?, ?, ?, ?, ?, ?)}");
						    
						    //Fix this to auto increment
						    cstmt.setInt(1, 1234);
						    
						    cstmt.setString(2, password);
						    cstmt.setString(3, fname);
						    cstmt.setString(4, phone);
						    cstmt.setString(5, email);
						    cstmt.setString(6, cc);
						    cstmt.setString(7, lname);
						    
						    //Before statement can be executed, must query DB to check if name already exists
						    
							cstmt.execute();
							System.out.println("Account successfully created");
							break;
					
					    } catch (SQLException e) {
							System.out.println("ERROR: Account could not be created");
							e.printStackTrace();
							break;
						}
							
					case 3:
						System.out.println("Please enter your first name: ");
						String fname2 = sc.next();
						System.out.println("Please enter your last name: ");
						String lname2 = sc.next();
						System.out.println("Please enter a password: ");
						String password2 = sc.next();
						
						//Temporary statement until a callable statement can be used from SQL file
						Statement stmt;
						try {
							stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT * FROM CUSTOMER WHERE firstname = '" + fname2 + "' AND lastname = '" + lname2 + "' AND password = '" + password2 +"'");
							
							if (rs.next()) {
								System.out.println("Logged in successfully, welcome " + fname2 + " " + lname2 + "!");
								loggedin = true;
								break;
							}
							else {
								System.out.println("Incorrect login credentials");
								break;
							}
						} catch (SQLException e) {
							System.out.println("ERROR: Could not login");
							e.printStackTrace();
							break;
						}
						
					case 4:
						try {
							System.out.println("Please enter your destination: ");
							String dest = sc.next();
							System.out.println("Please enter your departure location: ");
							String depart = sc.next();
							System.out.println("Please enter your departure date: ");
							String date = sc.next();
							
							CallableStatement cstmt = conn.prepareCall("{call searchAvailFlights(?, ?, ?)}");
						    
						    cstmt.setString(1, depart);
						    cstmt.setString(2, dest);
						    cstmt.setString(3, date);
							ResultSet rs = cstmt.executeQuery();
							ResultSetMetaData md = (ResultSetMetaData) rs.getMetaData();
							int colNum = md.getColumnCount();
							
							while (rs.next()) {
								for (int i = 1; i <= colNum; i++) {
									if (i > 1) System.out.print(", ");
									String val = rs.getString(i);
									System.out.print(md.getColumnName(i) + ": " + val);
								}
								System.out.println("");
							}

							break;
					
					    } catch (SQLException e) {
							System.out.println("ERROR: Available flights could not be viewed");
							e.printStackTrace();
							break;
						}
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