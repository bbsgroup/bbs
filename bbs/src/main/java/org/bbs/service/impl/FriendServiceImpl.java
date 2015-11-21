package org.bbs.service.impl;

import java.util.Date;

import org.base.entity.Page;
import org.base.service.BaseServiceImpl;
import org.bbs.dao.FriendDao;
import org.bbs.dao.UserDao;
import org.bbs.entity.Friend;
import org.bbs.entity.User;
import org.bbs.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FriendServiceImpl extends BaseServiceImpl<Friend> implements
		FriendService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private FriendDao friendDao;

	@Override
	public Boolean exitfriend(Long id, String friendName) {
		return friendDao.exitfriend(id, friendName);
	}

	@Override
	public Page<Friend> findByUserId(Long id) {
		return friendDao.findByUserId(id);
	}

	@Override
	public Boolean addFriend(Long id, String friendname, String remark) {
		User master = userDao.get(id);
		User Friend = userDao.findByUsername(friendname);
		if (Friend == null) {
			return false;
		}
		Friend friend = new Friend();
		friend.setFriend(Friend);
		friend.setRemark(remark);
		friend.setMaster(master);
		friend.setAddDate(new Date());
		friendDao.add(friend);
		return true;
	}

	@Override
	public Boolean delectFriends(Long id, String friendName) {
		return friendDao.delectFriend(id, friendName);
	}

}
