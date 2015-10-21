package org.bbs.dao.impl;

import java.util.List;

import org.base.dao.BaseDaoImpl;
import org.bbs.dao.UserInfoDao;
import org.bbs.entity.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDaoImpl extends BaseDaoImpl<UserInfo> implements
		UserInfoDao {

	@Override
	public void createUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		this.save(userInfo);
	}

	@Override
	public UserInfo findByUserId(Long id) {
		String hql = "from UserInfo u where u.user.id = ?";
		List<UserInfo> userInfo = this.list(hql, id);
			return userInfo.get(0);
	}

}
