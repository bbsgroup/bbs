package baseProject;

import org.bbs.dao.MessageDao;
import org.bbs.service.MessageService;
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
public class TestMessageSerivce {
	@Autowired
	MessageDao messageDao;
	
	@Autowired
	MessageService messageService;
	
	@Test
	public void testRemove_inbox_msg( ) {
		System.out.println(messageService.remove_inbox_msg(new Long(4), new Long(5)));
		System.out.println(messageService.remove_outbox_msg(new Long(4), new Long(5)));
	}
}
