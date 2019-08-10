package com.swt.persistence.product;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swt.domain.board.BoardDTO;
import com.swt.domain.product.ProductDTO;
import com.swt.domain.product.CartDTO;

@Repository	// DAO라고 인식시켜줌 
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> bestList() {
		return sqlSession.selectList("pdt.bestList");
	}

	@Override
	public List<ProductDTO> newList() {
		return sqlSession.selectList("pdt.newList");
	}

	@Override
	public ProductDTO productView(String p_code) {
		return sqlSession.selectOne("pdt.view",p_code);
	}

	@Override
	public int wishCheck(String p_code, String id) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("p_code", p_code);
		map.put("id", id);
		return sqlSession.selectOne("pdt.wishCheck",map);
	}

	@Override
	public void wishDelete(String p_code, String id) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("p_code", p_code);
		map.put("id", id);
		sqlSession.delete("pdt.wishDelete",map);
	}

	@Override
	public void wishInsert(String p_code, String id) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("p_code", p_code);
		map.put("id", id);
		sqlSession.insert("pdt.wishInsert",map);
	}

	@Override
	public List<HashMap<String, String>> wishList(String id) {
		return sqlSession.selectList("pdt.wishList", id);
	}

	@Override
	public int cartAdd(String p_code, int amount, String id) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("p_code", p_code);
		map.put("amount", amount);
		map.put("id", id);
		return sqlSession.insert("pdt.cartAdd", map);
	}

	@Override
	public List<HashMap<String, String>> cartList(String id) {
		return sqlSession.selectList("pdt.cartList", id);
	}

	@Override
	public List<CartDTO> cartCheck(String id) {
		return sqlSession.selectList("pdt.cartCheck",id);
	}

	@Override
	public void cartDelete(String id, int index) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("cart_id", index);
		map.put("id", id);
		sqlSession.delete("pdt.cartDelete",map);
	}


}
