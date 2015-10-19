package baseProject;

import org.base.entity.Page;
import org.bbs.dao.UserInfoDao;
import org.bbs.entity.UserInfo;
import org.bbs.service.UserInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class TestUserInfoDao {

	@Autowired
	UserInfoService ser;

	@Autowired
	UserInfoDao dao;

	@Test
	public void testFindByUserId( ) {
		Long  id = new Long(5);
		UserInfo userInfo =dao.findByUserId(id);
		if(userInfo==null){
			System.out.println("userInfo is null");
		}else 
		System.out.println(userInfo.getUserInfoId());
	}

	

}