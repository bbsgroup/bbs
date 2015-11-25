package baseProject;

import org.bbs.dao.FriendDao;
import org.bbs.dao.UserDao;
import org.bbs.entity.Friend;
import org.bbs.entity.User;
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
public class TestFriendDao {

	@Autowired
	UserDao userdao;
	
	@Autowired
	FriendDao dao;
	
	@Test
	public void addByUser() {
		Friend friend = new Friend();
		friend.setFriend(userdao.get(new Long(2)));
		friend.setRemark("a君");
		User master = userdao.findByUsername("clf");
		friend.setMaster(master);
		dao.add(friend);
	}
}
