package org.bbs.service;

import org.base.service.BaseService;
import org.bbs.entity.Board;
import org.bbs.entity.Category;

public interface BoardService extends BaseService<Board> {
    
	public abstract Board findByName(String name,Category c);
	

	public void moveUp(Long id,Category c);
	
	public void moveDown(Long id,Category c);
    
}