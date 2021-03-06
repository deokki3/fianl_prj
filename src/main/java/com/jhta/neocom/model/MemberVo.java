package com.jhta.neocom.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//주석

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "member_Info")
public class MemberVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	// private int mem_id;
	private int mem_no;
	@NotBlank(message = "필수입력 값입니다.")
	private String nickname;
	@NotBlank(message = "필수입력 값입니다.")
	private String phone;
	@NotBlank(message = "필수입력 값입니다.")
	private String birth_date;
	private String reg_date;

	@NotBlank(message = "필수입력 값입니다.")
	private String name;
	@NotBlank(message = "필수입력 값입니다.")
	@Email(message = "이메일형식이 틀립니다.")
	private String email;
	@NotBlank(message = "필수입력 값입니다.")
	@Size(min = 4, max = 12, message = "아이디는 4~12자리이어야 합니다.")
	private String id;
	@NotBlank(message = "필수입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{6,12}",
    message = "비밀번호는 영문자와 숫자, 특수기호가 포함된 6자~12자의 비밀번호여야 합니다.")
	private String password;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "member_Info_member_role", joinColumns = @JoinColumn(name = "mem_no"), inverseJoinColumns = @JoinColumn(name = "fno"))
	private Set<MemberRole> roles = new HashSet<>();
}
