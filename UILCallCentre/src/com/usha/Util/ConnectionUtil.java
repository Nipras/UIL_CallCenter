package com.usha.Util;
import java.sql.*;

public class ConnectionUtil {
/*	
public static Connection getConnection(){
	
	Connection con = null;
	try {
		Class.forName("java.sql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uil_callcenter","root","root@1234A");
		System.out.println("getConn->"+con);
	} catch (Exception e) {
		System.out.println(e);
	}
	return con;
}
}*/

public static Connection getConnection()
{
    Connection con = null;
    try
    {       
    	Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uil_callcenter", "root", "password");
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }   
    return con;
}
}