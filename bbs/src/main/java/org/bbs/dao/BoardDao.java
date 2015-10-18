package org.bbs.dao;



import org.base.dao.BaseDao;
import org.bbs.entity.Board;
import org.bbs.entity.Category;

public interface BoardDao extends BaseDao<Board> {
    
	 public Board findByName(String name,Category c);
	 
	 public Board findUp(long sort,Category c);
	 
	 public Board findDown(long sort,Category c);
	 
}