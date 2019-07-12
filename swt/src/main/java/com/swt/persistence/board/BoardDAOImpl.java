package com.swt.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swt.domain.board.BoardDTO;

import lombok.extern.slf4j.Slf4j;
@Repository
@Slf4j
public class BoardDAOImpl implements BoardDAO {
	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public int create(BoardDTO bDto) {
		return sqlSession.insert("board.create",bDto);
	}

	@Override
	public int update(BoardDTO bDto) {
		return sqlSession.update("board.update",bDto);
	}

	@Override
	public int delete(int bno) {
		return sqlSession.delete("board.delete",bno);
	}

	@Override
	public BoardDTO read(int bno) {
		return sqlSession.selectOne("board.read",bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll",map);
	}

	@Override
	public void increaseViewCnt(int bno) {
		sqlSession.update("board.increaseViewCnt",bno);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
			// value에는 담고 싶은 데이터 타입을 씀. Object로 하면 하나의 map에 String도 넣고 int도 넣을 수 있음.
			// 다형성: 상속, 인터페이스때 씀. 부모가 있어야 사용 가능. 부모의 타입으로만 묶을 수 있음. 자식의 타입으로는 묶을 수 없음. 
			// 하나의 부모 타입으로 여러 자식 타입을 사용할 수 있다. 
		   // key, value (key value pair 라 함) Map: list도 여러개 담을 수 있는 아주 큰 가방
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("board.countArticle",map);
	}

	@Override
	public void updateStep(int re_step, int ref) {
		Map<String, Integer> map = new HashMap<>();
		log.info("re_step: "+re_step);
		map.put("re_step", re_step);
		map.put("ref", ref);
		sqlSession.update("board.updateStep",map);
	}

	@Override
	public void answer(BoardDTO bDto) {
		sqlSession.insert("board.answer",bDto);
	}

	@Override
	public void addAttach(String fullName) {
		log.info("파일첨부 테이블에 등록 DAO 옴");
		sqlSession.insert("board.addAttach", fullName);
	}

}
