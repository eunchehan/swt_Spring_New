package com.swt.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swt.domain.product.ProductDTO;
import com.swt.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	//	lombok사용하기 전 
//	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
//	logger.info("Welcome home! The client locale is {}.", locale);
	
//	log.info("lombok사용한 후");
	
	@Inject	// 의존성 주입 이@Inject하나당 하나만 됨 
	private ProductService service;
	
	// 인터페이스는 문법상 객체생성이 원래 안됨 beans에는 impl한 class만 관리됨 
	// 구현했기때문에 인터페이스로 구현한 클래스에 있는 메서드를 바로 사용할 수 있는 것임 
	
	@RequestMapping("/")
	public String index(Model model) {
		log.info("index 페이지");
		HashMap<String, List<ProductDTO>> map = service.productList();
		
		model.addAttribute("pLists", map);
		return "index";
	}
}
