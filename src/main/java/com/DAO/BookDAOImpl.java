package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="insert into book_dtls(bookname, author, price, bookCategory,status, photo, user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
	
			int i = ps.executeUpdate();		
			
			if(i ==1) {
				f = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}



	@Override
	public List<BookDtls> getAllBooks() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		try {
			String sql = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return b;
	}
	@Override
	public boolean updateEditBook(BookDtls b) {
		boolean  f = false;
		try {
			String sql = "update book_dtls set bookname=, author=?, price=?, status =? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(1, b.getPrice());
			ps.setString(1, b.getStatus());
			ps.setInt(1,b.getBookID());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_dtls where bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1){
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDtls> getOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next() ) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();		
		BookDtls b = null;
		try {
			String sql= "select * from book_dtls where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getNString(3));
				b.setPrice(rs.getNString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
}
