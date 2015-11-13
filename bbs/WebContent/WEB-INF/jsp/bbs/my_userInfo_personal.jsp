<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>编辑个人资料 - 个性化资料</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">
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
					var encoding = 'gbk';
					function validate(theform) {
						if (uc_strlen(theform.brief.value) > 200) {
							alert('您的自我介绍长度超过 200 字符的限制，请返回修改');
							theform.brief.focus();
							return false;
						}
						return true;
					}
					function previewavatar(url) {
						if (url) {
							$('avatarview').innerHTML = '<img id="previewimg" onload="resizeImage(this, 150);"/><br/>';
							$('previewimg').src = "/ejforum/upload/avatar/"
									+ url;
						} else {
							$('avatarview').innerHTML = '';
						}
					}
					function customavatar(value) {
						$('urlavatar').value = '';
						if (value) {
							$('avatarview').innerHTML = '<img id="previewimg" onload="checkImageSize(this, 150);"/><br/>';
							var url = getFullPath($('avatarcustom'));
							$('previewimg').src = url;
						}
					}
					function checkImageSize(img, maxsize) {
						if (img.width > maxsize || img.height > maxsize) {
							resizeImage(img, maxsize);
							alert('图片尺寸太大');
							var ovalue = $('brief').value;
							settings.reset();
							$('brief').value = ovalue;
							$('avatarview').innerHTML = '';
						}
					}
					function getFullPath(obj) {
						if (is_ie) {
							obj.select();
							return document.selection.createRange().text;
						} else {
							return obj.value;
						}
					}
					function selectavatar(value) {
						if ($('urlavatar')) {
							$('urlavatar').value = value;
							previewavatar(value);
							switchavatarlist();
						}
					}
					function switchavatarlist() {
						if ($("avatardiv").attr("display") == 'none')
							$("avatardiv").attr("display","block") ;
						else
							$("avatardiv").attr("display","none") ;
					}
				</SCRIPT>
				<FORM name="settings" onSubmit="return validate(this)"
					action="../perform.jsp?act=member_special" method=post
					enctype="multipart/form-data">
					<DIV class="mainbox formbox">
						<H1>编辑个人资料</H1>
						<UL class="tabs">
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=changePassword">修改密码</A></LI>
							<LI ><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=edit">基本资料</A></LI>
							<LI class=current><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=personal">个性化资料</A></LI>
						</UL>
						<TABLE cellSpacing=0 cellPadding=0 summary=编辑个人资料>
							<TBODY>
								<TR>
									<TH vAlign=top><LABEL for=urlavatar>头像<BR />
											(&nbsp;150x150&nbsp;像素以内&nbsp;)
									</LABEL></TH>
									<TD><SPAN id=avatarview></SPAN> <INPUT id=urlavatar
										onchange=previewavatar(this.value) size=25 name=urlavatar
										style='margin-top: 3px'> &nbsp; <A href="#"
										onclick="switchavatarlist();">论坛头像列表</A>
										<DIV id=avatardiv style="MARGIN-TOP: 10px; DISPLAY: none">
											<DIV class=spaceborder style="CLEAR: both">
												<TABLE style="TABLE-LAYOUT: fixed" cellSpacing=1
													cellPadding=1 width="100%" align=center>
													<TBODY>
														<TR>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/unknown.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/01.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/02.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/03.gif"></TD>
														</TR>
														<TR>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio value=""
																name=systemavatar><STRONG>None</STRONG></TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio CHECKED
																value="sample/01.gif" name=systemavatar>01.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/02.gif" name=systemavatar>02.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/03.gif" name=systemavatar>03.gif</TD>
														</TR>
														<TR>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/04.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/05.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/06.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/07.gif"></TD>
														</TR>
														<TR>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/04.gif" name=systemavatar>04.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/05.gif" name=systemavatar>05.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/06.gif" name=systemavatar>06.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/07.gif" name=systemavatar>07.gif</TD>
														</TR>
														<TR>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/08.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/09.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/10.gif"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/11.gif"></TD>
														</TR>
														<TR>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/08.gif" name=systemavatar>08.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/09.gif" name=systemavatar>09.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/10.gif" name=systemavatar>10.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/11.gif" name=systemavatar>11.gif</TD>
														</TR>
														<TR>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/12.jpg"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/13.jpg"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/14.jpg"></TD>
															<TD style="BORDER-BOTTOM: medium none" align=middle
																width="25%"><IMG
																src="${pageContext.request.contextPath}/media/images/avatar/15.jpg"></TD>
														</TR>
														<TR>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/12.jpg" name=systemavatar>12.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/13.jpg" name=systemavatar>13.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/14.jpg" name=systemavatar>14.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="sample/15.jpg" name=systemavatar>15.jpg</TD>
														</TR>
													</TBODY>
												</TABLE>
											</DIV>
										</DIV> <BR> <INPUT type=file
										onchange="customavatar(this.value);" size=60 id=avatarcustom
										name=avatarcustom style='margin-top: 3px'></TD>
								</TR>
								<TR>
									<TH vAlign=top><LABEL for=brief>自我介绍&nbsp;/&nbsp;个性签名<BR />(&nbsp;200
											个字以内&nbsp;)
									</LABEL></TH>
									<TD><TEXTAREA id=brief style="WIDTH: 393px" name=brief
											rows=7></TEXTAREA></TD>
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
				$('urlavatar').value = "";
				previewavatar($('urlavatar').value);
			</script>
					<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>
	<%@include file="foot.jsp"%>
</BODY>
</HTML>