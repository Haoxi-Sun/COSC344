/*
  File: TestLogin.java
  August 2002
*/

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

public class Employee {
    
    public static void main (String[] args) {
	new Employee().go();
    }

    // This is the function that does all the work
    private void go() {
	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver.otago.ac.nz";

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

            Statement stmt = con.createStatement();
            String command = "SELECT fname, lname, salary FROM employee";
            System.out.println("command: "+ command);
            ResultSet  result = stmt.executeQuery(command);

            ArrayList<StoredEm> employees = new ArrayList<StoredEm>();
            while(result.next()){
                StoredEm oneEmployee = new StoredEm(result.getString("fname"), result.getString("lname"),
                                                    result.getInt("salary"));
 
                employees.add(oneEmployee);
            }
            // Store objects with their salary
            Collections.sort(employees);
            
            System.out.println("\nFNAME    LNAME    SALARY");
            System.out.println("--------------------------");
            for(StoredEm one : employees){
                System.out.println(one.toString());
            }
            System.out.println();
	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);
	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }
} // end class TestLogin


