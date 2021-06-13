import java.io.*;
import java.util.*;
import java.sql.*;

public class StoredEm implements Comparable<StoredEm>{
    String fname = null;
    String lname = null;
    int salary = 0;

    public StoredEm(String fname, String lname, int salary){
        this.fname = fname;
        this.lname = lname;
        this.salary = salary;
    }

    public int compareTo(StoredEm data){
        if(this.salary > data.salary) return 1;
        if(this.salary < data.salary) return -1;
        return 0;
    }

    public String toString(){
        return fname+"   "+lname+"   "+salary;
    }
}
