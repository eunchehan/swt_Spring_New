package com.swt.persistence.product;

import java.util.HashMap;
import java.util.List;

import com.swt.domain.product.CartDTO;
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
	public int cartAdd(String p_code, int amount, String id);
	public List<HashMap<String, String>> cartList(String id);
	public List<CartDTO> cartCheck(String id);
	public void cartDelete(String id, int index);
	public int cartTotal(String id);
	
}
