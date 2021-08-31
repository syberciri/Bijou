package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {

	public int member_idx;
	public String member_id;
	public String member_pw;
	public String member_name;
	public String member_email;
	public String member_phone;
	public String member_address;
	public String member_gender;
	public Date member_birthdate;
	public Date member_joindate;
	
	public MemberDto() {
		
	}

	public MemberDto(int member_idx, String member_id, String member_pw, String member_name, String member_email,
			String member_phone, String member_address, String member_gender, Date member_birthdate,
			Date member_joindate) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_gender = member_gender;
		this.member_birthdate = member_birthdate;
		this.member_joindate = member_joindate;
	}
	
	
}
