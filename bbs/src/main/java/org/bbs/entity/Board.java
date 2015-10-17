package org.bbs.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 论坛版块
 * @author huangxj
 *
 */

public class Board {
	
	private Long id;
	
	private String name;
	
	private Boolean status=Boolean.TRUE;

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
	
	

}
