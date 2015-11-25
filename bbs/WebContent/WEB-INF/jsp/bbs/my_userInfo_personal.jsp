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
							$('avatarview').innerHTML = '<img id="previewimg" onload="resizeImage(this, 90);" /><br/>';
							$('previewimg').src = url;
						} else {
							$('avatarview').innerHTML = '';
						}
					}
					function customavatar(value) {
						$('urlavatar').value = '';
						if (value) {
							$('avatarview').innerHTML = '<img id="previewimg" onload="checkImageSize(this, 100);"/><br/>';
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
						}
					}

					function switchavatarlist() {
						if (jQuery("#altContent").css('display') == 'block') {
							jQuery("#altContent").hide();
						}

						if (jQuery("#avatardiv").css('display') == 'block') {
							jQuery("#avatardiv").hide();
						} else
							jQuery("#avatardiv").show();
					}
					function switchaltContent() {
						if (jQuery("#avatardiv").css('display') == 'block') {
							jQuery("#avatardiv").hide();
						}

						if (jQuery("#altContent").css('display') == 'block') {
							jQuery("#altContent").hide();
						} else
							jQuery("#altContent").show();
					}
				</SCRIPT>

				<script type="text/javascript">
					function uploadevent(status, picUrl, callbackdata) {

						status += '';
						switch (status) {
						case '1':
							var time = new Date().getTime();
							var filename162 = picUrl + '_162.jpg';
							var filename48 = picUrl + '_48.jpg';
							var filename20 = picUrl + "_20.jpg";
							$('urlavatar').value = filename162;
							previewavatar(filename162);
							switchaltContent();
							/* 					document
														.getElementById('avatarview').innerHTML = "<img src='"
														+ filename162
														+ "?"
														+ time
														+ "'/>"
														+"<br/>"; */
							/* 	 <br/> 头像2: <img src='"
										+ filename48
										+ "?"
										+ time
										+ "'/><br/> 头像3: <img src='"
										+ filename20
										+ "?"
										+ time + "'/> */

							break;
						case '-1':
							window.location.reload();
							break;
						default:
							window.location.reload();
						}
					}
				</script>
				<FORM name="settings" onSubmit="return validate(this)"
					action="${pageContext.request.contextPath}/forum/user/editUserInfoPersonal" method=post
					enctype="multipart/form-data">
					<DIV class="mainbox formbox">
						<H1>编辑个人资料</H1>
						<UL class="tabs">
							<LI><A
								href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=changePassword">修改密码</A></LI>
							<LI><A
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
										onchange=previewavatar(this.value) size=25 name=heanImage
										style='margin-top: 3px'> &nbsp; <A href="#"
										onclick="switchavatarlist();">论坛头像列表</A> <A href="#"
										onclick="switchaltContent();">自定义头像</A>
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
																value="${pageContext.request.contextPath}/media/images/avatar/01.gif"
																name=systemavatar>01.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/02.gif"
																name=systemavatar>02.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/03.gif"
																name=systemavatar>03.gif</TD>
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
																value="${pageContext.request.contextPath}/media/images/avatar/04.gif"
																name=systemavatar>04.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/05.gif"
																name=systemavatar>05.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/06.gif"
																name=systemavatar>06.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/07.gif"
																name=systemavatar>07.gif</TD>
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
																value="${pageContext.request.contextPath}/media/images/avatar/08.gif"
																name=systemavatar>08.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/09.gif"
																name=systemavatar>09.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/10.gif"
																name=systemavatar>10.gif</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/11.gif"
																name=systemavatar>11.gif</TD>
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
																value="${pageContext.request.contextPath}/media/images/avatar/12.jpg"
																name=systemavatar>12.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/13.jpg"
																name=systemavatar>13.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/14.jpg"
																name=systemavatar>14.jpg</TD>
															<TD align=middle width="25%"><INPUT
																onclick="selectavatar(this.value);" type=radio
																value="${pageContext.request.contextPath}/media/images/avatar/15.jpg"
																name=systemavatar>15.jpg</TD>
														</TR>
													</TBODY>
												</TABLE>
											</DIV>
										</DIV> <BR> <!-- <INPUT type=file
										onchange="customavatar(this.value);" size=60 id=avatarcustom
										name=avatarcustom style='margin-top: 3px'> -->
										<div id="altContent" style="MARGIN-TOP: 10px; DISPLAY: none">
											<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
												codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
												WIDTH="650" HEIGHT="450" id="myMovieName">
												<PARAM NAME=movie
													VALUE="${pageContext.request.contextPath }/media/uploadAvator/avatar.swf">
												<PARAM NAME=quality VALUE=high>
												<PARAM NAME=bgcolor VALUE=#FFFFFF>
												<param name="flashvars"
													value="uploadUrl=${pageContext.request.contextPath }/file/uploadAvator&uploadSrc=false" />
												<EMBED
													src="${pageContext.request.contextPath }/media/uploadAvator/avatar.swf"
													quality=high bgcolor=#FFFFFF WIDTH="650" HEIGHT="450"
													wmode="transparent"
													flashVars="uploadUrl=${pageContext.request.contextPath }/file/uploadAvator&uploadSrc=false"
													NAME="myMovieName" ALIGN=""
													TYPE="application/x-shockwave-flash"
													allowScriptAccess="always"
													PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
												</EMBED>
											</OBJECT>
										</div>
										<div id="avatar_priview"></div></TD>
								</TR>
									<tr>
									<TH vAlign=top><LABEL for=brief>是否显示&nbsp;/&nbsp;头像<BR />
									</LABEL></TH>
									<TD><input type="radio" name="showHead" value="true">显示&nbsp;&nbsp;
										<input type="radio" name="showHead" value="false"
										checked="checked">不显示</TD>
								</tr>
								<TR>
									<TH vAlign=top><LABEL for=brief>自我介绍&nbsp;/&nbsp;个性签名<BR />(&nbsp;200
											个字以内&nbsp;)
									</LABEL></TH>
									<TD><TEXTAREA id=brief style="WIDTH: 393px" name=PersonSign
											rows=7></TEXTAREA></TD>
								</TR>
								<tr>
									<TH vAlign=top><LABEL for=brief>是否显示&nbsp;/&nbsp;个性签名<BR />
									</LABEL></TH>
									<TD><input type="radio" name="showSign" value="true">显示&nbsp;&nbsp;
										<input type="radio" name="showSign" value="false"
										checked="checked">不显示</TD>
								</tr>
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