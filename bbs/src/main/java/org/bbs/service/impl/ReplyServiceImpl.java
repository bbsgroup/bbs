package org.bbs.service.impl;

import org.base.entity.Page;
import org.base.service.BaseServiceImpl;
import org.bbs.dao.ReplyDao;
import org.bbs.entity.Reply;
import org.bbs.entity.Topic;
import org.bbs.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReplyServiceImpl extends BaseServiceImpl<Reply>implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public Page<Reply> findReplyByTopic(Topic topic) {

		return replyDao.findReplyByTopic(topic);
	}

	@Override
	public Page<Reply> findReplyByUserId(Long id) {
		
		return replyDao.findReplyByUserId(id);
	}

	@Override
	public long getMaxFloor(Topic topic) {
	
		return replyDao.getMaxFloor(topic);
	}

}
