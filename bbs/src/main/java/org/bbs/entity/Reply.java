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
@Table(name="bbs_reply")
public class Reply {
	private Long id;
	private Topic topic;
	private String content;
	private Reply parent;
	private User autor;
	private Date time;
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
	public Reply getParent() {
		return parent;
	}
	public void setParent(Reply parent) {
		this.parent = parent;
	}
	@ManyToOne
	public User getAutor() {
		return autor;
	}
	public void setAutor(User autor) {
		this.autor = autor;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	

}
