package com.chengwen.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Util {
	static ComboPooledDataSource cpds=null;
	
	static {
		System.out.println("--------------->CHENGWEN  C3p0Util static");
		cpds = new ComboPooledDataSource("mysql");//这是mysql数据库 
	}
	
	public static Connection getConnection(){
        try {  
            return cpds.getConnection();  
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;  
        }
    } 
	
	public static int getNumBusyConnections() {
		try {
			return cpds.getNumBusyConnections();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
	public static void close(Connection conn,PreparedStatement pst) {
		if(pst!=null){  
            try {  
                pst.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
  
        if(conn!=null){  
            try {  
                conn.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
	}
	
	public static void close(Connection conn,PreparedStatement pst,ResultSet rs) {  
        if(rs!=null){  
            try {  
                rs.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
        if(pst!=null){  
            try {  
                pst.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
  
        if(conn!=null){  
            try {  
                conn.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
    } 
	
}
