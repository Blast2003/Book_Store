package com.DAO;


import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	public List<Cart> getBookByUser(int userId); // based on which user => get the book he/she offer
	public boolean deteleBook(int bid, int uid, int cid); // remove book inside cart
	
	
}
