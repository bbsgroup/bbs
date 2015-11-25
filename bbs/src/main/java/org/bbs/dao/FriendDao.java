package org.bbs.dao;

import org.base.dao.BaseDao;
import org.base.entity.Page;
import org.bbs.entity.Friend;

public interface FriendDao extends BaseDao<Friend> {
		public Page<Friend> findByUserId(Long id);
		
		public void add(Friend friend);
		
		public Boolean delectFriend(Long id,String friendName);

		public Boolean exitfriend(Long id, String friendName);
		
}
