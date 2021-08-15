package com.jhta.neocom.model;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


import org.springframework.stereotype.Component;





@Component
public class MemberVo {
	int mem_no;
	@NotBlank(message = "필수입력 값입니다.")
	String nickname;
	@NotBlank(message = "필수입력 값입니다.")
	String phone;
	@NotBlank(message = "필수입력 값입니다.")
	String birth_date;
	String reg_date;
	
	@NotBlank(message = "필수입력 값입니다.")
	String name;
	
	@NotBlank
	@Size(min=4, max=8, message="아이디는 4~8자리이어야 합니다.")
	String id;
	@NotBlank
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
    message = "영문 대,소문자와 숫자, 특수기호 1 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다")
	String password;
	
	
	
	public int getMem_no() {
		return mem_no;
	}
	public String getNickname() {
		return nickname;
	}
	public String getPhone() {
		return phone;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "MemberVo [mem_no=" + mem_no + ", nickname=" + nickname + ", phone=" + phone + ", birth_date="
				+ birth_date + ", reg_date=" + reg_date + ", name=" + name + ", id=" + id + ", password=" + password
				+ "]";
	}
	
}
