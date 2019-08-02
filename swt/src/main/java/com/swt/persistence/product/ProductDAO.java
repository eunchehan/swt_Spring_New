package com.swt.persistence.product;

import java.util.HashMap;
import java.util.List;

import com.swt.domain.product.ProductDTO;

public interface ProductDAO {
	// 추상 메서드 
	public List<ProductDTO> bestList();	// 베스트 상품
	public List<ProductDTO> newList();	// 신상품 
	public ProductDTO productView(String p_code);
	public int wishCheck(String p_code, String id);
	public void wishDelete(String p_code, String id);
	public void wishInsert(String p_code, String id);
	public List<HashMap<String, String>> wishList(String id);
}
