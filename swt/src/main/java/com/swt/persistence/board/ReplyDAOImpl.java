package com.swt.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swt.domain.board.ReplyDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class ReplyDAOImpl implements ReplyDAO{
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<ReplyDTO> list(int bno) {
		return sqlSession.selectList("reply.list",bno);
	}
	
	@Override
	public void create(ReplyDTO rDto) {
		log.info(rDto.toString());
		sqlSession.insert("reply.create",rDto);
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply.delete", rno);
	}

	@Override
	public void update(int bno, String flag) {
		// flag 보내줘야함 bno와 flag
		Map<String, Object> map = new HashMap<>();
		map.put("flag", flag);
		map.put("bno", bno);
		log.info(bno+","+flag);
		sqlSession.update("reply.update",map);
	}


}
