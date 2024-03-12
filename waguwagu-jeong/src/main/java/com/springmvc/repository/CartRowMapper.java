package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Cart;

public class CartRowMapper implements RowMapper<Cart> {

    @Override
    public Cart mapRow(ResultSet rs, int rowNum) throws SQLException 
    {
        Cart cart = new Cart();
        cart.setCartId(rs.getString("c_id")); 
        cart.setGrandTotal(rs.getInt("c_grandTotal"));

        return cart;
    }
}

