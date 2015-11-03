package org.bbs.entity;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 主题
 * 
 * @author huangxj
 *
 */
@Entity
@Table(name="bbs_topic")
public class Topic {
	private Long id;
	private User author;
	private Category category;
	private Board board;
	private String title;
	private int type;
	private Boolean status = Boolean.TRUE;
	private String content;
	private Date postTime;
	private String postIp;
	private long viewTimes;
	private long replyTimes;
	private Date lastReplyTime;
	private Boolean isHighlight = Boolean.FALSE;
	private String highlightReason;
	private String highlightUsername;
	private String titleColor;
	private Boolean isTop = Boolean.FALSE;
	private String topUsername;
	private String topReason;
	private Boolean isColse = Boolean.FALSE;
	private String colseUsername;
	private String colseReason;
	private Boolean sssence = Boolean.FALSE;
	private String essenceUsername;
	private String sssenceReason;
	private Date sssenceDate;
	private Boolean idDeleted = Boolean.FALSE;
	private String deleteUsername;
	private String deleteReason;
	private Date deleteTime;
	private String editUsername;
	private Date editTime;
	private Date voteEndTime;
	private List<VoteChoice> voteChoices = new LinkedList<VoteChoice>();
	private List<Attachment> attachments = new LinkedList<Attachment>();

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne
	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}
	@ManyToOne
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	@ManyToOne
	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	@Column(length = 16777216) 
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public String getPostIp() {
		return postIp;
	}

	public void setPostIp(String postIp) {
		this.postIp = postIp;
	}

	public long getViewTimes() {
		return viewTimes;
	}

	public void setViewTimes(long viewTimes) {
		this.viewTimes = viewTimes;
	}

	public long getReplyTimes() {
		return replyTimes;
	}

	public void setReplyTimes(long replyTimes) {
		this.replyTimes = replyTimes;
	}

	public Date getLastReplyTime() {
		return lastReplyTime;
	}

	public void setLastReplyTime(Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}

	public Boolean getIsHighlight() {
		return isHighlight;
	}

	public void setIsHighlight(Boolean isHighlight) {
		this.isHighlight = isHighlight;
	}

	public String getHighlightReason() {
		return highlightReason;
	}

	public void setHighlightReason(String highlightReason) {
		this.highlightReason = highlightReason;
	}

	public String getHighlightUsername() {
		return highlightUsername;
	}

	public void setHighlightUsername(String highlightUsername) {
		this.highlightUsername = highlightUsername;
	}

	public String getTitleColor() {
		return titleColor;
	}

	public void setTitleColor(String titleColor) {
		this.titleColor = titleColor;
	}

	public Boolean getIsTop() {
		return isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	public String getTopUsername() {
		return topUsername;
	}

	public void setTopUsername(String topUsername) {
		this.topUsername = topUsername;
	}

	public String getTopReason() {
		return topReason;
	}

	public void setTopReason(String topReason) {
		this.topReason = topReason;
	}

	public Boolean getIsColse() {
		return isColse;
	}

	public void setIsColse(Boolean isColse) {
		this.isColse = isColse;
	}

	public String getColseUsername() {
		return colseUsername;
	}

	public void setColseUsername(String colseUsername) {
		this.colseUsername = colseUsername;
	}

	public String getColseReason() {
		return colseReason;
	}

	public void setColseReason(String colseReason) {
		this.colseReason = colseReason;
	}

	public Boolean getSssence() {
		return sssence;
	}

	public void setSssence(Boolean sssence) {
		this.sssence = sssence;
	}

	public String getEssenceUsername() {
		return essenceUsername;
	}

	public void setEssenceUsername(String essenceUsername) {
		this.essenceUsername = essenceUsername;
	}

	public String getSssenceReason() {
		return sssenceReason;
	}

	public void setSssenceReason(String sssenceReason) {
		this.sssenceReason = sssenceReason;
	}

	public Date getSssenceDate() {
		return sssenceDate;
	}

	public void setSssenceDate(Date sssenceDate) {
		this.sssenceDate = sssenceDate;
	}

	public Boolean getIdDeleted() {
		return idDeleted;
	}

	public void setIdDeleted(Boolean idDeleted) {
		this.idDeleted = idDeleted;
	}

	public String getDeleteUsername() {
		return deleteUsername;
	}

	public void setDeleteUsername(String deleteUsername) {
		this.deleteUsername = deleteUsername;
	}

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public Date getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}

	public String getEditUsername() {
		return editUsername;
	}

	public void setEditUsername(String editUsername) {
		this.editUsername = editUsername;
	}

	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	public Date getVoteEndTime() {
		return voteEndTime;
	}

	public void setVoteEndTime(Date voteEndTime) {
		this.voteEndTime = voteEndTime;
	}

	@OneToMany
	public List<VoteChoice> getVoteChoices() {
		return voteChoices;
	}

	public void setVoteChoices(List<VoteChoice> voteChoices) {
		this.voteChoices = voteChoices;
	}

	@OneToMany
	@JoinTable(name = "bbs_topic_attachment", joinColumns = { @JoinColumn(name = "topic_id") }, inverseJoinColumns = { @JoinColumn(name = "attachment_id") })
	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

}
