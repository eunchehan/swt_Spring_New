package com.swt.persistence.member;

import com.swt.domain.member.MemberDTO;

public interface MemberDAO {
	public int idCheck(String id);
	public int create(MemberDTO mDto);
	public String login(MemberDTO mDto);
	public MemberDTO viewMember(String id);
}
