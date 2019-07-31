package com.swt.controller.product;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swt.domain.product.ProductDTO;
import com.swt.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("product/*")
public class ProductController {
	@Inject
	private ProductService service;
	
	@GetMapping(value="teashop")
	public String teaShop(Model model) {
		log.info(">>> Tea 상품 리스트 페이지 이동");
		HashMap<String, List<ProductDTO>> map = service.productList();
		model.addAttribute("map",map);
		
		return "product/teashop";
	}
	
	@GetMapping(value="view")
	public String view(String p_code, Model model) {
		log.info(">>> 상품 상세 페이지 이동: "+p_code);
		ProductDTO pDto = service.productView(p_code);
		model.addAttribute("one",pDto);
		return "product/view";
	}
	
}
