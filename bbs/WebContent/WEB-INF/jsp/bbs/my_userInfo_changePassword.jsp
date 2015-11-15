<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">







<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>编辑个人资料 - 修改密码</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
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
		<A href="${pageContext.request.contextPath}/index">首页</A>&raquo;&nbsp;
		编辑个人资料
		<DIV class=container>
			<DIV class=content>
				<SCRIPT type=text/javascript>
					var charset = 'gbk';
					function validate(theform) {
						if (trim(theform.oldpwd1.value) == '') {
							alert('请输入原密码');
							theform.oldpwd1.focus();
							return false;
						}
						var pwd = trim(theform.pwd1.value);
						if (pwd == '') {
							alert('新密码不能为空');
							theform.pwd1.focus();
							return false;
						}
						var pwd2 = trim(theform.pwd2.value);
						if (pwd != pwd2) {
							alert('两次输入的密码必须相同');
							theform.pwd2.focus();
							return false;
						}
						return true;
					}
				</SCRIPT>
				<FORM name="settings" onSubmit="return validate(this)"
					action="${pageContext.request.contextPath}/forum/user/resetPassword" method=post>
					<DIV class="mainbox formbox">
						<H1>编辑个人资料</H1>
						<UL class="tabs">
							<LI class=current><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=changePassword">修改密码</A></LI>
							<LI ><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=edit">基本资料</A></LI>
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=personal">个性化资料</A></LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0>
							<TBODY>
								<TR>
									<TD class=altbg1><SPAN class=bold>原密码</SPAN></TD>
									<TD class=altbg2><INPUT type=password size=25 name=oldpwd1><INPUT
										type=hidden name=oldpwd></TD>
								</TR>
								<TR>
									<TD class=altbg1><SPAN class=bold>新密码</SPAN></TD>
									<TD class=altbg2><INPUT type=password size=25 name=pwd1><INPUT
										type=hidden name=pwd></TD>
								</TR>
								<TR>
									<TD class=altbg1><SPAN class=bold>确认新密码</SPAN></TD>
									<TD class=altbg2><INPUT type=password size=25 name=pwd2></TD>
								</TR>
								<TR>
									<TH>&nbsp;</TH>
									<TD height="30"><BUTTON class=submit name=editsubmit
											type=submit>提交</BUTTON></TD>
								</TR>
							</TBODY>
						</TABLE>
					</DIV>
				</FORM>
			</DIV>
					<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>
	<%@include file="foot.jsp"%>
</BODY>
</HTML>