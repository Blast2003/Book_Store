package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection con;
	private static String URL = "jdbc:mysql://localhost:3306/ebook-app?useSSL=false";
	private static  String username = "root";
	private static String password = "1234";
	public static Connection getCon() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, username, password);
			
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
