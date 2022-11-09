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
<head>

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

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>
  <!-- preloader start -->
  <div class="preloader">
    <img src="images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

<!-- header -->
<header class="fixed-top header">
  <!-- top header -->
  <div class="top-header py-2 bg-white">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-4 text-center text-lg-left">
        
        </div>
        <div class="col-lg-8 text-center text-lg-right">
          <ul class="list-inline">
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#loginModal" data-toggle="modal" data-target="#loginModal">로그인</a></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#signupModal" data-toggle="modal" data-target="#signupModal">회원가입</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- navbar -->
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-dark p-0">
        <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation"
          aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center">
            <li class="nav-item active">
              <a class="nav-link" href="">회사 소개</a> <!-- 바꿀 예정 -->
            </li>
            <li class="nav-item @@about">
              <a class="nav-link" href="board/gBoardList">종합</a>
            </li>
            <li class="nav-item @@courses">
              <a class="nav-link" href="courses.html">단과</a>
            </li>
            <li class="nav-item @@events">
              <a class="nav-link" href="events.html">예체능</a>
            </li> 
            <li class="nav-item @@contact">
              <a class="nav-link" href="contact.html">이벤트</a>
            </li>             
            <li class="nav-item dropdown view">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                고객센터
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="teacher.html">공지사항</a></li>
                <li><a class="dropdown-item" href="teacher-single.html">FAQ</a></li>
                <li><a class="dropdown-item" href="notice.html">문의하기</a></li>
                
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
</body>
</html>