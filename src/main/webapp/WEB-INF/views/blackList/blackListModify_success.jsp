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
	<script>
		alert("글 수정을 성공 했습니다.")
		location.href="blackListRead?m_memberNo=${blModifyBean.m_memberNo}&a_memberNo=${blModifyBean.a_memberNo}"

		</script>
</body>
</html>	