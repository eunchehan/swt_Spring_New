package com.swt.service.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swt.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		// DAO한테 id 줘야함 
		return mDao.idCheck(id);
	}

}
