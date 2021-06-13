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

public class TestLogin3 {


    public static void main (String[] args) {
        new TestLogin3().go();
    }

    // This is the function that does all the work
    private void go(){

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
            
            // Get a Statement and execute the SELECT and
            // SET to give each employee a 10% pay raise
            Statement stmt = con.createStatement();
            String command = "UPDATE employee " + "SET salary = "+ "salary*1.1";
            System.out.println("command: "+command);
            int rowsUpdated = stmt.executeUpdate(command);
            System.out.println(rowsUpdated + " rows" +
                               (rowsUpdated == 1 ? "" :"s")
                               + "updated.");
            if (1 == rowsUpdated) con.commit();

            String select = "SELECT * FROM employee";
            ResultSet result = stmt.executeQuery(select);
            // Get the ResultSet metadata and determine the number of columns
            ResultSetMetaData metadata= result.getMetaData();
            int columns = metadata.getColumnCount();
            System.out.println("\n  FNAME       MINIT       LNAME       SSN          BDATE                 ADDRESS" +
                               "                SEX       SALARY       SUPERSSN       DNO");
            System.out.println("----------------------------------------------------------------------------------------------------------------------------------------");
            while (result.next()){
                for(int i =1 ;i<=columns ; i++){
                    try{
                    System.out.print(spaces(2) + result.getString(i)+ 
                                     spaces(10-result.getString(i).length()));
              
                }catch(NullPointerException e){
                    System.out.print("   NULL       ");
                }
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

    private String spaces (int number) {
        StringBuffer buf = new StringBuffer();
        for(int i = 0; i < number; i++){
            buf.append(' ');
        }
        return buf.toString();
    }

} // end class TestLogin


