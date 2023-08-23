package co.yedam.gamerz.support.req.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReqVO {
	private int reqId;
	private String reqWriter;
	private String reqWriterId;
	private String reqTitle;
	private String reqSubject;
	private LocalDate reqDate;
	private String reqDone;
}
