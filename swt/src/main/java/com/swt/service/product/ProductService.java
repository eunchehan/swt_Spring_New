package com.swt.service.product;

import java.util.HashMap;
import java.util.List;

import com.swt.domain.product.ProductDTO;

public interface ProductService {
	
	// 베스트상품과 신상품 목록 
	public HashMap<String, List<ProductDTO>> productList();
}
