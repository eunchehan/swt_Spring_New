package com.swt.domain.board;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본생성자 
@AllArgsConstructor	// 변수 다 포함된 생성자
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private int goodcnt;
	private String id;// 작성자 이름(tbl_member 테이블과 조인할때 사용)
	private Date regdate;
	private String filename;
	private int filesize;
}
