package com.springmvc.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.sql.DataSource;

import com.springmvc.domain.Cart;
import com.springmvc.domain.CartItem;
import com.springmvc.service.CartItemService;

@Repository
public class CartRespositoryImpl implements CartRepository {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    CartItemService cis;
    
    public CartRespositoryImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // CREATE
    @Override
    public Cart create(Cart cart) {
        String insertCartQuery = "INSERT INTO cart (c_id, c_grandTotal) VALUES (?, ?)";
        
        try {
            jdbcTemplate.update(insertCartQuery, cart.getCartId(), cart.getGrandTotal());
            return cart;
        } catch (Exception e) {
            throw new RuntimeException("장바구니를 생성할 수 없습니다.", e);
        }
    }

    // READ
    @Override
    public Cart read(String cartId) {
        String selectCartQuery = "SELECT * FROM cart WHERE c_id = ?";

        try {
            return jdbcTemplate.queryForObject(selectCartQuery, new Object[]{cartId}, new CartRowMapper());
        } catch (Exception e) {
            return null; // 존재하지 않는 경우 null을 반환하거나 예외 처리를 수행합니다.
        }
    }

    // UPDATE
    @Override
    public void update(String cartId, Cart cart) {
        String updateCartQuery = "UPDATE cart SET c_grandTotal = ? WHERE c_id = ?";

        try {
            jdbcTemplate.update(updateCartQuery, cart.getGrandTotal(), cartId);
        } catch (Exception e) {
            throw new RuntimeException("장바구니를 갱신할 수 없습니다.", e);
        }
    }

    // DELETE
    @Override
    public void delete(String cartId) {
        String deleteCartQuery = "DELETE FROM cartItems WHERE c_id = ?";

        try {
            jdbcTemplate.update(deleteCartQuery, cartId);
        } catch (Exception e) {
            throw new RuntimeException("장바구니를 삭제할 수 없습니다.", e);
        }
    }

    @Override
    public void updateGrandTotal(String cartId) {
        Cart cart = read(cartId);
        if (cart!= null) {
            int grandTotal = 0;
            List<CartItem> cartItemsList = cis.readAllCartItem(cartId);

            for (CartItem item : cartItemsList) {
                grandTotal += item.getTotalPrice();
            }

            String updateGrandTotalQuery = "UPDATE cart SET c_grandTotal = ? WHERE c_id = ?";
            jdbcTemplate.update(updateGrandTotalQuery, grandTotal, cartId);
        }
    }
}

