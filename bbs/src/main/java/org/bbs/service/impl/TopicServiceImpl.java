package org.bbs.service.impl;

import java.util.List;

import org.base.entity.Page;
import org.base.service.BaseServiceImpl;
import org.bbs.dao.TopicDao;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Topic;
import org.bbs.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService {
	
	
    @Autowired
    private TopicDao topicDao;
    
	@Override
	public List<Topic> findTopAll() {
		return topicDao.findTopAll();
	}

	@Override
	public List<Topic> findTopCategory(Category c) {
		return topicDao.findTopCategory(c);
	}

	@Override
	public Page<Topic> findTopicByUserId(Long id) {
		// TODO Auto-generated method stub
		return topicDao.findTopicByUserId(id);
	}

	@Override
	public List<Topic> findTopBoard(Board board) {
		return topicDao.findTopBoard(board);
	}

	@Override
	public Page<Topic> findTopicByBoard(Board board) {
		return topicDao.findTopicByBoard(board);
	}

    
	
 
}
