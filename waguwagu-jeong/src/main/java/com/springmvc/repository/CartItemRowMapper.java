package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.CartItem;
import com.springmvc.service.CartItemService;


public class CartItemRowMapper implements RowMapper<CartItem> 
{
	
	private final CartItemService cis;
	
	public CartItemRowMapper(CartItemService cis) 
	 {
	        this.cis = cis;
	  }

	@Override
    public CartItem mapRow(ResultSet rs, int rowNum) throws SQLException {
        CartItem cartItem = cis.createCartItem(rs.getString(2),rs.getString(1));
        cartItem.setQuantity(rs.getInt(3));
        cartItem.setTotalPrice(rs.getInt(4));
      
        return cartItem;
    }
}
