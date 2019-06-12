package com.swt.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swt.domain.board.ReplyDTO;
import com.swt.persistence.board.BoardDAO;
import com.swt.persistence.board.ReplyDAO;

import lombok.AllArgsConstructor;

// @AllArgsConstructor	// lombok을 통한 의존성주입의 또다른 방식. 이거 사용해야 사용 가능
@Service
public class ReplyServiceImpl implements ReplyService{
	// 의존성 주입대신 lombok을 사용해서 할 수 있는 방법. 생성자를 호출하면 됨 
//	ReplyDAO rDao;
//	BoardDAO bDao;  
	@Inject
	private ReplyDAO rDao;
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}
	
	@Transactional
	@Override
	public void create(ReplyDTO rDto) {// service에서 댓글 등록과 댓글갯수증가가 동시에 이뤄져야함.
		// 비즈니스로직
		// 1) 댓글 등록 
		rDao.create(rDto);
		// 트랜잭션으로 묶을 것이라 result>0일때 2)가 이뤄지게 할필요 없음 
		// 2) 해당 게시글 댓글갯수가 증가하는 로직이 같이 이뤄져야 함 
		String flag="plus";	// mapper에서 댓글 증감을 구별해주기위해 flag를 만들어 보내줌  
		int bno = rDto.getBno(); // rDto에 bno가 있으니까 이렇게 꺼내와서 DAO갈때 보내주면 됨. AJAX에서 bno를 쿼리스트링으로 보내주지만 dto에 담기니까 꺼내서 써주면 됨 
		rDao.update(bno, flag);
		
		// 여기서 map 만들어서 flag랑 bno 보내줘도 됨 
		// map.put("flag", "plus"); 이렇게 보내줄수도 있음 
	}
	
	@Transactional
	@Override
	public void delete(ReplyDTO rDto) {
		// 비즈니스로직
		// 1)댓글 삭제
		rDao.delete(rDto.getRno());
		// 2) 해당 게시글 댓글갯수가 감소하는 로직이 같이 이뤄져야 함 
		String flag="minus";
		int bno = rDto.getBno();
		rDao.update(bno, flag);
	}

}
