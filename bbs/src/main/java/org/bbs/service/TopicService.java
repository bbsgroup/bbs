package org.bbs.service;

import java.util.List;

import org.base.entity.Page;
import org.base.service.BaseService;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Topic;

public interface TopicService extends BaseService<Topic> {
    

	public List<Topic> findTopAll();

	public List<Topic> findTopCategory(Category c);

	public List<Topic> findTopBoard(Board board);
	
	public Page<Topic> findTopicByBoard(Board board);
	
	public Page<Topic> findTopicByUserId(Long id);
    
}