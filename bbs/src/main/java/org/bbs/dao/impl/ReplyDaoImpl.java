package org.bbs.dao.impl;

import org.base.dao.BaseDaoImpl;
import org.base.entity.Page;
import org.bbs.dao.ReplyDao;
import org.bbs.entity.Reply;
import org.bbs.entity.Topic;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDaoImpl extends BaseDaoImpl<Reply> implements ReplyDao {

	@Override
	public Page<Reply> findReplyByTopic(Topic topic) {
		String hql = "from Reply r where r.topic = ?";
		return this.findPage(hql, topic);
	
	}

	@Override
	public long getMaxFloor(Topic topic) {
		String hql = "select max(r.floor) from Reply r where r.topic = ?";
		Long count = this.count(hql, new Object[]{topic});
		if(count==null){
			return 0;
		}
		return count;
	}


}
