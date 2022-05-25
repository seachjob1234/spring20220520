package com.choong.spr.domain;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class MemberDto {
	public String id;
	public String password;
	public String email;
	public String nickName;
	public LocalDateTime inserted;
	
}
