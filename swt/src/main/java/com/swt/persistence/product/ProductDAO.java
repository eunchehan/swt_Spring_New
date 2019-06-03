package com.swt.persistence.product;

import java.util.List;

import com.swt.domain.product.ProductDTO;

public interface ProductDAO {
	// 추상 메서드 
	public List<ProductDTO> bestList();	// 베스트 상품
	public List<ProductDTO> newList();	// 신상품 
}
