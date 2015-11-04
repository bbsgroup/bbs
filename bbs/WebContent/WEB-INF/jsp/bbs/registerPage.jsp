<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>注册新用户</TITLE>
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
<BODY onkeydown="if(event.keyCode==27) return false;" onload="loaded()">



	<DIV class=wrap>

		<%@include file="head.jsp"%>

		<DIV id=nav>
			<A href="/ejforum/index.jsp">unnamed</A> &raquo;&nbsp; 注册
		</DIV>
		<FORM name="register" 
			action="${pageContext.request.contextPath}/forum/user/register"
			method="post">
			<INPUT type=hidden name=fromPath value="">
			<DIV class="mainbox formbox">
				<SPAN class=headactions><A class=notabs
					href="./help/credits_rule.jsp" target=_blank>查看积分策略说明</A> </SPAN>
				<H1>注册</H1>
				<TABLE cellSpacing=0 cellPadding=0>
					<THEAD>
						<TR>
							<TH>基本信息 ( * 为必填项)</TH>
							<TD></TD>
						</TR>
					</THEAD>
					<TBODY>
						<TR>
							<TH><LABEL for=verifycode>验证码 *</LABEL></TH>
							<TD>
								<DIV id=verifycodeimage1 style="margin-bottom: 3px"></DIV> <INPUT
								id=verifycode onblur=checkverifycode() tabIndex=1 maxLength=4
								size=15 name=code> <img id="verifycodeimage"
								alt="点击更换验证码"
								src="${pageContext.request.contextPath}/forum/code"
								onclick="changecode()"><SPAN id=checkverifycode></SPAN>
							</TD>
						</TR>
						<TR>
							<TH><LABEL for=userID>用户名 *</LABEL></TH>
							<TD><INPUT id=userID onblur=checkuserID() tabIndex=2
								maxLength=15 size=25 name=username> <SPAN id=checkuserID>&nbsp;</SPAN>
							</TD>
						</TR>
						<TR>
							<TH><LABEL for=nickname>呢称</LABEL></TH>
							<TD><INPUT id=nickname tabIndex=3 maxLength=15 size=25
								name=nickname></TD>
						</TR>
						<TR>
							<TH><LABEL for=pwd1>密码 *</LABEL></TH>
							<TD><INPUT id=pwd1 tabIndex=4 type=password maxLength=15
								size=25 name=password> <SPAN id=checkpwd>&nbsp;</SPAN> <INPUT
								type=hidden id=pwd name=pwd></TD>
						</TR>
						<TR>
							<TH><LABEL for=pwd2>确认密码 *</LABEL></TH>
							<TD><INPUT id=pwd2 onblur=checkpwd2() tabIndex=5
								type=password maxLength=15 size=25 name=confirm-password> <SPAN
								id=checkpwd2>&nbsp;</SPAN></TD>
						</TR>
						<TR>
							<TH><LABEL for=email>Email *</LABEL></TH>
							<TD><INPUT id=email  tabIndex=6 size=25
								maxLength=40 name=email> <SPAN id=checkemail>&nbsp;</SPAN></TD>
						</TR>
						<TR>
							<TH>&nbsp;</TH>
							<TD><INPUT class=checkbox id=advshow onclick=showadv()
								tabIndex=12 type=checkbox value=1 name=advshow> 显示扩展信息</TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE id=adv style="DISPLAY: none" cellSpacing=0 cellPadding=0>
					<THEAD>
						<TR>
							<TH>扩展信息</TH>
							<TD>&nbsp;</TD>
						</TR>
					</THEAD>
					<TBODY>
						<TR>
							<TH>性别</TH>
							<TD><INPUT tabIndex=17 type=radio value=M name=sex>
								男&nbsp; <INPUT tabIndex=18 type=radio value=F name=sex>
								女&nbsp; <INPUT tabIndex=19 type=radio CHECKED value=U name=sex>
								保密</TD>
						</TR>
						<TR>
							<TH><LABEL for=birth>生日</LABEL></TH>
							<TD><INPUT id=birth tabIndex=20 size=25 maxLength=10
								value=1970-01-01 name=birthday> (&nbsp;格式为 yyyy-mm-dd ,
								年-月-日&nbsp;)</TD>
						</TR>
						<TR>
							<TH><LABEL for=city>来自</LABEL></TH>
							<TD><INPUT id=city tabIndex=21 size=25 maxLength=20
								name=nativePlace></TD>
						</TR>
						<TR>
							<TH vAlign=top><LABEL for=brief>自我介绍&nbsp;/&nbsp;个性签名</LABEL>
							</TD>
							<TD><TEXTAREA id=brief tabIndex=28 name=PersonSign rows=5
									cols=40 maxLength=200></TEXTAREA></TD>
						</TR>
						<TR>
							<TH>是否显示个性签名</TH>
							<TD><INPUT tabIndex=17 type=radio value=true name=showSign>
								是&nbsp; <INPUT tabIndex=18 type=radio value=false name=showSign>
								否&nbsp;</TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0>
					<TBODY>
						<TR class="btns">
							<TH><LABEL>注册条款</LABEL></TH>
							<TD><INPUT class=checkbox id=protocol tabIndex=99
								type=checkbox value='T' onclick="agreerule()" name=protocol>&nbsp;我已仔细阅读并接受&nbsp;&raquo;&nbsp;<a
								href="./help/protocol.jsp" target="_blank">论坛用户守则</a></TD>
						</TR>
						<TR>
							<TH>&nbsp;</TH>
							<TD height="30">
								<BUTTON class=submit tabIndex=100 name=regsubmit type=submit
									 id=regsubmit style="color: green">提交</BUTTON>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
		</FORM>
	</DIV>
	<script type="text/javascript">
		$(function() {
			$("form").validate({
				debug : true,
				rules : {
					username : {
						required : true,
						minlength : 2,
						maxlength : 10,
						remote:"${pageContext.request.contextPath}/forum/user/checkusername"
					},
					password : {
						required : true,
						minlength : 2,
						maxlength : 16
					},
					"confirm-password" : {
						equalTo : "#password"
					},
					email : {
						required : true,
						email:true
					},
				},
				messages : {
					username : {
						required : '请输入用户名',
						minlength : '用户名不能小于2个字符',
						maxlength : '用户名不能超过10个字符',
						remote : '用户名已经被使用'
					},
					password : {
						required : '请输入密码',
						minlength : '密码不能小于2个字符',
						maxlength : '密码不能超过16个字符'
					},
					"confirm-password" : {
						equalTo : "两次输入密码不一致"
					},
					email : {
						required : '请输入邮箱地址',
						email:"请输入合法的email地址"
					}

				}

			})
			{

			}

		})
	</script>

	<%@include file="foot.jsp"%>

</BODY>
</HTML>
