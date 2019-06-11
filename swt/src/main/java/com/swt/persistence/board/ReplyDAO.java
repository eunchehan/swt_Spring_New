package com.swt.persistence.board;

import java.util.List;

import com.swt.domain.board.ReplyDTO;

public interface ReplyDAO {
	// DAO는 DB타는 곳. DAOImpl에서 mapper로 감
	// DB를 타야하면 DAO 만듦. 똑같아서 service단이랑 dao랑 똑같은 것 
	// DB안타는 경우는 service쪽이랑 똑같이 복사해서 만들지 않음 
	public List<ReplyDTO> list(int bno); // 댓글 목록 출력 
	public void create(ReplyDTO rDto);	// 댓글 등록
	public void delete(ReplyDTO rDto);	// 댓글 삭제 
}
