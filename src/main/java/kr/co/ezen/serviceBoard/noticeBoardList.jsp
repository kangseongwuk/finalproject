<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<br>
			<c:forEach var="st" items="${nblist }">
				${st.nb_no} &nbsp;&nbsp;
			<a href="${root }serviceBoard/noticeBoardRead?nb_no=${st.nb_no}">${st.nb_title}</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${st.nb_viewCount}<br>
			<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${st.nb_writeTime}" /><br><br><hr>
			</c:forEach>
			<div>
				<a href="${root}serviceBoard/noticeBoardWrite">글쓰기</a>
				<a href="${root}index">돌아가기</a>
			</div>
			
</body>
</html>