<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 성공</h2>
<h2>${sessionScope.loginMemberBean.m_id }</h2>
<h2>${sessionScope.loginMemberBean.m_pw }</h2>

<a href="${root }modify?m_id=${loginMemberBean.m_id}">회원정보수정</a>
<a href="${root }delete?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">회원탈퇴</a>
<a href="${root }logout">로그아웃</a>
</body>
</html>