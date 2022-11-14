<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<!-- Main Stylesheet -->
  <link href="css/main.css" rel="stylesheet">

 <main class="main">
  <section class="home">
    <h1>Welcome to the <span>SKYCASTLE</span></h1>
    <button id="sign-up" class="btn">일반 회원가입</button>
    <button id="sign-in" class="btn">학원 회원가입</button>
  </section>

  <section class="sign-up">
    <article class="signup-left">
      <img src="images/logo.png" alt="logo">
      <div class="wc_message">
        <h3>지금바로 가입하세요!</h3>
      </div>
      <div class="btn-back">
        <i class="fas fa-2x fa-angle-left angle-left-color"></i>
        HOME
      </div>
    </article>

    <article class="form-area">
      <!-- Form area Sign Up -->
      <div class="organize-form form-area-signup">
        <h2>회원가입</h2>
        <form:form class="form" action="${root }member/join_pro" method="post" modelAttribute="joinMemberBean">
          <div class="form-field">
            <form:label path="m_id">ID</form:label>
            <form:input type="text" path="m_id"/>
			<form:errors path="m_id" style="color:red"/>
          </div>

          <div class="form-field">
            <form:label path="m_pw">Password</form:label>
            <form:input type="password" path="m_pw"/>
			<form:errors path="m_pw" style="color:red"/>
          </div>

          <div class="form-field">
            <form:label path="m_name">이름</form:label>
            <form:input type="text" path="m_name"/>
			<form:errors path="m_name" style="color:red"/>
          </div>
          
          <div class="form-field">
            <form:label path="m_birth">주민번호</form:label>
            <form:input type="text" path="m_birth" placeholder="6자리 입력"/>
			<form:errors path="m_birth" style="color:red"/>
          </div>
          
        
          <div class="form-field">
          <form:label path="m_gender">성별</form:label>
           <form:input path="m_gender"/>
           <form:errors path="m_gender" style="color:red"/>
		</div>
          <div class="form-field">
            <form:label path="m_tele">전화번호</form:label>
            <form:input type="tele" path="m_tele" placeholder="-까지 입력" />
			<form:errors path="m_tele" style="color:red"/>
          </div>
          
          <div class="form-field">
            <form:label path="m_email">이메일</form:label>
            <form:input type="email" path="m_email"/>
			<form:errors path="m_email" style="color:red"/>
          </div>
          
          <form:button class="btn-sign btn-up" type="submit">회원가입 완료</form:button>
        </form:form>
       
      </div>

       <div class="organize-form form-area-signin"></div>
    </article>

    <article class="signup-right">
      <i class="fas fa-2x fa-bars bars-style"></i>

    </article>
  </section>
</main>

<!-- Main Script -->
<script src="js/form.js"></script>