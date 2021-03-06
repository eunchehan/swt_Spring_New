package com.swt.persistence.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.swt.domain.board.BoardDTO;

public interface BoardDAO {
	public int create(BoardDTO bDto); // 게시글 등록
	public int update(BoardDTO bDto); // 게시글 수정
	public int delete(int bno);	// 게시글 삭제 
	public BoardDTO read(int bno);	// 상세 게시글
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);	// 게시글 목록 
	public void increaseViewCnt(int bno);	// 조회수 증가 처리 
	public int countArticle(String search_option, String keyword);	// 레코드 갯수 계산
	public void updateStep(int re_step, int ref);
	public void answer(BoardDTO bDto);
	public void addAttach(String fullName); // 첨부파일 동작
}
