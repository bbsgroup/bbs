package org.bbs.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 附件
 * @author huangxj
 *
 */
@Entity
@Table(name="bbs_attachment")
public class Attachment {
	private Long id;
	private String filename;
	private String filepath;
	private int downloadTimes=0;
	private long size;
	private String description;
	private Topic topic;
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getDownloadTimes() {
		return downloadTimes;
	}
	public void setDownloadTimes(int downloadTimes) {
		this.downloadTimes = downloadTimes;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@ManyToOne(targetEntity=Topic.class,cascade=CascadeType.ALL)  
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	

}
