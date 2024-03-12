package com.springmvc.controller;



import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Product;
import com.springmvc.service.ProductService;


//1. 역할 지정
@Controller
@RequestMapping("/products")
public class ProductController 
{
	@Autowired
	private ProductService productService;

	// READ
	@GetMapping
	public String requestProductList(Model model) 
	{
		List<Product> list = productService.readAllProductList(); // 호출하니까 이동해야지
		model.addAttribute("productList", list);
		return "products";
	}
	
	@GetMapping("/all")
	public String requestAllProducts(Model model) 
	{
		List<Product> list = productService.readAllProductList(); // 호출하니까 이동해야지
		model.addAttribute("productList", list);
		return "products";
	}
	
	@GetMapping("/product")
	public String requestProductById(@RequestParam("id") String productId, Model model)
	{
		Product pdById = productService.readProductById(productId);
		model.addAttribute("pd", pdById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

		return "product";
	}
	
	// CREATE

	@GetMapping("/add")
	public String requestAddProductForm(@ModelAttribute("addProduct")Product product) 
	{
		System.out.println("GetMapping 도착");
		return "addProduct";
		
	}

	@PostMapping("/add")
	public String submitAddNewProduct(@ModelAttribute("addProduct")Product product, HttpServletRequest request) 
	{
		MultipartFile img = product.getProductImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		
		File saveFile = new File(save, saveName);
		if(img !=null&& ! img.isEmpty()) 
		{
			try {
				img.transferTo(saveFile);
				product.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		System.out.println("PostMapping 도착");
		productService.setNewProduct(product);
		return "redirect:/products";
	}
	
	@GetMapping("/update")
	public String getUpdateBookForm(@ModelAttribute("updateProduct") Product pd, @RequestParam("id") String productId, Model model) 
	{
		Product pdById = productService.readProductById(productId);
		model.addAttribute("pd",pdById);
		
		return "updateProduct";		
	}
	
	@PostMapping("/update")
	public String submitUpdateBookForm(@ModelAttribute("updateProduct") Product pd, HttpServletRequest request) 
	{
		MultipartFile img = pd.getProductImage();
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");

		File saveFile = new File(save, saveName);
		if(img!=null && !img.isEmpty()) 
		{
			System.out.println("이미지는 null이 아님");
			try {
				img.transferTo(saveFile);
				pd.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		productService.setUpdateBook(pd);
		return "redirect:/products";		
	}
	
	
	@RequestMapping(value="/delete")
	public String getDeleteBookForm(Model model, @RequestParam("id") String productId) 
	{
		productService.setDeleteBook(productId);
		return "redirect:/products";
	}
}
