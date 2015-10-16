package org.bbs.dao;



import org.base.dao.BaseDao;
import org.bbs.entity.Category;
import org.bbs.entity.User;

public interface CategoryDao extends BaseDao<Category> {
    
	 public Category findByName(String name);
}