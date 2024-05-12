package com.entity;

public class BookDtls {
	private int bookId;
	private String bookname;
	private String author;
	private String price;
	private String bookCategory;
	private String status;
	private String photo;
	private String user_email;

	
	
	public BookDtls( String bookname, String author, String price, String bookCategory, String status,
			String photo, String user_email) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photo = photo;
		this.user_email = user_email;
	}



	public BookDtls() {
		super();
	}



	public int getBookId() {
		return bookId;
	}



	public void setBookId(int bookId) {
		this.bookId = bookId;
	}



	public String getBookname() {
		return bookname;
	}



	public void setBookname(String bookname) {
		this.bookname = bookname;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getBookCategory() {
		return bookCategory;
	}



	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getPhoto() {
		return photo;
	}



	public void setPhoto(String photo) {
		this.photo = photo;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	@Override
	public String toString() {
		return "BookDtls [bookId=" + bookId + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photo=" + photo + ", user_email="
				+ user_email + "]";
	}
	
	
	

	
}
