package com.swt.domain.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
// @Data 사용 비추
// : 사용하지 않는 내용들까지 추가됨 
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 변수 전체 담은 생성자
@Getter	// Getter()
@Setter	// Setter()
@ToString	// ToString()
public class ProductDTO {
	private String p_code;
	private String p_type;
	private String p_name;
	private int p_price;
	private String p_img;
	private int p_cnt;
	private int p_good;
	private Date p_indate;
	// 생성자
	// 전체생성자
	// 게터
	// 세터
	// 투스트링
	
	// lombok
}
