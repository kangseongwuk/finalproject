<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form:form action="${root}member/mypage_pro" method="post" modelAttribute="mypageMemberBean">
			<div>
				<form:label path="m_name">이름</form:label>
				<form:input type="text" path="m_name" readonly="true"/>
			</div>
			<div>
				<form:label path="m_id">아이디</form:label>
				<form:input type="text" path="m_id" readonly="true"/>
			</div>
			<div>
				<form:label path="m_tele">전화번호</form:label>
				<form:input type="tele" path="m_tele" readonly="true"/>
			</div>
			<div>
				<form:label path="m_email">이메일</form:label>
				<form:input type="email" path="m_email" readonly="true"/>
			</div>
		</form:form>
	</div>
	<hr>
	<c:forEach var="str" items="${memberChildlist}">
	<div>
		<form:form action="${root}member/mypage_pro2" method="post" modelAttribute="memberChildBean">
			<div>
				<form:label path="c_name">학생이름</form:label>
				<form:input path="c_name" value="${str.c_name }" readonly="true"/>
			</div>
			<div>
				<form:label path="c_grade">학년</form:label>
				<form:input path="c_grade" value="${str.c_grade }" readonly="true"/>
			</div>	
			<div>
				<form:label path="c_gender">성별</form:label>
				<form:input path="c_gender" value="${str.c_gender }" readonly="true"/>
			</div>
			<div>
				<form:label path="c_level">학업수준</form:label>
				<form:input path="c_level" value="${str.c_level }" readonly="true"/>
			</div>		
		</form:form>
		<a href="member/modifyChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo }&c_name=${str.c_name}">수정하기</a>
		<a href="member/deleteChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo }&c_name=${str.c_name}">삭제하기</a>
	</div>
	</c:forEach>
	<a href="${root }member/insertChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">자녀정보입력</a>	
	<a href="${root }member/modify?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">회원정보수정</a>
	<a href="${root }member/delete?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">회원탈퇴</a>
</body>
</html>