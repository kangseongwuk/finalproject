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

<!-- 헤더 자리 -->

	<div>
		<form:form action="${root }blackList/blackListModify_pro" method="post" modelAttribute="blModifyBean"
		enctype="multipart/form-data">
			<form:hidden path="m_memberNo"/>
			<form:hidden path="a_memberNo"/>
		<div>
			<form:label path="m_memberNo">고객명</form:label>
			<form:input path="m_memberNo" />
			<form:errors path="m_memberNo" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="a_memberNo">학원명</form:label>
			<form:input path="a_memberNo" />
			<form:errors path="a_memberNo" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="black_contents">내용</form:label>
			<form:textarea path="black_contents" rows="10" style="resize:none"></form:textarea>
			<form:errors path="black_contents" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="upload_file">첨부 이미지</form:label>
			<form:input type="file" path="upload_file" accept="image/*"/>
		</div>
		<div class="form-group">
			<div class="text-right">
			<button type="submit" class="btn btn-primary">수정완료</button>
			<a href="${root }blackList/blackListRead?m_memberNo=${m_memberNo}&a_memberNo=${a_memberNo}" class="btn btn-info">취소</a>
			</div>
		</div>		
			</form:form>
	</div>

<!-- 푸터 자리 -->


</body>
</html>
