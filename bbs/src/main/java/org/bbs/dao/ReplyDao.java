package org.bbs.dao;

import org.base.dao.BaseDao;
import org.base.entity.Page;
import org.bbs.entity.Reply;
import org.bbs.entity.Topic;

public interface ReplyDao extends BaseDao<Reply> {
    
	public Page<Reply> findReplyByTopic(Topic topic);
	
	public long getMaxFloor(Topic topic);
}