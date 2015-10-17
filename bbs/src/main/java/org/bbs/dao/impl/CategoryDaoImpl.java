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
	public Category findUp(Long id) {
		String hql = "from category c where c.sort <? ";
		
		return null;
	}

	@Override
	public Category findDown(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
}
