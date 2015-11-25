package org.bbs.service.impl;


import org.base.service.BaseServiceImpl;
import org.bbs.dao.UserDao;
import org.bbs.dao.UserInfoDao;
import org.bbs.entity.UserInfo;
import org.bbs.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo> implements
		UserInfoService {

    @Autowired
    private UserInfoDao userInfoDao;
	@Override
	public void addUserInfo(UserInfo userInfo) {
			userInfoDao.createUserInfo(userInfo);
	}
	@Override
	public UserInfo findByUserId(Long id) {
		
		UserInfo userInfo = userInfoDao.findByUserId( id);
		if(userInfo == null){
			return null;
		}
		return userInfo;
	}


}
