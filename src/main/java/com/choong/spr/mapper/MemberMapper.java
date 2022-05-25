package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.MemberDto;

public interface MemberMapper {



	
	int insertMember(MemberDto member);

	int countMemberId(String id);

	int countMemberEmail(String email);

	int countMembernickName(String nickName);

	List<MemberDto> listAll();

	MemberDto selectMemberBtId(String id);

	int deleteMemberById(String id);

}
