package org.bbs.service;

import org.base.entity.Page;
import org.bbs.entity.Friend;

public interface FriendService {
	public Page<Friend> findByUserId(Long id);
	
	public Boolean addFriend(Long id, String friendname ,String remark);
	
	public Boolean delectFriends(Long id,String friendName);
	
	public Boolean exitfriend(Long id,String friendName);
}
