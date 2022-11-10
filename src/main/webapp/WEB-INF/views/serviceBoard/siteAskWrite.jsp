<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
</head>
<body>

<!-- ===============================  header  =============================== -->
<%--    <c:import url="/WEB-INF/views/include/header.jsp"/> --%>
<!-- ===============================  header  =============================== -->

	<div>
		<form:form action="${root }serviceBoard/siteAskWrite_pro" method="post" modelAttribute="saWriteBean"
		enctype="multipart/form-data">
		
		<div>
			<form:label path="sa_tele">휴대폰</form:label>
			<form:input path="sa_tele" />
			<form:errors path="sa_tele" style="color:red"></form:errors>
		</div>
		
		<div>
			<form:label path="sa_title">제목</form:label>
			<form:input path="sa_title" />
			<form:errors path="sa_title" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="sa_contents">내용</form:label>
			<form:textarea path="sa_contents" rows="10" style="resize:none"></form:textarea>
			<form:errors path="sa_contents" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="upload_file">첨부 파일</form:label>
			<form:input type="file" path="upload_file" accept="image/*"/>
		</div>
		<div >
		<div>
			<form:button>작성하기</form:button>
		</div>
		</div>			
			</form:form>
	</div>

<!-- ===============================  footer  =============================== -->
<%--  <c:import url="/WEB-INF/views/include/footer.jsp"/> --%>
<!-- ===============================  footer  =============================== -->


</body>
</html>
