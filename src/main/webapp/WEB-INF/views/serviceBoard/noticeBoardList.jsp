<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:url var='root' value='/'/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>

<!-- 게시글 리스트 -->
			<h4> : 공 지 사 항 : </h4>			
			
			<c:forEach var="str" items="${nblist }">
			<a href="${root }serviceBoard/noticeBoardRead?nb_no=${str.nb_no}">${str.nb_title}</a> <br>
				${str.nb_contents} <br>
				${str.nb_viewCount} <br>
			
			</c:forEach>
			<div>
				<a href="${root}serviceBoard/noticeBoardWrite">글쓰기</a>
				<a href="${root}index">돌아가기</a>
			</div>
			
</body>
</html>