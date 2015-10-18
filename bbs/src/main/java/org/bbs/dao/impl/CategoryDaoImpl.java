package org.bbs.dao.impl;

import org.base.dao.BaseDaoImpl;
import org.bbs.dao.CategoryDao;
import org.bbs.entity.Category;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl extends BaseDaoImpl<Category> implements CategoryDao {

	 public Category findByName(String name){
			String hql = "FROM Category c where c.name = ?";
			Category c = (Category) this.queryObject(hql, new Object[] { name }, null);
			return c;
	 }

	@Override
	public Category findUp(long sort) {
		String hql = "From Category c where c.sort <? order by c.sort desc";
		Category category= (Category)getSession().createQuery(hql).setParameter(0, sort).setFirstResult(0).setMaxResults(1).uniqueResult();
		return category;
	}

	@Override
	public Category findDown(long sort) {
		String hql = "From Category c where c.sort >? order by c.sort asc";
		Category category= (Category)getSession().createQuery(hql).setParameter(0, sort).setFirstResult(0).setMaxResults(1).uniqueResult();
		return category;
	}
	
	
}
