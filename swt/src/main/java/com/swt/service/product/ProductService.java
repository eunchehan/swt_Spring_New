package com.swt.service.product;

import java.util.HashMap;
import java.util.List;

import com.swt.domain.product.ProductDTO;

public interface ProductService {
	
	// 베스트상품과 신상품 목록 
	public HashMap<String, List<ProductDTO>> productList();
	// 상품 상세 페이지
	public ProductDTO productView(String p_code);
	public int wishCheck(String p_code, String id);
	public void wishUpdate(String p_code, String id);
	public List<HashMap<String, String>> wishList(String id); 
	public void wishDelete(String p_code, String id);
}
