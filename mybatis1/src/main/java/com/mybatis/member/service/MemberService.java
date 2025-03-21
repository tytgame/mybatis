package com.mybatis.member.service;

import com.mybatis.member.vo.Member;

public interface MemberService {
	Member loginMember(Member m);
	
	int checkID(String userId);
	
	// 회원가입
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(String userId);
}
