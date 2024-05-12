package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDaoIplm implements BookDAO {

	private Connection con;

	public BookDaoIplm(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		
		boolean f = false;

		try {
				String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) "
						+ "values(?,?,?,?,?,?,?)";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, b.getBookname());	
				ps.setString(2, b.getAuthor());
				ps.setString(3, b.getPrice());
				ps.setString(4, b.getBookCategory());
				ps.setString(5, b.getStatus());
				ps.setString(6, b.getPhoto());
				ps.setString(7, b.getUser_email());
			
				int i = ps.executeUpdate();
				if(i==1) {
					f= true;
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		
		BookDtls b = null;
		
		try {
			
			String sql="select * from book_dtls";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public boolean UpdateEditBooks(BookDtls b) {
		
		boolean f = false;
		
		try {
			String sql ="update book_dtls set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, b.getBookname());	
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
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
	public boolean DeleteBooks(int id) {
		
		boolean f = false;
		
		try {
			String sql = "delete from book_dtls where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b = null;
		
		try {
			String sql = "select * from book_dtls where bookId =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public List<BookDtls> getNewBook() { //use for NEW BOOK which is represented in index page
		
		List<BookDtls> list = new ArrayList<>();
		
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i = 1;
			//Each row has 4 books
			while(rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() { //use for RECENT BOOK which is represented in index page
		
		List<BookDtls> list = new ArrayList<>();
		
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i = 1;
			//Each row has 4 books
			while(rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getOldBook() { //use for OLD BOOK which is represented in index page
		List<BookDtls> list = new ArrayList<>();
		
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i = 1;
			//Each row has 4 books
			while(rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBook() { ////use for RECENT BOOK PAGE
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() { //use for NEW BOOK PAGE
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() { //use for OLD BOOK PAGE
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null; 
		
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	// Setting => Old Book (can sell old book and review the list of old book that we sold)
	public List<BookDtls> getBookByOld(String email, String type) { 
		List<BookDtls> list = new ArrayList<BookDtls>();	
		BookDtls b = null;
		
		
		try {
			String sql = "select * from book_dtls where bookCategory=? and email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String type, int bid) {
		boolean f = false;
		
		try {
			String sql = "delete from book_dtls where bookCategory=? and email=? and bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, email);
			ps.setInt(3, bid);
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		
		try {
			String sql = "select * from book_dtls where bookname like ? or author like ? "
					+ "or bookCategory like ? and status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	

}
