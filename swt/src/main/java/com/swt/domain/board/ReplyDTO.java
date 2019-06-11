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
public class ReplyDTO {
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	private int bno;
}
