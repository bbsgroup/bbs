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
	public void moveUp(Long id) {
		Category src = categoryDao.get(id);
		Category tag = categoryDao.findUp(src.getSort());
		if(src==null||tag==null){
			return;
		}
		long temp = src.getSort();
		src.setSort(tag.getSort());
		tag.setSort(temp);
		this.update(src);
		this.update(tag);
		
	}
	@Override
	public void moveDown(Long id) {
		Category src = categoryDao.get(id);
		Category tag = categoryDao.findDown(src.getSort());
		if(src==null||tag==null){
			return;
		}
		long temp = src.getSort();
		src.setSort(tag.getSort());
		tag.setSort(temp);
		this.update(src);
		this.update(tag);
		
	}
	@Override
	public void add(Category t) {
		super.add(t);
		t.setSort(t.getId());
	}
	
	
 
}
