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
					action="./sms_list.jsp?act=outbox&mod=del" method=post>
					<DIV class=mainbox style="padding-bottom: 5px">
						<H1>短消息</H1>
						<UL class="tabs headertabs">
							<LI class=additem><A href="sms_compose.jsp">发送短消息</A></LI>
							<LI><A href="${pageContext.request.contextPath}/forum/user/my_msg?action=inbox">收件箱 (<SPAN
									id=sms_unread>0</SPAN>)
							</A></LI>
							<LI class=current><A href="${pageContext.request.contextPath}/forum/user/my_msg?action=outbox">已发送</A></LI>
							<LI style="border: none; float: right"><a title="RSS Feed"
								href="../rss?uid=aaa&act=sms&page=1" target=_blank> <IMG
									alt="RSS Feed" src="${pageContext.request.contextPath}/media/images/rss.gif" border="0"></a></LI>
						</UL>
						<TABLE id=smslist cellSpacing=0 cellPadding=0
							style="table-layout: fixed">
							<THEAD>
								<TR>
									<TD class=selector>&nbsp;</TD>
									<TH>标题</TH>
									<TD class=user>发送到</TD>
									<TD class=time>时间</TD>
									<TD width="100">操作</TD>
								</TR>
							</THEAD>
							<TBODY>

								<TR>
									<TD colspan="5">没有记录</TD>
								</TR>

							</TBODY>
						</TABLE>
						<DIV class="management">
							<LABEL><INPUT class=checkbox id=chkall
								onclick=checkall(this.form) type=checkbox name=chkall>
								全选</LABEL>
							<BUTTON name=smssend type=submit>删除</BUTTON>
						</DIV>
					</DIV>
				</FORM>
				<DIV class=pages_btns></DIV>
				<DIV class=remark>
					<img src="${pageContext.request.contextPath}/media/images/notice.gif" border="0" align="absmiddle" />
					&nbsp;收件箱最大容量: 50
				</DIV>
				<SCRIPT type=text/javascript>
					var lastdiv_id = '';
					var isinbox = false;

					function validate(theform) {
						var hasCheckedID = false;
						if (typeof (theform.msgID) != "undefined") {
							if (typeof (theform.msgID.length) != "undefined") {
								for (i = 0; i < theform.msgID.length; i++) {
									if (theform.msgID[i].checked) {
										hasCheckedID = true;
										break;
									}
								}
							} else if (theform.msgID.checked)
								hasCheckedID = true;
						}
						if (!hasCheckedID) {
							alert("请至少选中一条消息");
							return false;
						}
						theform.submit();
					}

					function changestatus(obj) {
						if (obj.parentNode.style.fontWeight == "bold") {
							obj.parentNode.style.fontWeight = "normal";
							var unreads = parseInt($('sms_unread').innerHTML);
							if (unreads > 0)
								$('sms_unread').innerHTML = unreads - 1;
						}
					}

					function showsms(event, obj, msgid) {
						var url = '../ajax?act=';
						if (isinbox)
							url = url + 'smsinbox';
						else
							url = url + 'smsoutbox';
						url = url + '&id=' + msgid;

						var msgdiv_id = 'msg_' + msgid + '_div';

						if (!$(msgdiv_id)) {
							var x = new Ajax();
							x
									.get(
											url,
											function(s) {
												var table1 = obj.parentNode.parentNode.parentNode.parentNode;
												var row1 = table1
														.insertRow(obj.parentNode.parentNode.rowIndex + 1);
												row1.id = msgdiv_id;
												row1.className = 'row';

												var cell1 = row1.insertCell(0);
												cell1.innerHTML = '&nbsp;';
												cell1.className = 'selector';

												var cell2 = row1.insertCell(1);
												cell2.colSpan = '4';
												cell2.innerHTML = s.replace(
														/\r?\n/g, '<br/>');
												cell2.className = 'smsmessage';

												if (lastdiv_id) {
													$(lastdiv_id).style.display = 'none';
												}
												if (isinbox)
													changestatus(obj);
												lastdiv_id = msgdiv_id;
											});
						} else {
							if ($(msgdiv_id).style.display == 'none') {
								$(msgdiv_id).style.display = '';
								if (isinbox)
									changestatus(obj);
								if (lastdiv_id) {
									$(lastdiv_id).style.display = 'none';
								}
								lastdiv_id = msgdiv_id;
							} else {
								$(msgdiv_id).style.display = 'none';
								lastdiv_id = '';
							}
						}
						cancel(event);
					}
				</SCRIPT>
			</DIV>




			<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>