package com.swt.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swt.domain.product.ProductDTO;

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


}
