package com.ani.vo;

import java.util.List;

public class MemberBoardVO {
	
	private String board_no = null;
	private String board_title = null;
	private String board_member_nickname = null;
	private String board_comment = null;
	private String board_date = null;
	private int board_cnt = 0;
	private String[] board_file = null;
	
	//private List<String> memberBoard_files = null;
	
	
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_member_nickname() {
		return board_member_nickname;
	}
	public void setBoard_member_nickname(String board_member_nickname) {
		this.board_member_nickname = board_member_nickname;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
	
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getBoard_cnt() {
		return board_cnt;
	}
	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}
	public String[] getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String[] board_file) {
		this.board_file = board_file;
	}
	
	/*
	public List<String> getMemberBoard_files() {
		return memberBoard_files;
	}
	public void setMemberBoard_files(List<String> memberBoard_files) {
		this.memberBoard_files = memberBoard_files;
	}
	*/
	
	

}
