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
			&raquo;&nbsp; 我的好友
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<FORM name="myform" 
					action="${pageContext.request.contextPath}/forum/user/my_friends_delete" method=post>
					<DIV class=mainbox style="padding-bottom: 5px">
						<H1>我的好友</H1>
						<UL class="tabs headertabs">
							<LI class="additem"><A
								href="${pageContext.request.contextPath}/forum/user/my_friends?action=add">添加好友</A>
							</LI>
							<LI class="current"><A
								href="${pageContext.request.contextPath}/forum/user/my_friends">我的好友</A>
							</LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0 width="100%">
							<THEAD>
								<TR>
									<TD class=selector>&nbsp;</TD>
									<TD>用户名</TD>
									<TD width="120">昵称</TD>
									<TD width="120">备注</TD>
									<TD class=time>加入时间</TD>
								</TR>
							</THEAD>
							<TBODY>
								<c:forEach items="${page.content }" var="friend"
								varStatus="status">
								<TR>
									<TD><INPUT class=checkbox type=checkbox
										value=${ friend.friend.username} name=friendName></TD>
									<TD><A
										href="${pageContext.request.contextPath}/forum/user/some_userInfo?id=${friend.friend.id}"
										target="_blank"><font color="green">${friend.friend.username }</font></A></TD>
									<TD>${friend.friend.nickname}</TD>
									<TD>${friend.remark}</TD>
									<TD><fmt:formatDate value="${friend.addDate}" type="both" /></TD>
								</TR>
							</c:forEach>
	
							</TBODY>
						</TABLE>
						<DIV class="management">
							<LABEL><INPUT class=checkbox id=chkall
								onclick=checkall(this.form) type=checkbox name=chkall>
								全选</LABEL>
							<BUTTON name=delfriends type=submit>删除</BUTTON>
						</DIV>
					</DIV>
				</FORM>
				<DIV class=pages_btns></DIV>
				<SCRIPT type=text/javascript>
					function validate(theform) {
						var hasCheckedID = false;
						if (typeof (theform.friendID) != "undefined") {
							if (typeof (theform.friendID.length) != "undefined") {
								for (i = 0; i < theform.friendID.length; i++) {
									if (theform.friendID[i].checked) {
										hasCheckedID = true;
										break;
									}
								}
							} else if (theform.friendID.checked)
								hasCheckedID = true;
						}
						if (!hasCheckedID) {
							alert("请至少选中一条记录");
							return false;
						}
						theform.submit();
					}
				</SCRIPT>
			</DIV>




			<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>