<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>我的话题 - 首页</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/member.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/ajax.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/md5.js"
	type=text/javascript></SCRIPT>
<SCRIPT
	src="${pageContext.request.contextPath}/media/js/jquery-1.10.0.js"
	type=text/javascript></SCRIPT>
<SCRIPT
	src="${pageContext.request.contextPath}/media/js/jquery.validate-1.13.1.js"
	type=text/javascript></SCRIPT>
</HEAD>
<BODY>

	<DIV class=wrap>

		<%@include file="head.jsp"%>
		<DIV id=nav>
			<A href="${pageContext.request.contextPath}/index">首页</A>
			&raquo;&nbsp; 我的权限
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<DIV class=mainbox>
					<H1>我的权限</H1>
					<UL class="tabs headertabs">
						<LI ><A
							href="${pageContext.request.contextPath}/forum/user/my_rights">我的权限</A></LI>
						<LI  class="dropmenu" style='BACKGROUND-POSITION: 95%'><A
							id=systemgroup onmouseover=showMenu(this.id) href="###"><b>系统用户组</b></A>
						</LI>
					</UL>
					<UL class="popmenu_popup headermenu_popup" id=systemgroup_menu
						style="DISPLAY: none">

						<LI><A href="${pageContext.request.contextPath}/forum/user/my_rights?gid=A">管理员</A></LI>

						<LI><A href="${pageContext.request.contextPath}/forum/user/my_rights?gid=S">超级版主</A></LI>

						<LI><A href="${pageContext.request.contextPath}/forum/user/my_rights?gid=M">版主</A></LI>

						<LI><A href="${pageContext.request.contextPath}/forum/user/my_rights?gid=G">游客</A></LI>

					</UL>
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<THEAD>
							<TR>
								<TD colSpan=2>用户组</TD>
							</TR>
						</THEAD>
						<TBODY>
							<TR>
								<TH width="25%">用户组名:</TH>
								<TD width="75%">管理员</TD>
							</TR>
							<TR>
								<TH>用户组级别:</TH>
								<TD><IMG alt="Rank: 9" src="${pageContext.request.contextPath}/media/images/star_5.gif"
									align="absmiddle" border="0"><IMG alt="Rank: 9"
									src="${pageContext.request.contextPath}/media/images/star_1.gif" align="absmiddle" border="0"><IMG
									alt="Rank: 9" src="${pageContext.request.contextPath}/media/images/star_1.gif" align="absmiddle"
									border="0"><IMG alt="Rank: 9" src="${pageContext.request.contextPath}/media/images/star_1.gif"
									align="absmiddle" border="0"><IMG alt="Rank: 9"
									src="${pageContext.request.contextPath}/media/images/star_1.gif" align="absmiddle" border="0">
								</TD>
							</TR>
						<THEAD>
							<TR>
								<TD colSpan=2>基本权限</TD>
							</TR>
						</THEAD>
						<TBODY>
							<TR>
								<TH>允许访问论坛:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许查看会员列表:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许查看用户信息:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许查看统计数据:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许使用高级搜索:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许上传头像:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
						<THEAD>
							<TR>
								<TD colSpan=2>帖子相关</TD>
							</TR>
						</THEAD>
						<TBODY>
							<TR>
								<TH>允许发新话题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发布悬赏主题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发布投票主题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发匿名贴:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发表回复:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许使用&nbsp;HTML&nbsp;代码:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发置顶帖子:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
						<THEAD>
							<TR>
								<TD colSpan=2>附件相关</TD>
							</TR>
						</THEAD>
						<TBODY>
							<TR>
								<TH>允许下载/查看附件:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许发布附件:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
						<THEAD>
							<TR>
								<TD colSpan=2>管理权限</TD>
							</TR>
						</THEAD>
						<TBODY>
							<TR>
								<TH>管理范围:</TH>
								<TD>全论坛</TD>
							</TR>

							<TR>
								<TH>允许全局置顶主题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许编辑帖子:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许删除帖子:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许关闭主题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许移动主题:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许编辑用户:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许执行积分奖惩:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许禁止用户:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许审核用户:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>
							<TR>
								<TH>允许删除用户:</TH>
								<TD><IMG src="${pageContext.request.contextPath}/media/images/check_right.gif"></TD>
							</TR>

						</TBODY>
					</TABLE>
				</DIV>
			</DIV>
			<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>