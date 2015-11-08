package org.bbs.dao.impl;

import java.util.List;

import org.base.dao.BaseDaoImpl;
import org.base.entity.Page;
import org.bbs.dao.TopicDao;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Topic;
import org.springframework.stereotype.Repository;

@Repository
public class TopicDaoImpl extends BaseDaoImpl<Topic>implements TopicDao {

	@Override
	public List<Topic> findTopAll() {
		String hql = "from Topic t where t.topType = 3";
		return this.list(hql);
	}

	@Override
	public List<Topic> findTopCategory(Category c) {
		String hql = "from Topic t where t.topType = 2 and t.category = ?";
		return this.list(hql, c);
	}

	@Override
	public List<Topic> findTopBoard(Board board) {
		String hql = "from Topic t where t.topType = 1 and t.board = ?";
		return this.list(hql, board);
	}

	@Override
	public Page<Topic> findTopicByBoard(Board board) {
		String hql = "from Topic t where t.board = ? and t.topType = 0";
		return this.findPage(hql, board);
	}

}
