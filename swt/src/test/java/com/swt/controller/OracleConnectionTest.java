package com.swt.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OracleConnectionTest {
	// 로그 
	private static final Logger logger = 
			LoggerFactory.getLogger(OracleConnectionTest.class);
	
	// 드라이버 연결 정보
	private static final String DRIVER = 
				"oracle.jdbc.driver.OracleDriver";
	// URL
	private static final String URL =
			"jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "java";
	private static final String PW = "1234";
	
	// @Test 붙이면 junit으로 실행해서 TEST해줌
	@Test
	public void test() throws Exception {
		Class.forName(DRIVER);	// 드라이버 로딩
		
		// try ~ with문
		// try(매개변수)를 사용하고 자동으로 close해줌 (JAVA1.7버전 이상부터 지원)
		try(Connection conn = DriverManager.getConnection(URL, USER, PW)) {
			logger.info("Oracle에 연결되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
