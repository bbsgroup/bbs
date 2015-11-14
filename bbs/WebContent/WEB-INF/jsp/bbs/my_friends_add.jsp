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
				<FORM name="friendform" onSubmit="return validate(this)"
					action="../perform.jsp?act=member_friend_add" method=post>
					<DIV class=mainbox>
						<H1>我的好友</H1>
						<UL class="tabs">
							<LI  class="current additem"><A href="${pageContext.request.contextPath}/forum/user/my_friends?action=add">添加好友</A>
							</LI>
							<LI ><A href="${pageContext.request.contextPath}/forum/user/my_friends">我的好友</A></LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0>
							<TBODY>
								<TR>
									<TH><LABEL for=friendID>用户名</LABEL></TH>
									<TD><INPUT id=friendID tabIndex=1 size=50 name=friendID
										maxlength="15" value=""></TD>
								</TR>
								<TR>
									<TH><LABEL for=remark>备注</LABEL></TH>
									<TD><INPUT id=remark tabIndex=2 size=50 name=remark
										maxlength="50" value=""></TD>
								</TR>
								<TR class=btns>
									<TH>&nbsp;</TH>
									<TD height="30"><BUTTON class=submit id=postsubmit
											tabIndex=7 name=postsubmit type=submit>提交</BUTTON></TD>
								</TR>
							</TBODY>
						</TABLE>
					</DIV>
				</FORM>
				<SCRIPT type=text/javascript>
					function validate(theform) {
						if (trim(theform.friendID.value) == '') {
							alert("请输入好友的用户名。");
							theform.friendID.focus();
							return false;
						}
						return true;
					}
				</SCRIPT>
			</DIV>
			<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>