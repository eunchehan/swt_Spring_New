package com.swt.service.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.swt.domain.board.BoardDTO;
import com.swt.domain.product.CartDTO;
import com.swt.domain.product.ProductDTO;
import com.swt.persistence.product.ProductDAO;

import lombok.extern.slf4j.Slf4j;
// 실제 Service를 동작하는 Class에는 @Service를 추가해야 함
@Service
@Slf4j
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO pDao;
	
	@Override
	public HashMap<String, List<ProductDTO>> productList() {
		// 베스트상품과 신상품을 받아서 index로 전달 
		List<ProductDTO> bList = pDao.bestList();
		List<ProductDTO> nList = pDao.newList();
		// bList, nList를 한번에 return으로 보낼 수 없으니까 HashMap으로 보냄
		HashMap<String, List<ProductDTO>> map = new HashMap<>();
		map.put("bList", bList); // Controller단으로 이동 map에다가 list를 두개를 보낼수 있움
		map.put("nList", nList);
		
		return map;
	}

	@Override
	public ProductDTO productView(String p_code) {
		return pDao.productView(p_code);
	}

	@Override
	public int wishCheck(String p_code, String id) {
		return pDao.wishCheck(p_code,id);
	}

	@Override
	public void wishUpdate(String p_code, String id) {
		int result = pDao.wishCheck(p_code, id);
		if(result>0) {
			pDao.wishDelete(p_code,id);
		} else {
			pDao.wishInsert(p_code, id);
		}
	}

	@Override
	public List<HashMap<String, String>> wishList(String id) {
		return pDao.wishList(id);
	}

	@Override
	public void wishDelete(String p_code, String id) {
		pDao.wishDelete(p_code, id);
	}

	@Override
	public int cartAdd(String p_code, int amount, String id) {
		int flag = 1;
		List<CartDTO> list = pDao.cartCheck(id);
		for (CartDTO cartDTO : list) {
			if(p_code.equals(cartDTO.getP_code())) {
				flag = 0;
				break;
			}
		}
		if(flag==1) {
			pDao.cartAdd(p_code,amount,id);
		}
		
		return flag;
	}

	@Override
	public List<HashMap<String, String>> cartList(String id) {
		return pDao.cartList(id);
	}

	@Override
	public void cartDelete(String id, int index) {
		pDao.cartDelete(id, index);
	}


}
