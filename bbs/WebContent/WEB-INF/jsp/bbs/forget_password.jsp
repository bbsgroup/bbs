

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>找回密码 - unnamed</TITLE>
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
			&raquo;&nbsp; 忘记密码
		</DIV>

		<FORM name="findpwd" onsubmit="return checkfields();"
			action="perform.jsp?act=fdp" method="post">
			<DIV class="mainbox formbox">
				<H1>找回密码</H1>
				<TABLE cellSpacing=0 cellPadding=0>
					<THEAD>
						<TR>
							<TH>请输入用户名或Email</TH>
							<TD>&nbsp;</TD>
						</TR>
					</THEAD>
					<TBODY>
						<TR>
							<TH><LABEL for=verifycode>验证码</LABEL></TH>
							<TD>
								<DIV id=verifycodeimage style="margin-bottom: 3px"></DIV> <INPUT
								id=verifycode onblur=checkverifycode() tabIndex=1 maxLength=4
								size=15 name=verifycode> <SPAN id=checkverifycode></SPAN>
							</TD>
							<SCRIPT type=text/javascript>
								refreshVerifyCode(112, 42);
							</SCRIPT>
						</TR>
						<TR>
							<TH><LABEL for=userID>用户名</LABEL></TH>
							<TD><INPUT id=userID onblur=checkuserID() tabIndex=2
								maxLength=15 size=25 name=userID> <SPAN id=checkuserID>&nbsp;</SPAN>
							</TD>
						</TR>
						<TR>
							<TH><LABEL for=email>Email</LABEL>
							</TD>
							<TD><INPUT id=email onblur=checkemail() tabIndex=6 size=25
								maxLength=40 name=email> <SPAN id=checkemail>&nbsp;</SPAN></TD>
						</TR>
						<TR>
							<TH>&nbsp;</TH>
							<TD height="30"><BUTTON class=submit tabIndex=100
									name=findsubmit type=submit value="true">提交</BUTTON></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
		</FORM>
		<SCRIPT type=text/javascript>
			var verifycode_invalid = '验证码输入错误，请重新填写';
			var lastuserID = lastemail = '';

			$('userID').focus();

			function checkfields() {
				if (trim($('verifycode').value) == '') {
					warning($('checkverifycode'), '请输入验证码');
					return false;
				}
				if (trim($('userID').value) == ''
						&& trim($('email').value) == '') {
					warning($('checkuserID'), '请输入您的用户名或Email其中至少一项');
					return false;
				}
				findpwd.findsubmit.disabled = true;
			}
			function checkuserID() {
				var userID = trim($('userID').value);
				if (userID == lastuserID) {
					return;
				} else {
					lastuserID = userID;
				}
				var cu = $('checkuserID');
				var unlen = userID.replace(/[^\x00-\xff]/g, "**").length;
				if (unlen < 3 && userID != '') {
					warning(cu, '对不起，您输入的用户名小于3个字符, 请输入一个较长的用户名');
				} else {
					cu.style.display = 'none';
				}
			}
			function checkemail() {
				var email = trim($('email').value);
				if (email == lastemail) {
					return;
				} else {
					lastemail = email;
				}

				var ce = $('checkemail');
				if (email != '' && !isLegalEmail(email)) {
					warning(ce, 'Email 地址无效，请重新填写');
				} else {
					ce.style.display = 'none';
				}
			}
		</SCRIPT>
	</DIV>


	<%@include file="foot.jsp"%>
</BODY>
</HTML>