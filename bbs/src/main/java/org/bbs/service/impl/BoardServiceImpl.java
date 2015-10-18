package org.bbs.service.impl;

import org.base.service.BaseServiceImpl;
import org.bbs.dao.BoardDao;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl extends BaseServiceImpl<Board> implements BoardService {

    @Autowired
    private BoardDao boardDao;
	@Override
	public Board findByName(String name,Category c) {
		
		return boardDao.findByName(name, c);
	}
	@Override
	public void moveUp(Long id,Category c) {
		Board src = boardDao.get(id);
		Board tag = boardDao.findUp(src.getSort(),c);
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
	public void moveDown(Long id,Category c) {
		
		Board src = boardDao.get(id);
		Board tag = boardDao.findDown(src.getSort(),c);
		
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
	public void add(Board t) {
		super.add(t);
		t.setSort(t.getId());
	}
	
	
 
}
