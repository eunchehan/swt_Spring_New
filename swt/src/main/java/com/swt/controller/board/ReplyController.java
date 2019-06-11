package com.swt.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swt.domain.board.ReplyDTO;
import com.swt.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("reply/*")
@Controller
public class ReplyController {
	@Inject
	private ReplyService service;
	
//	@RequestBody // 이렇게 하면 동작 멈춰버림. AJax지만 이 경우에만 @RequestBody안붙임. data로 인식해버림. 
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String listAll(int bno, Model model) {
		log.info(">>>>>> 댓글 목록 출력");
		List<ReplyDTO> list = service.list(bno);
		model.addAttribute("replyList",list);
		
		return "board/commentlist";
	}
	
	
}
