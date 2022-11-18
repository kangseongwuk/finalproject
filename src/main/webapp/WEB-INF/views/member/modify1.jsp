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
		<form:form action="${root}modify_pro" method="post" modelAttribute="modifyMemberBean">
					<div>
						<form:label path="m_name">이름</form:label>
						<form:input type="text" path="m_name" readonly="true"/>
					</div>
					<div>
						<form:label path="m_id">아이디</form:label>
						<form:input type="text" path="m_id" readonly="true"/>
					</div>
					<div>
						<form:label path="m_pw">비밀번호</form:label>
						<form:input type="password" path="m_pw"/>
						<form:errors path="m_pw" style="color:red"/>
					</div>
					<div>
						<form:label path="m_pw2">비밀번호 확인</form:label>
						<form:input type="password" path="m_pw2"/>
						<form:errors path="m_pw2" style="color:red"/>
					</div>
					<div>
						<form:label path="m_tele">전화번호</form:label>
						<form:input type="tele" path="m_tele"/>
						<form:errors path="m_tele" style="color:red"/>
					</div>
					<div>
						<form:label path="m_email">이메일</form:label>
						<form:input type="email" path="m_email"/>
						<form:errors path="m_email" style="color:red"/>
					</div>
					<div>
						<div>
							<form:button type="submit">정보수정</form:button>
						</div>
					</div>
		</form:form>
	</div>
</body>
</html>