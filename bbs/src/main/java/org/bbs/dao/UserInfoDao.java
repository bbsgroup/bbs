package org.bbs.dao;

import org.base.dao.BaseDao;
import org.bbs.entity.UserInfo;

public interface UserInfoDao extends BaseDao<UserInfo> {

	void add(UserInfo userInfo);

}
