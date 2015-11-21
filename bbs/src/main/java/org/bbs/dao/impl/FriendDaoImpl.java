package org.bbs.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.base.dao.BaseDaoImpl;
import org.base.entity.Page;
import org.bbs.dao.FriendDao;
import org.bbs.entity.Friend;
import org.bbs.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDaoImpl extends BaseDaoImpl<Friend> implements FriendDao {

	@Override
	public Page<Friend> findByUserId(Long id) {
		String hql = "from Friend f where f.master.id = ? ";
		return this.findPage(hql, id);
	}

	@Override
	public void add(Friend friend) {
		this.save(friend);
	}

	@Override
	public Boolean delectFriend(Long id, String friendName) {
		String hql = "from Friend f where f.master.id = ? and f.friend.username= ?";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		list.add(friendName);
		Friend friend = this.get(hql, list);
		if(friend!=null){
			this.delete(friend);
			return true;
		}
		return false;
	}

	@Override
	public Boolean exitfriend(Long id, String friendName) {
		String hql = "from Friend f where f.master.id = ? and f.friend.username= ?";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		list.add(friendName);
		Friend friend = this.get(hql, list);
		if(friend!=null){
			return true;
		}
		return false;
		
	}
	
	
}

