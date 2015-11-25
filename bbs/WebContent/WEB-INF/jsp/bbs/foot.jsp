<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<DIV id=footer>
	<DIV class=wrap>
		<DIV id=footlinks>
			<P>
			<jsp:useBean id="now" class="java.util.Date" />	
				当前时区&nbsp;GMT+8, 现在时间是&nbsp;
				<fmt:formatDate value="${now}" type="both" dateStyle="long"
					pattern="yyyy-MM-dd" />
			</P>
			<P>
				<span class="scrolltop" title="顶部" onclick="window.scrollTo(0,0);">TOP</span>
			</P>
		</DIV>
		<!--<fmt:parseDate value="${param.date}" var="date" pattern="yyyy/MM/dd:HH:mm:ss"/>  -->
		<P class=copyright>
			Powered by <STRONG><A href="#" target=_blank>hxj&joeHo</A></STRONG> <EM>1.0</EM>
			&copy; 2005-2015 <A href="#" target=_blank>SCAU software</A>
		</P>
	</DIV>
</DIV>