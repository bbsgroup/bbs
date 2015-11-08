package org.bbs.entity;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 论坛分区
 * 
 * @author huangxj
 *
 */
@Entity
@Table(name = "bbs_category")
public class Category implements Comparable<Category> {

	private Long id;

	private String name;

	private Boolean status = Boolean.TRUE;

	private String moderators;

	private long sort;

	private List<Board> boards = new LinkedList<Board>();


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

	public String getModerators() {
		return moderators;
	}

	public void setModerators(String moderators) {
		this.moderators = moderators;
	}

	public long getSort() {
		return sort;
	}

	public void setSort(long sort) {
		this.sort = sort;
	}

	@OneToMany(mappedBy = "category")
	public List<Board> getBoards() {
		Collections.sort(boards);
		return boards;
	}

	public void setBoards(List<Board> boards) {
		this.boards = boards;
	}

	@Override
	public int compareTo(Category arg) {
		if ((this.getSort() - arg.getSort()) > 0)
			return 1;
		if ((this.getSort() - arg.getSort()) == 0)
			return 0;
		return -1;

	}

}
