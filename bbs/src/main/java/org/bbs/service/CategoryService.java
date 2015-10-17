package org.bbs.service;

import org.base.service.BaseService;
import org.bbs.entity.Category;

public interface CategoryService extends BaseService<Category> {
    
	public abstract Category findByName(String name);
	
	public abstract void moveUp();
	
	public abstract void moveDown();
    
}