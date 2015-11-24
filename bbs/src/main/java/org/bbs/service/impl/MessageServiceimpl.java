package org.bbs.service.impl;

import java.util.Date;

import org.base.entity.Page;
import org.base.service.BaseServiceImpl;
import org.bbs.dao.MessageDao;
import org.bbs.entity.Message;
import org.bbs.entity.User;
import org.bbs.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageServiceimpl extends BaseServiceImpl<Message> implements
		MessageService {

	@Autowired
	private MessageDao messageDao;

	@Override
	public Boolean sendMessage(User receiver, User sender, String title,
			String Content, Date date) {
		Message message = new Message();
		message.setSender(sender);
		message.setReceiver(receiver);
		message.setContent(Content);
		message.setTitle(title);
		message.setSendDate(date);
		messageDao.save(message);
		return true;
	}

	@Override
	public Boolean remove_outbox_msg(Long sender_id, Long msg_id) {
		Message message = messageDao.findMessageBySender(sender_id, msg_id);
		if (message != null) {
			message.setOutbox_show(false);
			messageDao.update(message);
			return true;
		} else {
			return false;
		}

	}

	@Override
	public Boolean remove_inbox_msg(Long receiver_id, Long msg_id) {
		Message message = messageDao
				.findMessageByReceriver(receiver_id, msg_id);
		if (message != null) {
			message.setInbox_show(false);
			messageDao.update(message);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean hadReadMessage(Long receiver_id, Long msg_id) {
		Message message = messageDao
				.findMessageByReceriver(receiver_id, msg_id);
		if (message != null) {
			message.setHadread(true);
			messageDao.update(message);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Page<Message> findBySender(Long sender_id) {
		return messageDao.findBySender(sender_id);
	}

	@Override
	public Page<Message> findByReceiver(Long receiver_id) {
		return messageDao.findByReceiver(receiver_id);
	}

}
