package org.bbs.service;

import java.util.Date;

import org.base.entity.Page;
import org.base.service.BaseService;
import org.bbs.entity.Message;
import org.bbs.entity.User;

public interface MessageService extends BaseService<Message> {
	public Boolean sendMessage(User receiver,User sender, String title, String Content,
			Date date);

	public Boolean remove_outbox_msg(Long sender_id, Long msg_id);

	public Boolean remove_inbox_msg(Long receiver_id, Long msg_id);
	
	public Boolean hadReadMessage(Long receiver_id, Long msg_id);
	
	public Page<Message> findBySender(Long sender_id);
	
	public Page<Message> findByReceiver(Long receiver_id);
}
