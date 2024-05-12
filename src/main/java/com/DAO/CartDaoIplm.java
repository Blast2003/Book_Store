package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.Cart;


public class CartDaoIplm implements CartDAO{
	
	private Connection con;

	public CartDaoIplm(Connection con) {
		this.con = con;
	}


	@Override
	public boolean addCart(Cart c) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into cart(bid, uid, bookName, author, price, total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}


	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<>();
		Cart c = null;
		double totalPrice = 0;
		try {
			
			String sql="select * from cart where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice+= rs.getDouble(7); // total += price
				c.setTotalPrice(totalPrice);
				
				
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean deteleBook(int bid, int uid, int cid) {
		boolean f = false;
		
		try {
			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			
			int i= ps.executeUpdate();
			if(i==1) f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

}
