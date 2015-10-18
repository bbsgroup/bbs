package org.bbs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 论坛版块
 * 
 * @author huangxj
 *
 */
@Entity
@Table(name = "bbs_board")
public class Board implements Comparable<Board> {

	private Long id;

	private String name;

	private Boolean status = Boolean.TRUE;

	private Category category;

	private String moderators;

	private long sort;

	private String description;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@ManyToOne
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(length = 200)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getSort() {
		return sort;
	}

	public void setSort(long sort) {
		this.sort = sort;
	}

	@Override
	public int compareTo(Board arg) {
		if ((this.getSort() - arg.getSort()) > 0)
			return 1;
		if ((this.getSort() - arg.getSort()) == 0)
			return 0;
		return -1;

	}

	public String getModerators() {
		return moderators;
	}

	public void setModerators(String moderators) {
		this.moderators = moderators;
	}

}
