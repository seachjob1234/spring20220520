package com.choong.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.choong.spr.domain.MemberDto;
import com.choong.spr.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public boolean addMember(MemberDto member) {
		
		//평문암호를 암호화(encoding)
	String encoderPassword = passwordEncoder.encode(member.getPassword());
	
	//암호화된 암호를 다시 세팅
	member.setPassword(encoderPassword);
	
	 return mapper.insertMember(member) == 1;
	}

	public boolean hasMemberId(String id) {
		// TODO Auto-generated method stub
		return mapper.countMemberId(id) > 0;
	}

	public boolean hasMemberEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.countMemberEmail(email) > 0;
	}

	public boolean hasMembernickName(String nickName) {
		// TODO Auto-generated method stub
		return mapper.countMembernickName(nickName) > 0;
	}

	public List<MemberDto> listMember() {
		// TODO Auto-generated method stub
		return mapper.listAll();
	}

	public MemberDto getMemberById(String id) {
		// TODO Auto-generated method stub
		return mapper.selectMemberBtId(id);
	}

	public boolean removeMember(MemberDto dto) {
		// TODO Auto-generated method stub
		MemberDto member = mapper.selectMemberBtId(dto.getId());
		
		String rawPW = dto.getPassword();
		String encodedPW = member.getPassword();
		
		if(passwordEncoder.matches(rawPW, encodedPW)) {
			return mapper.deleteMemberById(dto.getId()) == 1;
		}
		return false;
	}

	public boolean modifyMember(MemberDto dto, String oldPassword) {
		//db에서 member 읽어서 
		MemberDto oldMember = mapper.selectMemberBtId(dto.getId());
		
		String encodedPW = oldMember.getPassword();
		
		//기존 password가 일치할 때만 계속 진행
		if(passwordEncoder.matches(oldPassword, encodedPW)) {
			
			// 암호 인코딩
			dto.setPassword(passwordEncoder.encode(dto.getPassword()));
			return mapper.updateMember(dto) == 1;
		}
		return false;
	}


	

}
