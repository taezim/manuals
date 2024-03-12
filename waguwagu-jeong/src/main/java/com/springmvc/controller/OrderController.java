package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Cart;
import com.springmvc.domain.Order;
import com.springmvc.service.CartService;
import com.springmvc.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController 
{
	/*이 컨트롤러는 무엇보다도 View 연결이 주 목적이다*/
	
	/*나중에 주문 목록 조회? 이런건 컨트롤러를 하나 더 만들것!
	 * for ex) OrderInfoController? 몰라!!*/
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;

	
	/*result="order.cart*/
	/*장바구니에 담긴 아이템을 유효성 검사예정 -- cartServiceImpl의 함수를 실행해야함*/
	@GetMapping
	public String requestBuyerForm(@RequestParam String cartId, Model model, HttpServletRequest request) 
	{
		System.out.println("requestBuyerForm 도착");
		//cartId 전달된 것을 확인함
		Cart cart= cartService.validateCart(cartId);
		//유효성 검사한 객체도 받아옴
		Order order = new Order();
		order.setCart(cart);
		//order 객체에 cart도 제대로 세팅함 order.getCart().getCartId() 는 세션으로 제대로 나옴
		HttpSession session = request.getSession();
		session.setAttribute("cart", order.getCart());
		model.addAttribute("order", order);
		return "/Order/buyerInfo";
	}
	
	@PostMapping
	public String requestConfirm(@ModelAttribute Order order, Model model, HttpServletRequest request)
	{
		System.out.println("requestConfirm 도착");
		HttpSession session = request.getSession();
		Cart cart =  (Cart) session.getAttribute("cart");
		//cart 정상
		order.setCart(cart);
		Long orderId = orderService.saveOrder(order);
		
		session.setAttribute("order", order);
	    model.addAttribute("order", session.getAttribute("order"));
		model.addAttribute("cart", cart);
		model.addAttribute("cartItems", cart.getCartItems());
		return "/Order/orderConfirmation";
	}
	
	@PostMapping("/complete")
	public String completeOrder(HttpServletRequest request) 
	{
		HttpSession session = request.getSession();
		session.removeAttribute("cart");
		session.removeAttribute("cartItems");
		return "/Order/orderFinished";
	}


}
