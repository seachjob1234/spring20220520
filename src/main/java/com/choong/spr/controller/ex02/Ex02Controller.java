package com.choong.spr.controller.ex02;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choong.spr.domain.ex02.Book;

@Controller
@RequestMapping("ex02")
public class Ex02Controller {

	@Autowired

	@RequestMapping("sub01")
	public String mechod01() {
		return "hello";
	}

	@RequestMapping("sub02")
	@ResponseBody
	public String method02() {

		return "hello";
	}

	@RequestMapping("sub03")
	@ResponseBody
	public String method03() {

		return "{\"title\":\"java\", \"writer\":\"son\"}";
	}

	@RequestMapping("sub04")
	@ResponseBody
	public Book method04() {
		Book b = new Book();
		b.setTitle("spring");
		b.setWriter("son");

		return b;

	}

	@RequestMapping("sub05")
	public String method05() {
		return "/ex03/sub01";
	}

	@GetMapping("sub17")

	public ResponseEntity<String> method17() {

		return ResponseEntity.status(500).body("internal server error");

	}
	@GetMapping("sub18")
	public ResponseEntity<String> method18(){
		boolean success = Math.random() >0.5;
		
		if(success) {
			return ResponseEntity.ok().body("data you want");
		}else {
			return ResponseEntity.status(500).body("someting wrong");
		}
	}

}
