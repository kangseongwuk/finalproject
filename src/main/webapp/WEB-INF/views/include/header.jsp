<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!-- <c:url var='root' value='/'/> --> 
<c:set var='root' value="${pageContext.request.contextPath }/"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title>:: SKYCASTLE ::</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">
  
  <!-- theme meta -->
  <meta name="theme-name" content="educenter" />

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- veskycastlelogo.pngnobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<fmt:parseDate value="${today}" var="registered" pattern="yyyy.MM.dd HH:mm:ss" />
<fmt:formatDate value="${rsp.merchant_uid}" pattern="yyyyMMdd" />
<script>

	var IMP = window.IMP; 
	IMP.init("imp71151373");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
	today = new Date();
	
	function requestPay() {
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: new Date(),
	        name : 'SkyCastle 한달구독',
	        amount : 100,
	        buyer_email : '1',
	        buyer_name : '',
	        buyer_tel : '',
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        result ='0';
		        
		        var sdata = new Object();
		        sdata.a_memberNo = ${sessionScope.loginMemberBean.m_memberNo}
		        sdata.a_payStart = rsp.merchant_uid
		        sdata.a_payEnd = rsp.merchant_uid
		        sdata.amount = rsp.paid_amount
		        
		         $.ajax({ 
		            url: "${root}pay/send.do", 
		            type: "POST",
		            //dataType: "JSON",
		            contentType: "application/json; charset=utf-8",
		            data: JSON.stringify(sdata),
		            success : function() {	            	
		            },
		       		error : function(request,status,error) {
		       			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       		}
		        }) 
	        } else {
	        	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result ='1';
	        }
	        if(result=='0') {
		    	location.href= "${root }pay/pay_success";
		    	
		    	
		    }
		    alert(msg);
	    });
	}
</script>
<body>
<script>
	$(function(){
		$("#kakao").click(function(){
			$.ajax({
				url : "${root}member/kakao",
				type : "POST",
				data : {
					m_id : $("#id").val(),
					m_email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				}
			})
		});
	})
</script>
<body>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "ae255e6e-f6f6-4695-ac0f-186990ce3633"
  });
</script>
<!-- End Channel Plugin -->

  <!-- preloader start -->
  <div class="preloader">
    <img src="images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

<header class="fixed-top header">
  <!-- top header -->
  <div class="top-header py-2 bg-white">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-4 text-center text-lg-left">
        
        </div>
        <div class="col-lg-8 text-center text-lg-right">
          <ul class="list-inline">
          	<li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${root }pay/pay_howlong?a_memberNo=${sessionScope.loginAcademyMemberBean.a_memberNo}">멤버십(test)</a></li>
            <c:if test="${sessionScope.loginMemberBean.m_memberNo == null }">
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#loginModal" data-toggle="modal" data-target="#loginModal">회원 로그인</a></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#loginModal2" data-toggle="modal" data-target="#loginModal2">학원 로그인</a></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${root }member/join" >회원가입</a></li>
            </c:if>
            <c:if test="${sessionScope.loginMemberBean.m_memberNo != null }">
            <li class="list-inline-item"><button onclick="requestPay()" class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block">구독(삭제예정)</button></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${root }member/logout" >로그아웃</a></li>
          	<li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${root }member/mypage" >마이페이지</a></li>
          	</c:if>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- navbar -->
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-dark p-0">
        <a class="navbar-brand" href="${root }index"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation"
          aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center">
            <li class="nav-item @@active">
              <a class="nav-link" href="${root }board/about">회사 소개</a> 
            </li>
            <li class="nav-item @@about">
              <a class="nav-link" href="${root }board/gBoardList">종합</a>
            </li>
            <li class="nav-item @@courses">
              <a class="nav-link" href="${root }courses">단과</a>
            </li>
            <li class="nav-item @@events">
              <a class="nav-link" href="${root }courses">예체능</a>
            </li> 
            <!-- <li class="nav-item @@contact">
              <a class="nav-link" href="contact.html">이벤트</a>
            </li>  -->            
            <li class="nav-item dropdown view">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                고객센터
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              
                <li><a class="dropdown-item" href="${root }serviceBoard/noticeBoardList">공지사항</a></li>
                <li><a class="dropdown-item" href="${root }faq/faqBoard">FAQ</a></li>
                <c:if test="${sessionScope.loginMemberBean.m_memberNo != null }">
                <li><a class="dropdown-item" href="${root }serviceBoard/siteAskWrite?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">문의하기</a></li>
                </c:if>
                <!-- 블랙리스트는 학원 로그인 시에만 출력될 수 있도록 -->
                <c:if test="${sessionScope.loginMemberBean.m_memberNo != null }">
                <li><a class="dropdown-item" href="${root }blackList/blackListList">블랙리스트</a></li>
                </c:if>
                
           <!--    <li><a class="dropdown-item" href="notice-single.html">블랙리스트</a></li> -->
               
                
                <!-- <li class="dropdown-item dropdown dropleft">
                  <a class="dropdown-toggle" href="#" id="navbarDropdownSubmenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sub Menu
                  </a>
                  <ul class="dropdown-menu dropdown-submenu" aria-labelledby="navbarDropdownSubmenu">
                    <li><a class="dropdown-item" href="#!">Sub Menu 01</a></li>
                    <li><a class="dropdown-item" href="#!">Sub Menu 02</a></li>
                    <li><a class="dropdown-item" href="#!">Sub Menu 03</a></li>
                  </ul>
                </li> -->
              </ul>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->
<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>회원 로그인</h4>
					</div>
					<div class="d-flex flex-column text-center">
					<!-- ==================로그인================== -->
						<form:form action="${root}member/login_pro" method="post" modelAttribute="loginMemberBean">
							<div class="form-group">
								<form:input path="m_id" class="form-control" placeholder="ID"/>
									<form:errors path="m_id" style="color:red"/>
							</div>
							<div class="form-group">
								<form:input path="m_pw" class="form-control"  placeholder="Password"/>
									<form:errors path="m_pw" style="color:red"/>
							</div>
							<form:button type="submit" class="btn btn-primary">로그인</form:button>
						</form:form>
						<div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
						<div class="text-center text-muted delimiter"><a href="${root }member/findpw">비밀번호 찾기</a></div>
  <!-- 카카오 로그인 -->
         <c:if test="${userId eq null}">
            <a class="p-2"  id="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=d74b9f388e687f66d7d888fd0bb9d36b&redirect_uri=http://localhost:8700/member/kakao&response_type=code">
           <img src="images/kakao_login_large_narrow.png" style="width:100%"/>
         </a>
      </c:if>
      <c:if test="${userId ne null}">
             <h3>로그인 성공입니다</h3>
           <input type="button" value="로그아웃" onclick="location.href='${root }member/logout'">
       </c:if>

						<div class="d-flex justify-content-center social-buttons">
						
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Google">
								<i class="fab fa-google"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Facebook">
								<i class="fab fa-facebook"></i>
							</button>
							<button type="button" onclick class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="twitter">
								<i class="fab fa-twitter"></i>
							</button>
						</div>
					</div>
					<!-- ==================로그인================== -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- 학원 로그인 -->
	<div class="modal fade" id="loginModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>학원 로그인</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form>
							<div class="form-group">
								<input type="text" class="form-control" id="id2" name="id2"
									placeholder="ID">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password2"
									name="password2" placeholder="Password">
							</div>
							<button type="button" class="btn btn-info btn-block btn-round"
								type="submit">로그인</button>
						</form>
						<div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
						<div class="d-flex justify-content-center social-buttons">
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Google">
								<i class="fab fa-google"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Facebook">
								<i class="fab fa-facebook"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="twitter">
								<i class="fab fa-twitter"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>