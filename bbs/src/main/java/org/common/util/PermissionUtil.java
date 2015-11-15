package org.common.util;

import org.bbs.common.Contants;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Group;
import org.bbs.entity.User;

public class PermissionUtil {

	public static boolean checkPermission(User user,Group group, Board board, String permission) {
		
		
		if (!group.getPermission().contains(permission)) {
			return false;
		} else {
			if (Contants.PERMIT_VISIT.equals(permission)) {
				
				if (board.getVisitGroups() != null) {
					String[] list = board.getVisitGroups().split(",");
					for (String item : list) {
						if (item.equals("" + group.getId()))

							return true;
					}
				}
				return false;
			}

			if (Contants.PERMIT_NEW_TOPIC.equals(permission)) {
				if (board.getTopicGroups() != null) {
					String[] list = board.getTopicGroups().split(",");
					for (String item : list) {

						return true;
					}
				}
				return false;
			}

			if (Contants.PERMIT_REPLY_TOPIC.equals(permission)) {
				if (board.getReplyGroups() != null) {
					String[] list = board.getReplyGroups().split(",");
					for (String item : list) {
						if (item.equals("" + group.getId()))

							return true;
					}
				}
				return false;
			}

			if (Contants.PERMIT_DOWNLOAD.equals(permission)) {
				
				if (board.getDownloadGroups() != null) {
					String[] list = board.getDownloadGroups().split(",");
					for (String item : list) {
						if (item.equals("" + group.getId()))
							return true;
					}
				}
				return false;
			}

			if (Contants.PERMIT_UPLOAD.equals(permission)) {
				if (board.getDownloadGroups() != null) {
					String[] list = board.getDownloadGroups().split(",");
					for (String item : list) {
						if (item.equals("" + group.getId()))
							return true;
					}
				}
				return false;
			}

			if (Contants.PERMIT_TOP_POST.equals(permission)) {
				if (!isModerator(user, board))
					return false;

			}

			if (Contants.PERMIT_EDIT_POST.equals(permission)) {
				if (!isModerator(user, board))
					return false;
			}

			if (Contants.PERMIT_DELETE_POST.equals(permission)) {
				if (!isModerator(user, board))
					return false;
			}

		}

		return true;

	}

	public static boolean isModerator(User user, Board board) {
		
		
		if(user==null){
			return false;
		}
		
		
		Group group = user.getGroup();
		Category category = board.getCategory();
		String[] list1 = category.getModerators().split(",");
		String[] list2 = board.getModerators().split(",");
		if (group.getId() == 6||group.getId()==5) // 管理员
			return true;
		for(String item:list1){
			if (item.equals(user.getUsername()))
				return true;
		}
		for(String item:list2){
			if (item.equals(user.getUsername()))
				return true;
		}
	

		return false;
	}

}
