package org.bbs.dao.impl;

import org.base.dao.BaseDaoImpl;
import org.bbs.dao.BoardDao;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl extends BaseDaoImpl<Board> implements BoardDao {

	 public Board findByName(String name,Category c){
			String hql = "FROM Board b where b.name = ? and b.category=?";
			Board b = (Board) this.queryObject(hql, new Object[] { name,c }, null);
			return b;
	 }

	@Override
	public Board findUp(long sort,Category c) {
		String hql = "From Board b where b.sort <? and b.category=? order by b.sort desc";
		Board Board= (Board)getSession().createQuery(hql).setParameter(0, sort).setParameter(1, c).setFirstResult(0).setMaxResults(1).uniqueResult();
		return Board;
	}

	@Override
	public Board findDown(long sort,Category c) {
		String hql = "From Board b where b.sort >? and b.category=? order by b.sort asc";
		Board Board= (Board)getSession().createQuery(hql).setParameter(0, sort).setParameter(1, c).setFirstResult(0).setMaxResults(1).uniqueResult();
		return Board;
	}

}
