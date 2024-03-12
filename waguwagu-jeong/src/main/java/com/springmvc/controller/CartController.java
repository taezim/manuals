package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


import com.springmvc.domain.Cart;
import com.springmvc.domain.CartItem;
import com.springmvc.domain.Product;
import com.springmvc.service.CartItemService;
import com.springmvc.service.CartService;
import com.springmvc.service.ProductService;

@Controller
@RequestMapping(value="/cart")
public class CartController 
{
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartItemService cartItemService;
	
	//14.3.1 restful 추가
	@Autowired
	private ProductService pdService;
	

	/*아직 cart 만들지 않습니다. 장바구니 페이지에 뿌리기 위한 정보가*/
	@GetMapping
	public String requestByMemberId(HttpServletRequest request) 
	{
		 String cartId = request.getSession(true).getId();
	    return "redirect:/cart/"+cartId;
	}
	@PostMapping
	public @ResponseBody Cart create (@RequestBody Cart cart)
	{
	     return cartService.create(cart);
	}
	
	@GetMapping("/{cartId}")
	public String requestCartListBySession(@PathVariable String cartId, Model model, HttpServletRequest request) 
	{
		Cart cart = cartService.read(cartId);
		List<CartItem> cartItems = cartItemService.readAllCartItem(cartId);
		for (CartItem cartItem : cartItems) 
		{
		    String productId = cartItem.getProductId();
		    Product product = pdService.readProductById(productId);
		    cartItem.setProduct(product);
		}
		cart.setCartItems(cartItems);
		request.setAttribute("cart", cart);
		model.addAttribute("cart", request.getAttribute("cart")); //
		return "cart";
	}
	
	@PutMapping("/{cartId}")
	public @ResponseBody Cart read(@PathVariable(value="cartId") String cartId) 
	{
		return cartService.read(cartId);
	}

	
	/*카트 생성 CREATE*/
	@PutMapping("/add/{productId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)// 오류 응답 상태 코드 설정
	public void addCartByNewItem(@PathVariable String productId, HttpServletRequest request) 
	{	/*소지한 카트가 이미 존재하는 지 확인*/
		String cartId = request.getSession(true).getId();//장바구니 ID인 세션 ID 가져오기
		Cart cart = cartService.read(cartId); // 장바구니에 등록된 모든 정보 얻어 오기
		/*소지한 카트가 없다면 생성*(세션 = 유일값)*/ 
		if(cart==null)
		{
			cart = cartService.create(new Cart(cartId));
			// 경로 변수 bookId에 대한 정보 얻어오기
		}		
			Product pd = pdService.readProductById(productId);
			
			if(pd==null) 
			{
				
				System.out.println("product객체=null" );
			}
			//cart.addCartItem(new CartItem(productId));// 카트에 상품(해당 book) 담음
			CartItem cartItem = cartItemService.createCartItem(productId,cartId);
			cartItemService.addCartItem(cartItem);
			cartService.update(cartId, cart);// 세션 ID에 대한 장바구니 갱신하기 -- 기본 카트를 새로고침 update
		}

	@PutMapping("/remove/{productId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeCartByItem(@PathVariable String productId, HttpServletRequest request) 
	{
		String cartId = request.getSession(true).getId();
		Cart cart = cartService.read(cartId);
		Product pd = pdService.readProductById(productId);
		if(pd==null) 
		{
			System.out.println("product객체=null" );
		}
		CartItem cartItem = cartItemService.createCartItem(productId,cartId);
		cartItemService.removeCartItem(cartItem);
		cartService.update(cartId, cart);
	}
	
	@DeleteMapping("/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void deleteCartList(@PathVariable(value="cartId") String cartId) 
	{
		cartService.delete(cartId);
	}
	
}
