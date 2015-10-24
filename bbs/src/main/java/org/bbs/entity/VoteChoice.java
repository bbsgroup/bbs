package org.bbs.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 回复
 * @author huangxj
 */

@Entity
@Table(name="bbs_voteChoice")
public class VoteChoice {
	private Long id;
	private String contet;
	private int num;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContet() {
		return contet;
	}

	public void setContet(String contet) {
		this.contet = contet;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
