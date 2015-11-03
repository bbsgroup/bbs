<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>用户登录 - unnamed</TITLE>
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
</HEAD>
<BODY onkeydown="if(event.keyCode==27) return false;">


	<SCRIPT language=JavaScript>
if(self.parent.frames.length != 0) {
	self.parent.location = "/ejforum/login.jsp";
}
</SCRIPT>

	<DIV class=wrap>

		<%@include file="head.jsp"%>

		<DIV id=nav>
			<A href="/ejforum/index.jsp">unnamed</A> &raquo; 会员登录
		</DIV>
		<FORM name=login onSubmit="checkfield(this); return false;"
			action="${pageContext.request.contextPath}/forum/user/login" method=post>
			<DIV class="mainbox formbox">
				<SPAN class=headactions> <A class=notabs
					href="/ejforum/help/member.jsp" target=_blank>登录帮助</A></SPAN>
				<H1>会员登录</H1>
				<TABLE cellSpacing=0 cellPadding=0 summary=会员登录>
					<TBODY>
						<TR>
							<TH onclick=document.login.userID.focus();><LABEL for=userID>用户名</LABEL></TH>
							<TD><INPUT id=userID tabIndex=2 maxLength=40 size=25
								name=username> &nbsp;<A
								href="${pageContext.request.contextPath}/forum/user/registerPage">立即注册</A>
								<INPUT type=hidden name=fromPath
								value="/ejforum/perform.jsp?act=reg"></TD>
						</TR>
						<TR>
							<TH><LABEL for=pwd1>密码</LABEL></TH>
							<TD><INPUT id=pwd1 tabIndex=5 type=password size=25
								name=password> &nbsp;<A href="/ejforum/findpwd.jsp">忘记密码</A><INPUT
								type=hidden id=pwd name=pwd></TD>
						</TR>
						<TR>
							<TH>登录有效期</TH>
							<TD><LABEL><INPUT class=radio tabIndex=8 type=radio
									value=0 name=cookietime> 浏览器进程（约30分钟）</LABEL> <LABEL><INPUT
									class=radio tabIndex=9 type=radio value=3600 name=cookietime>
									一小时</LABEL> <LABEL><INPUT class=radio tabIndex=10 type=radio
									value=86400 name=cookietime> 一天</LABEL> <LABEL><INPUT
									class=radio tabIndex=11 type=radio value=2592000
									name=cookietime CHECKED> 一个月</LABEL> <LABEL><INPUT
									class=radio tabIndex=12 type=radio value=315360000
									name=cookietime> 永久</LABEL></TD>
						</TR>
						<TR class="btns">
							<TH>&nbsp;</TH>
							<TD height="30"><BUTTON class=submit tabIndex=100
									name=loginsubmit type=submit value="true">提交</BUTTON></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
		</FORM>

<!-- <SCRIPT type=text/javascript>
function checkfield(theform) {
	if(trim($('userID').value) == '') {
		alert('用户名不可以为空');return false;
	} else if(trim($('pwd1').value) == '') {
		alert('密码不可以为空');return false;
	} else {
		$('pwd').value = hex_md5(trim($('pwd1').value)); 
		$('pwd1').value = '';
		theform.submit();return false;
	}
} -->
</SCRIPT>
	</DIV>


	<%@include file="foot.jsp"%>
</BODY>
</HTML>