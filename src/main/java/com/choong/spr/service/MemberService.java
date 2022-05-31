package com.choong.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.domain.MemberDto;
import com.choong.spr.mapper.BoardMapper;
import com.choong.spr.mapper.MemberMapper;
import com.choong.spr.mapper.ReplyMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardService boardService;
	
	public boolean addMember(MemberDto member) {
		
		//평문암호를 암호화(encoding)
	String encoderPassword = passwordEncoder.encode(member.getPassword());
	
	//암호화된 암호를 다시 세팅
	member.setPassword(encoderPassword);
	//insert member
	int cnt1 = mapper.insertMember(member);
	
	// insert auth
	int cnt2 = mapper.insertAuth(member.getId(), "ROLE_USER");
	
	 return cnt1== 1 && cnt2 == 1;
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
	
	@Transactional
	public boolean removeMember(MemberDto dto) {
		// TODO Auto-generated method stub
		MemberDto member = mapper.selectMemberBtId(dto.getId());
		
		String rawPW = dto.getPassword();
		String encodedPW = member.getPassword();
		
		if(passwordEncoder.matches(rawPW, encodedPW)) {
			//댓글삭제
			replyMapper.deleteByMemberId(dto.getId());
			//이맴버가 쓴 게시글에 달린 다른사람 댓글 삭제
			List<BoardDto> boardList = boardMapper.listByMemberId(dto.getId());
			for(BoardDto board : boardList) {
				boardService.deleteBoard(board.getId());
			}
			// 이맴버가 쓴 게시글 삭제
			
			//권한테이블 삭제
			 mapper.deleteAuthById(dto.getId());
			 //맴버테이블 삭제
			int cnt = mapper.deleteMemberById(dto.getId());
			return cnt ==1;
		}
		return false;
		/*	//암호화된 암호를 다시 세팅
	member.setPassword(encoderPassword);
	//insert member
	int cnt1 = mapper.insertMember(member);
	
	// insert auth
	int cnt2 = mapper.insertAuth(member.getId(), "ROLE_USER");
	
	 return cnt1== 1 && cnt2 == 1;
*/
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

	

	public void initPassword(String id) {
		String pw = passwordEncoder.encode(id);
		mapper.updatePasswordById(id,pw);
	}

	
	

}
