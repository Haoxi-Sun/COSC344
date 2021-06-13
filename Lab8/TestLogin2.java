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

public class TestLogin2 {


    public static void main (String[] args) {
	new TestLogin2().go();
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

            // Get a Statment and execute the appropriate SELECT
            // WHERE mgrssn is // '888665555'
            Statement stmt = con.createStatement();
            String command = "SELECT dname, dnumber, mgrssn, mgrstartdate FROM department " +
                             "WHERE mgrssn = '888665555'";
            ResultSet result = stmt.executeQuery(command);
            // Get the ResultSet metadata and determine the number of columns
            ResultSetMetaData metadata= result.getMetaData();
            int columns = metadata.getColumnCount();
            System.out.println("\nDNAME        DNUMBER          MGRSSN        MRRSTARTDATA");
            System.out.println("----------------------------------------------------------");
            while (result.next()){
                for (int i = 1; i<= columns; i++){
                    System.out.print(result.getString(i) +
                                     spaces(15-result.getString(i).length()));
                }
                System.out.println();
            }
           
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

    private String spaces (int number){
        StringBuffer buf = new StringBuffer();
        for(int i=0; i<number; i++){
            buf.append(' ');
        }
        return buf.toString();
    }

} // end class TestLogin


