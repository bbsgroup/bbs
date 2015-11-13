<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>编辑个人资料 - unnamed</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
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
			&raquo;&nbsp; 编辑个人资料
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<SCRIPT type=text/javascript>
					function validate(theform) {
						var email = trim(theform.email.value);
						if (email == '') {
							alert("请输入您的 Email");
							theform.email.focus();
							return false;
						}
						var illegalemail = !(/^[\-\.\w]+@[\.\-\w]+(\.\w+)+$/
								.test(email));
						if (illegalemail) {
							alert("请输入有效的 Email 地址");
							theform.email.focus();
							return false;
						}
						return true;
					}
				</SCRIPT>
				<FORM name="settings" onSubmit="return validate(this)"
					action="../perform.jsp?act=member_profile" method=post>
					<DIV class="mainbox formbox">
						<H1>编辑个人资料</H1>
						<UL class="tabs">
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=changePassword">修改密码</A></LI>
							<LI class=current><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=edit">基本资料</A></LI>
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=personal">个性化资料</A></LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0>
							<TBODY>
								<TR>
									<TH><LABEL for=nickname>昵称</LABEL></TH>
									<TD><INPUT id=nickname size=30 name=nickname
										maxlength="15"></TD>
								</TR>
								<TR>
									<TH>性别</TH>
									<TD><INPUT class=radio type=radio value='M' name=gender
										id="gender[M]"> 男 &nbsp; <INPUT class=radio type=radio
										value='F' name=gender id="gender[F]"> 女 &nbsp; <INPUT
										class=radio type=radio CHECKED value='U' name=gender
										id="gender[U]"> 保密</TD>
								</TR>
								<TR>
									<TH><LABEL for=birth>生日</LABEL></TH>
									<TD><INPUT id=birth maxlength=10 size=30 value=1970-01-01
										name=birth> (&nbsp;格式为 yyyy-mm-dd , 年-月-日&nbsp;)</TD>
								</TR>
								<TR>
									<TH><LABEL for=city>来自</LABEL></TH>
									<TD><INPUT id=city size=30 name=city maxlength="20"></TD>
								</TR>
								<TR>
									<TH><LABEL for=webpage>个人网站</LABEL></TH>
									<TD><INPUT id=webpage size=30 name=webpage maxlength="60"></TD>
								</TR>
								<TR>
									<TH><LABEL for=icq>QQ/MSN</LABEL></TH>
									<TD><INPUT id=icq size=30 name=icq maxlength="40"></TD>
								</TR>
								<TR>
									<TH><LABEL for=email>Email</LABEL></TH>
									<TD><INPUT id=email size=30 name=email maxlength="40"></TD>
								</TR>
								<TR>
									<TH></TH>
									<TD><INPUT id=isMailPub class=checkbox type=checkbox
										value='T' name=isMailPub> Email 地址可见 &nbsp;</TD>
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
			<script language="javascript">
				$('nickname').value = "aaa";
				$('gender[U]').checked = true;
				$('birth').value = "1970-01-01";
				$('city').value = "";
				$('webpage').value = "";
				$('icq').value = "";
				$('email').value = "aaa@1.com";
				$('isMailPub').checked = false;
			</script>
				<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>