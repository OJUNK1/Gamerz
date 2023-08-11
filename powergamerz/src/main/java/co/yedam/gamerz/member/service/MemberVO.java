package co.yedam.gamerz.member.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private LocalDate memberBirth;
	private String memberTel;
	private String memberAddress;
	private String memberEmail;
	private LocalDate memberEdate;
	private String memberAuthor;
}
