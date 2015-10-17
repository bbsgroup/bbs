package org.bbs.service.impl;

import org.base.service.BaseServiceImpl;
import org.bbs.dao.CategoryDao;
import org.bbs.entity.Category;
import org.bbs.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;
	@Override
	public Category findByName(String name) {
		
		return categoryDao.findByName(name);
	}
	@Override
	public void moveUp() {
		
		
	}
	@Override
	public void moveDown() {
		
		
	}
 
}
