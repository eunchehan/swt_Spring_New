package com.swt.persistence.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		// ajax에서부터 가져온 id를 service에서 받고 그걸 또 DAO로 보내준것을 mapper로 가져가서 sql문 실행 
		return sqlSession.selectOne("idCheck", id);
	}

}
