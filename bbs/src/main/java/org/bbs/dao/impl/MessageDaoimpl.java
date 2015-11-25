package org.bbs.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.base.dao.BaseDaoImpl;
import org.base.entity.Page;
import org.bbs.dao.MessageDao;
import org.bbs.entity.Message;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoimpl extends BaseDaoImpl<Message> implements MessageDao {

	@Override
	public Message findMessageBySender(Long sender_id, Long msg_id) {
		String hql = "from Message m where m.sender.id = ? and m.id = ?";
		List<Object> list =  new ArrayList<Object>();
		list.add(sender_id);
		list.add(msg_id);
		Message message = this.get(hql, list);
		if(message!=null){
			return message;
		}
		return null;
	}

	@Override
	public Page<Message> findBySender(Long sender_id) {
		String hql = "from Message m where m.sender.id = ? and m.outbox_show = true";
		return this.findPage(hql, sender_id);
	}

	@Override
	public Page<Message> findByReceiver(Long receiver_id) {
		String hql = "from Message m where m.receiver.id = ? and m.inbox_show = true";
		return this.findPage(hql, receiver_id);
	}

	@Override
	public Message findMessageByReceriver(Long receiver_id, Long msg_id) {
		String hql = "from Message m where m.receiver.id = ? and m.id = ?";
		List<Object> list =  new ArrayList<Object>();
		list.add(receiver_id);
		list.add(msg_id);
		Message message = this.get(hql, list);
		if(message!=null){
			return message;
		}
		return null;
	}

	
}
