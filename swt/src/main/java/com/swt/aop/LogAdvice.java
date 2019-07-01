package com.swt.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

// 로그 수집 작업을 하려면 모든 메서드에 해야 함
// 로그 수집은 중요한 업무이지만 핵심적인 업무는 아니고
// 공통적인 업무에 해당됨
// 공통적인 업무는 모든 class의 모든 method에 작성하지 말고
// Advice에 모아서 작성하고
// 세부적인 코드에서는 핵심업무에 집중하도록 처리 


@Component	// 스프링 beans로 등록되기 위한 설정
@Aspect	// AOP bean - 공통 업무를 지원하는 코드
@Slf4j
public class LogAdvice {
	// 포인트컷 - 실행 시점,
	// Around(메서드 실행 전후)
	// Before(메서드 실행 전)
	// After(메서드 실행 후)
	
	// execution경로에 //는 하위패키지들이 다 들어갈 수 있다는 의미
	// com.swt.controller. 패키지 안에 있는 모든 클래스들 중에서 뒤에 Controller로 끝나는 애들안에 있는 모든 메서드들을 실행할때 하겠다.
	// com.swt.persistence. 안에 Impl로 끝나는 클래스 내의 모든 메서드들 실행할때 실행하겠다.
	// 다시 실행 시키려면 밑에 3줄 주석 풀면 됨 
//	@Around("execution(* com.swt.controller..*Controller.*(..))"
//			+ " or execution(* com.swt.service..*Impl.*(..))"
//			+ " or execution(* com.swt.persistence..*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		// 메서드 시작시간
		long start = System.currentTimeMillis();
		
		// joinPoint.procced(); 줄을 기준으로 
		// ↑ 위에가 호출 전
		// ↓ 아래가 호출 후
		Object result = joinPoint.proceed(); // 핵심업무 실행 : 비즈니스로직실행 joinPoint.proceed();을 기점으로 위는 before 아래는 after. @Around는 before,after 둘 다 씀 
		
		// 호출한 클래스 이름
		String type = joinPoint.getSignature().getDeclaringTypeName();
		
		// 호출한 클래스의 이름에 따라 if문을 타고 출력
		String name = "";
		if(type.indexOf("Controller") > -1) {// -1보다 크다는 건 클래스 이름에 Controller란 값이 있다는 것 
			name="Controller \t:"; // \t: 8칸 띄움 
		} else if(type.indexOf("Service") > -1) {
			name = "ServiceImpl \t:";
		} else if(type.indexOf("DAO") > -1) {
			name = "DaoImpl \t:";
		}
		
		// 호출한 클래스, method 정보
		log.info(name+type+"."+joinPoint.getSignature().getName());
		// method에 전달되는 매개변수들
		log.info(Arrays.deepToString(joinPoint.getArgs()));
		// 메서드 끝나는 시간
		long end = System.currentTimeMillis();
		long time = end - start;
		log.info("실행시간: "+time);
		return result;
	}
}
