package org.bbs.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.bbs.entity.User;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "bbs_userInfo")
public class UserInfo {
	private Long userInfoId;
	private String  passwordQuestion;
	private String passwordAnswer;
	private Date loginTime;
	private Date lastLoginTime;
	private String Ip;
	private String lastIp;
	private Integer totalPost;
	private Integer totalGoodPost;
	private String PersonSign;
	private String heanImage;
	private User user;
	private boolean showSign = false;
	private boolean showHead = false;
	
	@Id
	@GeneratedValue
	public Long getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(Long userInfoId) {
		this.userInfoId = userInfoId;
	}
	public String getPasswordQuestion() {
		return passwordQuestion;
	}
	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}
	public String getPasswordAnswer() {
		return passwordAnswer;
	}
	public void setPasswordAnswer(String passwordAnswer) {
		this.passwordAnswer = passwordAnswer;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getIp() {
		return Ip;
	}
	public void setIp(String ip) {
		Ip = ip;
	}
	public String getLastIp() {
		return lastIp;
	}
	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}
	public Integer getTotalPost() {
		return totalPost;
	}
	public void setTotalPost(Integer totalPost) {
		this.totalPost = totalPost;
	}
	public Integer getTotalGoodPost() {
		return totalGoodPost;
	}
	public void setTotalGoodPost(Integer totalGoodPost) {
		this.totalGoodPost = totalGoodPost;
	}
	public String getPersonSign() {
		return PersonSign;
	}
	public void setPersonSign(String personSign) {
		PersonSign = personSign;
	}
	public String getHeanImage() {
		return heanImage;
	}
	public void setHeanImage(String heanImage) {
		this.heanImage = heanImage;
	}
	@OneToOne(fetch=FetchType.EAGER)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isShowSign() {
		return showSign;
	}
	public void setShowSign(boolean showSign) {
		this.showSign = showSign;
	}
	public boolean isShowHead() {
		return showHead;
	}
	public void setShowHead(boolean showHead) {
		this.showHead = showHead;
	}
	
	
	
}
