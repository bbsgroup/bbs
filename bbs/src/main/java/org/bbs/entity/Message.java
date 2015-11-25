package org.bbs.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bbs_message")
public class Message {
	private Long id;
	private User receiver;
	private User sender;
	private String title;
	private String content;
	private Boolean hadread = Boolean.FALSE;
	private Boolean inbox_show = Boolean.TRUE;
	private Boolean outbox_show = Boolean.TRUE;
	private Date sendDate;
 
	public Boolean getInbox_show() {
		return inbox_show;
	}

	public void setInbox_show(Boolean inbox_show) {
		this.inbox_show = inbox_show;
	}

	public Boolean getOutbox_show() {
		return outbox_show;
	}

	public void setOutbox_show(Boolean outbox_show) {
		this.outbox_show = outbox_show;
	}


	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@OneToOne(fetch = FetchType.EAGER)
	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	@OneToOne(fetch = FetchType.EAGER)
	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getHadread() {
		return hadread;
	}

	public void setHadread(Boolean hadread) {
		this.hadread = hadread;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

}
