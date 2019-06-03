package com.swt.domain.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 변수 전체 담은 생성자
@Getter	// Getter()
@Setter	// Setter()
@ToString	// ToString()
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private int bir_yy;
	private int bir_mm;
	private int bir_dd;
	private String phone;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date regdate;
	
}
