package org.bbs.dao.impl;

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

	

}
