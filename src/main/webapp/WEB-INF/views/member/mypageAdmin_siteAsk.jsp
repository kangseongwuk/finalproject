<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : 관리자 admin01 : </title>
</head>
<body>
	<h2>  : 관리자 admin01 의 문의 사항 목록 : </h2>

	<p>
	회원 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	회원 번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	문의 제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
	가입 날짜</p>
	
	
	<c:forEach var="sa" items="${abSiteAskList }">
				${sa.m_name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${sa.sa_memberNo} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${root}serviceBoard/siteAskRead?sa_time=${sa.sa_time }">${sa.sa_title}</a> 
			<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${sa.sa_time}" /><br><hr>
			</c:forEach>
	<a href="${root}member/mypageAdmin">관리자 마이페이지</a>
	<a href="${root}index">돌아가기</a>
</body>
</html>