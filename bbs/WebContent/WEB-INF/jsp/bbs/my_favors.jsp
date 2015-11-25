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
			&raquo;&nbsp; 我的收藏
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<FORM name="myform" onSubmit="return validate(this)"
					action="./my_favors.jsp?mod=del" method=post>
					<DIV class=mainbox style="padding-bottom: 5px">
						<H1>我的收藏</H1>
						<UL class="tabs headertabs">
							<LI class="additem"><A href="my_addfavor.jsp">添加收藏</A></LI>
							<LI class="current"><A href="my_favors.jsp">我的收藏夹</A></LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0 width="100%">
							<THEAD>
								<TR>
									<TD class=selector>&nbsp;</TD>
									<TD>标题</TD>
									<TD width="120">所属版块&nbsp;/&nbsp;网站</TD>
									<TD class=time>创建时间</TD>
								</TR>
							</THEAD>
							<TBODY>

								<TR>
									<TD colspan="4">没有记录</TD>
								</TR>

							</TBODY>
						</TABLE>
						<DIV class="management">
							<LABEL><INPUT class=checkbox id=chkall
								onclick=checkall(this.form) type=checkbox name=chkall>
								全选</LABEL>
							<BUTTON name=delfavors type=submit>删除</BUTTON>
						</DIV>
					</DIV>
				</FORM>
				<DIV class=pages_btns></DIV>
				<SCRIPT type=text/javascript>
					function validate(theform) {
						var hasCheckedID = false;
						if (typeof (theform.markID) != "undefined") {
							if (typeof (theform.markID.length) != "undefined") {
								for (i = 0; i < theform.markID.length; i++) {
									if (theform.markID[i].checked) {
										hasCheckedID = true;
										break;
									}
								}
							} else if (theform.markID.checked)
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