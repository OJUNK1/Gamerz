package co.yedam.gamerz.commnunity.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommunityVO {
	private int postId;
	private String postTitle;
	private String postSubject;
	private String postWriter;
	private int postHit;
}
