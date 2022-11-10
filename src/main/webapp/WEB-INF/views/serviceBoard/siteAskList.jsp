<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:url var='root' value='/'/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
</head>
<body>

<!-- 게시글 리스트 -->
			<h4> : 문 의 사 항 : </h4>			
			
			<c:forEach var="str" items="${salist}">
			
        		${str.sa_memberNo}<br>
        		<a href="${root }serviceBoard/siteAskRead?sa_time=${str.sa_time}">${str.sa_title}</a><br>
        		
        		<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${str.sa_time}" /><br>
			</c:forEach>
			<div>
				<a href="${root}serviceBoard/siteAskWrite">글쓰기</a>
				<a href="${root}index">돌아가기</a>
			</div>
			
</body>
</html>

