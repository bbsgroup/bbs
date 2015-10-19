package org.bbs.service;

import org.base.service.BaseService;
import org.bbs.entity.UserInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public interface UserInfoService extends BaseService<UserInfo> {

	void addUserInfo(UserInfo userInfo);

	UserInfo findByUserId(Long id);

}
