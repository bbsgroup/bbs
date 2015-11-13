package org.bbs.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 回复
 * 
 * @author huangxj
 *
 */
@Entity
@Table(name = "bbs_reply")
public class Reply {
	private Long id;
	private Topic topic;
	private String content;
	private User author;
	private Date time;
	private long floor = 0;
	private Boolean status = Boolean.TRUE;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne
	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne
	public User getAuthor() {
		return author;
	}

	public void setAuthor(User autor) {
		this.author = author;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public long getFloor() {
		return floor;
	}

	public void setFloor(long floor) {
		this.floor = floor;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	

}
