package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.CartItem;
import com.springmvc.service.CartItemService;
import com.springmvc.service.ProductService;

@Repository
public class CartItemRepositoryImpl implements CartItemRepository
{
  
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemService cis;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
   
  
    public CartItemRepositoryImpl(JdbcTemplate jdbcTemplate, CartItemService cis) {
        this.jdbcTemplate = jdbcTemplate;
        this.cis = cis;

    }

    public List<CartItem> readAllCartItem(String cartId) 
    {
    	System.out.println("여기 도착도 안하나???");
        String SQL = "SELECT * FROM cartItems WHERE c_id=?";
        return jdbcTemplate.query(SQL, new Object[]{cartId}, new CartItemRowMapper(cis));
    }

    public void removeCartItem(CartItem item) {
        String SQL = "DELETE FROM cartItems WHERE c_id=? AND c_item=?";
        jdbcTemplate.update(SQL, item.getCartId(), item.getProductId());
        cartRepository.updateGrandTotal(item.getCartId());
    }

    public void removeAllCartItem(String cartId) {
        String SQL = "DELETE FROM cartItems WHERE c_id=?";
        jdbcTemplate.update(SQL, cartId);
        cartRepository.updateGrandTotal(cartId);
    }

    public void addCartItem(CartItem item) {
        String productId = item.getProductId();

        String SQL = "SELECT * FROM cartItems WHERE c_id=? AND c_item=?";
        List<CartItem> existingItems = jdbcTemplate.query(SQL, new Object[]{item.getCartId(), productId}, new CartItemRowMapper(cis));

        if (!existingItems.isEmpty()) {
            CartItem existingItem = existingItems.get(0);
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());

            SQL = "UPDATE cartItems SET c_quantity=?, c_totalPrice=? WHERE c_id=? AND c_item=?";
            jdbcTemplate.update(SQL, existingItem.getQuantity(), existingItem.getTotalPrice(), item.getCartId(), productId);
        } else {
            SQL = "INSERT INTO cartItems(c_id, c_item, c_quantity, c_totalPrice) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(SQL, item.getCartId(), productId, item.getQuantity(), item.getTotalPrice());
        
        }
        cartRepository.updateGrandTotal(item.getCartId());
    }




}
