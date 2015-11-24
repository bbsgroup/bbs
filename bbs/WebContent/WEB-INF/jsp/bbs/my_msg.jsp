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
			&raquo;&nbsp; 我的短消息
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<FORM name="smsform" onSubmit="return validate(this)"
					action="${pageContext.request.contextPath}/forum/user/my_msg_send" method=post>
					<DIV class=mainbox style="padding-bottom: 5px">
						<H1>短消息</H1>
						<UL class="tabs headertabs">
							<LI class=current><A
								href="${pageContext.request.contextPath}/forum/user/my_msg">发送短消息</A></LI>
							<LI ><A
								href="${pageContext.request.contextPath}/forum/user/my_msg?action=inbox">收件箱
									(<SPAN id=sms_unread>0</SPAN>)
							</A></LI>
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_msg?action=outbox">已发送</A></LI>
							<LI style="border: none; float: right"><a title="RSS Feed"
								href="../rss?uid=aaa&act=sms&page=1" target=_blank> <IMG
									alt="RSS Feed"
									src="${pageContext.request.contextPath}/media/images/rss.gif"
									border="0"></a></LI>
						</UL>
				<TABLE cellSpacing=0 cellPadding=0>
					<TBODY>
						<TR>
							<TH><LABEL for=users>发送到</LABEL></TH>
							<TD><INPUT id=users tabIndex=2 size=65 name=receivers
								maxlength="100" value=""> &nbsp;(多个用户名之间以逗号","分隔)</TD>
						</TR>
						<TR>
							<TH><LABEL for=subject>标题</LABEL></TH>
							<TD><INPUT id=subject tabIndex=4 size=65 name=title
								maxlength="100" value=""></TD>
						</TR>
						<TR>
							<TH vAlign=top><LABEL for=message>内容</LABEL><BR />(200 个字以内)</TH>
							<TD><TEXTAREA id=message style="WIDTH: 85%" tabIndex=5
									name=content rows=8></TEXTAREA></TD>
						</TR>
						<TR>
							<TH><LABEL for=verifycode>验证码</LABEL></TH>
							<TD>
								<DIV id=verifycodeimage style="margin-bottom: 3px"></DIV> <INPUT
								id=verifycode name=verifycode tabIndex=8 maxLength=4 size=15>
								<SPAN id=checkverifycode></SPAN>
							</TD>
						</TR>
						<TR class=btns>
							<TH>&nbsp;</TH>
							<TD height="30"><BUTTON class=submit id=postsubmit
									tabIndex=7 name=smssubmit type=submit>提交</BUTTON></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			</FORM>
			<SCRIPT type=text/javascript>
				msgs['post_vcode_empty'] = '请输入验证码';
				var verifycode_invalid = '验证码输入错误，请重新填写';
				$('verifycodeimage').innerHTML = '<img width="112" height="42" src="${pageContext.request.contextPath}/forum/code" class="absmiddle"/>';
				function validate(theform) {
					if (trim(theform.users.value) == '') {
						alert("请输入发送消息的目的用户名。");
						theform.users.focus();
						return false;
					}
					if (trim(theform.subject.value) == ''
							|| trim(theform.message.value) == '') {
						alert("请输入标题和内容。");
						theform.subject.focus();
						return false;
					}
					if (theform.subject.value.length > 100) {
						alert("您的标题超过 100 个字符的限制。");
						theform.subject.focus();
						return false;
					}
					if (theform.message.value.length > 200) {
						alert("您的消息内容超过 200 个字符的限制。");
						theform.message.focus();
						return false;
					}
					if (trim($('verifycode').value) == '') {
						warning($('checkverifycode'), msgs['post_vcode_empty']);
						theform.verifycode.focus();
						return false;
					}
					if (!checkverifycode()) {
						theform.verifycode.focus();
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