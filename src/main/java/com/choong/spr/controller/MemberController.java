package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choong.spr.domain.MemberDto;
import com.choong.spr.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService service;

	//memberservice 작성
	//addmember 작성
	//자바,xml,insert에
	//

	@GetMapping("signup")
	public void signupForm() {

	}

	@PostMapping("signup")
	public String signupProcess(MemberDto member, RedirectAttributes rttr) {
		boolean success = service.addMember(member);

		if (success) {
			rttr.addFlashAttribute("messege","회원가입이 완료되었습니다" );
			return "redirect:/board/list";
		} else {
			rttr.addFlashAttribute("messege","회원가입이 실패하였습니다" );
			rttr.addFlashAttribute("member", member);
			
			return "redirect:/member/signup";
		}
	}

	@GetMapping(path = "check", params = "id")
	@ResponseBody
	public String idcheck(String id) {
		boolean exist = service.hasMemberId(id);

		if (exist) {
			return "notOk";
		} else {
			return "ok";
		}
	}
	@GetMapping(path = "check", params = "email")
	@ResponseBody
	public String emailcheck(String email) {
		boolean exist = service.hasMemberEmail(email);

		if (exist) {
			return "notOk";
		} else {
			return "ok";
		}
	}
	@GetMapping(path = "check", params = "nickName")
	@ResponseBody
	public String nickNamecheck(String nickName) {
		boolean exist = service.hasMembernickName(nickName);

		if (exist) {
			return "notOk";
		} else {
			return "ok";
		}
	}
	@GetMapping("list")
	public void list(Model model) {
		List<MemberDto> list = service.listMember();
		model.addAttribute("memberList",list);
	}
	@GetMapping("get")
	public void getMember(String id, Model model) {
		MemberDto member = service.getMemberById(id);
		
		model.addAttribute("member",member);
	}
	@PostMapping("remove")
	public String removeMember(MemberDto dto, RedirectAttributes rttr) {
		boolean success = service.removeMember(dto);
		
		if(success) {
			rttr.addFlashAttribute("messege", "회원 탈퇴 되었습니다.");
			return "redirect:/board/list";
		}else {
			rttr.addFlashAttribute("id", dto.getId());
			return "redirect:/member/get";
		}
	
	}
@PostMapping("modify")
public String modifyMember(MemberDto dto,String oldPassword, RedirectAttributes rttr) {
	
	boolean success = service.modifyMember(dto,oldPassword);
	if(success) {
		rttr.addFlashAttribute("messege", "회원정보가 수정되었다");
	}else {
		rttr.addFlashAttribute("messege", "회원 정보가 수정되지 않았다");
	}
	rttr.addFlashAttribute("member", dto);
	rttr.addAttribute("id",dto.getId());
	
	return "redirect:/member/get";
}
	
	
}
