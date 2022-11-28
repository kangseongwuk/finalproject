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
      <a href="${root}index"><img src="images/logo.png" alt="logo"></a>
      <div class="wc_message">
        <h3>지금바로 가입하세요!</h3>
      </div>
      <div class="btn-back">
        <i class="fas fa-2x fa-angle-left angle-left-color"></i>
        BACK
      </div>
    </article>

<article class="form-area" style="position: absolute;top: 17%;left: 40%;width: 20%;height: 70%;padding: 20px 0px;
																			background: white;box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px;
																			border-radius: 10px;z-index: 2;opacity: 1;transition: opacity 0.5s ease-in 0.2s;">
      <!-- Form area Sign Up -->
      <div class="organize-form form-area-signup" style="opacity: 1;">
        <h2>회원가입</h2>
        <form:form class="form" action="${root }member/join_pro" method="post" modelAttribute="joinMemberBean">
            <form:label path="m_id">ID</form:label>
          <div class="form-field">
            <form:input type="text" path="m_id"/>
			<form:errors path="m_id" style="color:red"/>
          </div>

            <form:label path="m_pw">Password</form:label>
          <div class="form-field">
            <form:input type="password" path="m_pw"/>
			<form:errors path="m_pw" style="color:red"/>
          </div>

            <form:label path="m_name">이름</form:label>
          <div class="form-field">
            <form:input type="text" path="m_name"/>
			<form:errors path="m_name" style="color:red"/>
          </div>
          
            <form:label path="m_birth">생년월일</form:label><br>
          <div class="form-field">
            <form:input type="text" path="m_birth" placeholder="6자리 입력"/>
			<form:errors path="m_birth" style="color:red"/>
          </div><br>
            <form:label path="m_birth">성별</form:label><br>
          <div class="form-field">
                   <form:select path="m_gender" style="padding:2%">
            <form:option value="1" label="남 자"/>
            <form:option value="2" label="여 자"/>
         </form:select>
		</div><br>
            <form:label path="m_tele">전화번호</form:label><br>
          <div class="form-field">
            <form:input type="tele" path="m_tele" placeholder="-빼고 입력" />
			<form:errors path="m_tele" style="color:red"/>
          </div>
          
            <form:label path="m_email">이메일</form:label>
          <div class="form-field">
            <form:input type="email" path="m_email"/>
			<form:errors path="m_email" style="color:red"/>
          </div>
          <form:hidden path="m_classify" value="100"/>
          <form:button class="btn-sign btn-up" type="submit">회원가입 완료</form:button>
        </form:form>
       
      </div>

       <div class="organize-form form-area-signin">
         <h2>학원 회원가입</h2>
       <form:form class="form" action="${root}academymember/join_pro" method="post" modelAttribute="joinAcademyMemberBean">
         <form:label path="a_id">아이디</form:label>
      <div class="form-field">
         <form:input path="a_id"/>
         <form:errors path="a_id"></form:errors>
      </div>
         <form:label path="a_pw">비밀번호</form:label>
      <div class="form-field">
         <form:input path="a_pw"/>
         <form:errors path="a_pw"></form:errors>
      </div>
         <form:label path="a_name">이름</form:label>
      <div class="form-field">
         <form:input path="a_name"/>
         <form:errors path="a_name"/>
      </div>
         <form:label path="a_CRN">사업자등록번호</form:label>
      <div class="form-field">
         <form:input path="a_CRN"/>
         <form:errors path="a_CRN"/>
      </div>
      <br>
      <form:label path="a_location">지역(동까지)</form:label>
      <div class="form-field">
      		<select tabindex="0" id="sido" name="sido" style="padding:2%"><option value="">지역 선택</option></select>
			<select tabindex="0" id="sigugun" name="sigugun" style="padding:2%"><option value="">구-시선택</option></select>
			<select tabindex="0" id="dong" name="dong" style="padding:2%"><option value="">구-시선택</option></select>
		 <form:input type="hidden" path="a_location" value=""></form:input>
         <!--<form:label path="a_location">지역(동까지)</form:label>
         <form:input path="a_location"/>
         <form:errors path="a_location"/>-->
      </div>
      <hr>
      <br>
         <form:label path="a_locationDetail">상세주소</form:label>
      <div class="form-field">
         <form:input path="a_locationDetail"/>
         <form:errors path="a_locationDetail"/>
      </div>
         <form:label path="a_tele">학원대표전화번호</form:label>
      <div class="form-field">
         <form:input path="a_tele"/>
         <form:errors path="a_tele"/>
      </div>
      	<form:label path="a_classify">학원분류</form:label>
      <div class="form-field">
         <form:select path="a_classify" style="padding:2%">
            <form:option value="1" label="종합"/>
            <form:option value="2" label="단과"/>
            <form:option value="3" label="예체능(기타)"/>
         </form:select>
      </div>
   
         <form:button class="btn-sign btn-in" type="submit">회원가입 완료</form:button>
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
      <script type="text/javascript">
      	jQuery(document).ready(function () {
    		//sido option 추가
    		jQuery.each(hangjungdong.sido, function (idx, code) {
    			//append를 이용하여 option 하위에 붙여넣음
    			jQuery('#sido').append(fn_option(code.sido, code.codeNm));
    		});

    		//sido 변경시 시군구 option 추가
    		jQuery('#sido').change(function () {
    			/* //시도 히든 값
    			if($('#sido option:selected').val()=="") {
    				$('#sido_text').val("");
    			}else {
    				$('#sido_text').val($('#sido option:selected').text());
    			}
    			$('#sigugun_text').val(""); */
    			
    			jQuery('#sigugun').show();
    			jQuery('#sigugun').empty();
    			jQuery('#sigugun').append(fn_option('', '선택')); //
    			jQuery.each(hangjungdong.sigugun, function (idx, code) {
    				if (jQuery('#sido > option:selected').val() == code.sido)
    					jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
    			});

    			//세종특별자치시 예외처리
    			//옵션값을 읽어 비교
    			if (jQuery('#sido option:selected').val() == '36') {
    				jQuery('#sigugun').hide();
    				//index를 이용해서 selected 속성(attr)추가
    				//기본 선택 옵션이 최상위로 index 0을 가짐
    				jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
    				//trigger를 이용해 change 실행
    				jQuery('#sigugun').trigger('change');
    			}
    		});

    		//시군구 변경시 행정동 옵션추가
    		jQuery('#sigugun').change(function () {
    			/* //시군구 히든 값
    			if($('#sigugun option:selected').val()=="") {
    				$('#sigugun_text').val("");
    			}else {
    				$('#sigugun_text').val($('#sigugun option:selected').text());
    			} */
    			
    			
    			
    			//option 제거
    			jQuery('#dong').empty();
    			jQuery.each(hangjungdong.dong, function (idx, code) {
    				if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
    					jQuery('#dong').append(fn_option(code.dong, code.codeNm));
    			});
    			//option의 맨앞에 추가
    			jQuery('#dong').prepend(fn_option('', '선택'));
    			//option중 선택을 기본으로 선택
    			jQuery('#dong option:eq("")').attr('selected', 'selected');
    			
    		});
    		
    		
    		jQuery('#dong').change(function () {
    			var sido = jQuery('#sido option:selected');
    			var sigugun = jQuery('#sigugun option:selected');
    			var dong = jQuery('#dong option:selected');

    			var dongName = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
    			jQuery('#a_location').val(dongName);

    			/* var dongCode = sido.val() + sigugun.val() + dong.val() + '00'; // 읍면동코드
    			jQuery('#dongCode').text(dongCode); */
    			//동네예보 URL
    			//var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';
    			//iframe으로 결과 보기
    			//fn_iframe(url);
    		});
    		
    	});

    	function fn_option(code, name) {
    		return '<option value="' + code + '">' + name + '</option>';
    	}
    	/* function fn_iframe(url) {
    		jQuery('#iframe').attr('src', url);
    	} */
      </script>
   </form:form>
       
       </div>
       
    </article>

    <article class="signup-right">
      <i class="fas fa-2x fa-bars bars-style"></i>

    </article>
  </section>
</main>

<!-- Main Script -->
<script src="js/form.js"></script>