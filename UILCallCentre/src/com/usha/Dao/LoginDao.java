package com.usha.Dao;
import com.usha.Util.ConnectionUtil;
import java.sql.*;
public class LoginDao {
	
	
	public Boolean check(int empid, String pass){
		Boolean res = false ;				
		String query = "Select * from empcred where empid=? and pass=?";
		try {
			Connection con = ConnectionUtil.getConnection();			
			PreparedStatement pst = con.prepareStatement(query);			
			pst.setInt(1, empid);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if(rs.next() == false){
				res = false ;
			}else{
				res = true ;
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
	 return res ;
		
		
	}
	
	public String getName(int empid){
		String name = "Guest";
		String query = "Select * from agentdtl where empid=? ";
		try {
			Connection con = ConnectionUtil.getConnection();
			PreparedStatement pst = con.prepareStatement(query);			
			pst.setInt(1, empid);			
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				name = rs.getString("empName");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return name;
	}

}
