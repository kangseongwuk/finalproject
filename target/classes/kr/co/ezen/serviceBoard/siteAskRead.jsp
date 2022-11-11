<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  : 공 지 사 항 : </title>
</head><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<body>

					<div>
						<label for="m_id">아이디</label>
						<input type="text" id="m_id" name="m_id" value="${saReadBean.m_id }" disabled="disabled">
					</div>
					<div>
						<label for="m_name">이름</label>
						<input type="text" id="m_name" name="m_name" value="${saReadBean.m_name }" disabled="disabled">
					</div>
					<div>
						<label for="sa_tele">전화번호</label>
						<input type="text" id="sa_tele" name="sa_tele" value="${saReadBean.sa_tele }" disabled="disabled">
					</div>
					<div>
						<label for="m_email">이메일</label>
						<input type="text" id="m_email" name="m_email" value="${saReadBean.m_email }" disabled="disabled">
					</div>
					<div>
						<label for="sa_time">작성날짜</label>
						<input type="text" id="sa_time" name="sa_time" value="${saReadBean.sa_time }" disabled="disabled"/>
					</div>
			
					<div>
						<label for="sa_title">제목</label>
						<input type="text" id="sa_title" name="sa_title" value="${saReadBean.sa_title }" disabled="disabled"/>
					</div>
					<div>
						<label for="sa_contents">내용</label>
						<textarea id="sa_contents" name="sa_contents" rows="10" style="resize:none" disabled="disabled">${saReadBean.sa_contents }</textarea>
					</div>
					<c:if test="${saReadBean.sa_file != null }">
						<div>
							<label for="sa_file">첨부 이미지</label>
							<img src="${root }upload/${saReadBean.sa_file}" width="100%"/>						
						</div>
					</c:if>
					<div>
						<div>
							<a href="${root }serviceBoard/siteAskList">목록보기</a>
							<a href="${root}index">돌아가기</a>
							
						</div>
					</div>

</body>
</html>