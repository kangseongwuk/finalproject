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
						<label for="nb_writer">관리자</label>
						<input type="text" id="nb_writer" name="nb_writer" value="${nbReadBean.nb_writer }" disabled="disabled">

					</div>
					<div>
						<label for="nb_writeTime">작성날짜</label>
						<input type="text" id="nb_writeTime" name="nb_writeTime" value="${nbReadBean.nb_writeTime }" disabled="disabled"/>
					</div>
					<div>
						<label for="nb_viewCount">조회수</label>
						<input type="number" id="nb_viewCount" name="nb_viewCount" value="${nbReadBean.nb_viewCount }" disabled="disabled"/>
					</div>
					<div>
						<label for="nb_title">제목</label>
						<input type="text" id="nb_title" name="nb_title" value="${nbReadBean.nb_title }" disabled="disabled"/>
					</div>
					<div>
						<label for="nb_contents">내용</label>
						<textarea id="nb_contents" name="nb_contents" rows="10" style="resize:none" disabled="disabled">${nbReadBean.nb_contents }</textarea>
					</div>
					<c:if test="${nbReadBean.nb_file != null }">
						<div>
							<label for="nb_file">첨부 이미지</label>
							<img src="${root }upload/${nbReadBean.nb_file}" width="100%"/>						
						</div>
					</c:if>
					<div>
						<div>
							<a href="${root }serviceBoard/noticeBoardList">목록보기</a>
							<a href="${root}index">돌아가기</a>
							<a href="${root }noticeBoardModify?nb_no=${nbReadBean.nb_no}">수정하기</a>
							<a href="${root }noticeBoardDelete?nb_no=${nbReadBean.nb_no}">삭제하기</a>
							
						</div>
					</div>

</body>
</html>