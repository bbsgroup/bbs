package org.bbs.dao;

import java.util.List;

import org.base.dao.BaseDao;
import org.base.entity.Page;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Topic;

public interface TopicDao extends BaseDao<Topic> {

	public List<Topic> findTopAll();

	public List<Topic> findTopCategory(Category c);

	public List<Topic> findTopBoard(Board board);
	
	public Page<Topic> findTopicByBoard(Board board);

}