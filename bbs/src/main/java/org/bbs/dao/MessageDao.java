package org.bbs.dao;

import org.base.dao.BaseDao;
import org.base.entity.Page;
import org.bbs.entity.Message;

public interface MessageDao extends BaseDao<Message> {


	public Message findMessageBySender(Long sender_id, Long msg_id);

	public Message findMessageByReceriver(Long receiver_id, Long msg_id);

	public Page<Message> findBySender(Long sender_id);

	public Page<Message> findByReceiver(Long receiver_id);

}
