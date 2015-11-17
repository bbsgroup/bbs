package org.bbs.service;

import org.base.entity.Page;
import org.base.service.BaseService;
import org.bbs.entity.Reply;
import org.bbs.entity.Topic;

public interface ReplyService extends BaseService<Reply> {

	public Page<Reply> findReplyByTopic(Topic topic);

	public long getMaxFloor(Topic topic);
	
	public Page<Reply> findReplyByUserId(Long id);

}