package com.choong.spr.controller.ex03;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.choong.spr.domain.ex02.Book;

@RequestMapping("ex03")
//@Controller
//@ResponseBody
@RestController //컨트롤러랑 리스폰스 바디 두 개를 한 번에 사용할 수 있게 하는 것.
public class Ex03Controller {

	@RequestMapping("sub01")

	public String method01() {
		return "string data";

	}
	
	@RequestMapping("sub02")
	public Book method02() {
		Book b = new Book();
		b.setTitle("soccer");
		b.setWriter("jimin");
		return b;
	}

	@RequestMapping("sub03")
	public String method03() {

		System.out.println("ex03/sub03 일함");
		return "hello ajax";
	}

	@RequestMapping("sub04")
	public String method04() {
		System.out.println("ex03/sub04일함");
		return "hello ajax";

	}

	@RequestMapping("sub05")
	public String method05() {
		System.out.println("ex03/sub05 get방식으로일함");
		return null;
	}

	@RequestMapping("sub06")
	public String method06() {
		System.out.println("ex03/sub06 post방식으로 일함");
		return null;
	}

	//	@RequestMapping(method = RequestMethod.DELETE, value = "sub07")
	@DeleteMapping("sub07")
	public String method07() {
		System.out.println("ex03/sub07 delete방식으로 일한댄다.");
		return null;
	}

	@PutMapping("sub08")
	public String method08() {
		System.out.println("ex03/sub08 put 방식 일함@@@@");

		return null;
	}

	@GetMapping("sub09")
	public String method09(String title, String writer) {
		System.out.println("##받은 데이터 ");
		System.out.println("title:" + title);
		System.out.println("writer:" + writer);

		return null;
	}

	@PostMapping("sub10")
	public String method10(String name, String address) {
		System.out.println("name:" + name);
		System.out.println("address:" + address);
		return "데이터 잘받았다";
	}

	@PostMapping("sub11")
	public void method11(Book book) {
		System.out.println(book);
		
	}
	@PostMapping("sub12")
	public String method12() {
		System.out.println("12번째 메소드 일함");
		return "hello";
	}
	@GetMapping("sub13")
	public Integer method13() {
	return (int) (Math.random() * 45 + 1);
	}
	@GetMapping("sub14")
	public Book method14() {
		Book b = new Book();
		b.setTitle("스프링");
		b.setWriter("홍길동");
		return b;
	}
	@GetMapping("sub15")
	public Map<String,String> method15(){
		Map<String,String> map = new HashMap<>();
		map.put("name", "손흥민");
		map.put("age", "30");
		map.put("address", "london");
		return map;
	}
}
