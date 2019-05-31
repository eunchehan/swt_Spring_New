package com.swt.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// @RunWith가 하는 역할?
// : Junit의 러너클래스를 확장해서 스프링과 관련된 기능을 제공
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations=
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTest {
	private static final Logger logger = 
			LoggerFactory.getLogger(MybatisTest.class);
	
	// 의존관계 주입
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		logger.info("sqlFactory: " + sqlFactory);
	}
	@Test
	public void testSession() {
		try(SqlSession sqlSession = sqlFactory.openSession()) {
			logger.info("sqlSession: "+sqlSession);
			logger.info("Mybatis 연결성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
