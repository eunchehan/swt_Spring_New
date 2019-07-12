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
	private String[] files; // 첨부파일 이름 배열
	private String id;// 작성자 이름(tbl_member 테이블과 조인할때 사용)
	private Date regdate;
	private int ref;	// 게시글 그룹
	private int re_step;	// 그룹 내 정렬(출력) 순서
	private int re_level;	// 답글 Level ex) RE: / RE:RE:
}
