<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<head>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title>Educenter - Education HTML Template</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

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
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	var convertData = {
		"grade": [
			"미취학", "초1", "초2", "초3", "초4", "초5", "초6", "중1", "중2", "중3", "고1", "고2", "고3", "재수생 이상"
		],
		"a_classify": {
			"1":"종합",
			"2":"단과",
			"3":"예체능(기타)"
		}
	}
	
	window.onload = convertPro();
	
	function convertPro() {
		$('#gradeSpace').html(convertData.grade[${academyInfoBasic.a_gradeMin }] + " ~ " + convertData.grade[${academyInfoBasic.a_gradeMax }]);
		$('#a_classifySpace').html(convertData.a_classify[${academyInfoBasic.a_classify }]);
		//alert("이건 되냐?");
		//alert(convertData.a_classify[${academyInfoBasic.a_classify }]);
		
	}
});

</script>

<body>
  <!-- preloader start -->
  <div class="preloader">
    <img src="images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->



<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="courses.html">Home</a></li>
          <li class="list-inline-item text-white h3 font-secondary nasted">종합 학원</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">학원 상세페이지</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- section -->
<section class="section-sm">
  <div class="container">
    <div class="row">
      <div class="col-12 mb-4">
        <!-- course thumb -->
        <img src="images/courses/course-single.jpg" class="img-fluid w-100">
      </div>
    </div>
    <!-- course info -->
    <div class="row align-items-center mb-5">
      <div class="col-xl-3 order-1 col-sm-6 mb-4 mb-xl-0">
        <h2>${academyInfoBasic.a_name }</h2>
      </div>
      <div class="col-xl-6 order-sm-3 order-xl-2 col-12 order-2">
        <ul class="list-inline text-xl-center">
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
              <i class="ti-book text-primary icon-md mr-2"></i>
              <div class="text-left">
                <h6 class="mb-0">지역</h6>
                <p class="mb-0">${academyInfoBasic.a_location }</p>
              </div>
            </div>
          </li>
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
              <i class="ti-alarm-clock text-primary icon-md mr-2"></i>
              <div class="text-left">
                <h6 class="mb-0">전화번호</h6>
                <p class="mb-0">${academyInfoBasic.a_tele }</p>
              </div>
            </div>
          </li>
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
              <i class="ti-wallet text-primary icon-md mr-2"></i>
              <div class="text-left">
                <h6 class="mb-0">학원분류</h6>
                <p class="mb-0" id="a_classifySpace">${academyInfoBasic.a_classify}</p>
              </div>
            </div>
          </li>
        </ul>
      </div>
       
      <div class="col-xl-3 text-sm-right text-left order-sm-2 order-3 order-xl-3 col-sm-6 mb-4 mb-xl-0">
        <a href="course-single.html" class="btn btn-primary">찜하기</a>
        <a href="course-single.html" class="btn btn-primary">상담예약</a>
      </div>
      <!-- border -->
      <div class="col-12 mt-4 order-4">
        <div class="border-bottom border-primary"></div>
      </div>
    </div>
   
   <!-- scroll -->
  
  <div>
  <ul class="list">
    <li><a href="#scroll1" class="scroll_move">학원소개</a><li>
    <li><a href="#scroll2" class="scroll_move">강사소개</a><li>
    <li><a href="#scroll3" class="scroll_move">리뷰</a><li>
    <!-- <li><a href="#scroll4" class="scroll_move">scroll4</a><li> -->
  </ul>
</div>
<div class="listbox">

<!-- /scroll -->  

    <!-- course details -->
    
    <div class="row">
      <div class="col-12 mb-4">
      <div class="scroll1" id="scroll1"></div>
        <h3>학원소개</h3>
        
        <p>${academyInfoBasic.a_introduce }</p>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">과목</h3>
        <div class="col-12 px-0">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-styled">
                <c:forEach var="sub" items="${academyInfoSubject }">
                	<li>${sub.a_subject }</li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">상세주소</h3>
        <div class="col-12 px-0">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-styled">
                <li>${academyInfoBasic.a_location } / ${academyInfoBasic.a_locationDetail }</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">수업 학년</h3>
        <div class="col-12 px-0">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-styled">
                <li id="gradeSpace" >${academyInfoBasic.a_gradeMin } ~ ${academyInfoBasic.a_gradeMax }</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">학원 운영 시간</h3>
        <div class="col-12 px-0">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-styled">
                <li> ${academyInfoBasic.a_openTime } ~ ${academyInfoBasic.a_closeTime }</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">셔틀 유무</h3>
        <div class="col-12 px-0">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-styled">
                <li> ${academyInfoBasic.a_shuttle }</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 mb-4">
        <h3 class="mb-3">How to Apply</h3>
        <ul class="list-styled">
          <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum
            dolor. Lorem, ipsum.</li>
          <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum
            dolor. Lorem, ipsum.</li>
          <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum
            dolor. Lorem, ipsum.</li>
          <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum
            dolor. Lorem, ipsum.</li>
          <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum
            dolor. Lorem, ipsum.</li>
        </ul>
      </div>
      </div>      
    </div>
  </div>
</section>
<!-- /section -->

<!-- teachers carousel -->
<section class="section text-center">
<h2>강사진</h2>
<div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2" data-ride="carousel">
  <!--Controls-->
  <div class="controls-top">
      <a class="carousel-control-prev" href="#carousel-example-multi" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
      </a>
      	<a class="carousel-control-next" href="#carousel-example-multi" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!--/.Controls-->

  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-multi" data-slide-to="0" class="active"></li>
    <% int i = 0; %>
    <c:forEach items="${academyInfoTeacher}">
    	<% i++; %>
    	<li data-target="#carousel-example-multi" data-slide-to=<%=i %>></li>
    </c:forEach>
  </ol>
  <!--/.Indicators-->

  <div class="carousel-inner v-2" role="listbox">

    <div class="carousel-item active">
      <div class="col-12 col-md-4">
        <div class="card mb-2">
          <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg"
            alt="Card image cap">
          <div class="card-body">
            <h4 class="card-title font-weight-bold">마음에 드는 강사에게 리뷰를 남겨주세요.</h4>
            <p class="card-text"></p>
            <a class="btn btn-primary btn-md btn-rounded">Button</a>
          </div>
        </div>
      </div>
    </div>
    <c:forEach var="ait" items="${academyInfoTeacher}">
	    <div class="carousel-item">
	      <div class="col-12 col-md-4">
	        <div class="card mb-2">
	          <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (34).jpg"
	            alt="Card image cap">
	          <div class="card-body">
	            <h4 class="card-title font-weight-bold">${ait.t_name }</h4>
	            <p class="card-text" style="font-weight:bold">${ait.t_subject }</p>
	            <p class="card-text">${ait.t_contents }</p>
	            <a class="btn btn-primary btn-md btn-rounded">상세보기</a>
	          </div>
	        </div>
	      </div>
	    </div>
    </c:forEach>
  </div>
</div>
</section>
<!-- /teachers carousel -->

<!-- comment -->

<div class="col-lg-12">
		<form class="comment-form my-5" id="comment-form">
			<h4 class="mb-4">리뷰남기기</h4>
			<div class="row">
			</div>


			<textarea class="form-control mb-4" name="comment" id="comment" cols="30" rows="5"
				placeholder="Comment"></textarea>
		   <div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" />
  <label for="5-stars" class="star">&#9733;</label>
  <input type="radio" id="4-stars" name="rating" value="4" />
  <label for="4-stars" class="star">&#9733;</label>
  <input type="radio" id="3-stars" name="rating" value="3" />
  <label for="3-stars" class="star">&#9733;</label>
  <input type="radio" id="2-stars" name="rating" value="2" />
  <label for="2-stars" class="star">&#9733;</label>
  <input type="radio" id="1-star" name="rating" value="1" />
  <label for="1-star" class="star">&#9733;</label>
</div>

			<input class="btn btn-main-2 btn-round-full" type="submit" name="submit-contact" id="submit_contact"
				value="댓글 쓰기">
		</form>
	</div>


<div class="col-lg-12">
		<div class="comment-area mt-4 mb-5">
			<h4 class="mb-4">2개의 리뷰가 있습니다. </h4>
			<ul class="comment-tree list-unstyled">
				<li class="mb-5">
					<div class="comment-area-box d-block d-sm-flex">
						<div class="comment-thumb">
							<img alt="" src="images/blog/testimonial1.jpg" style="width: 70px">
						</div>
						<div class="block">
							<div class="comment-info">
								<h5 class="mb-1">임성찬</h5>
								<span class="date-comm">| 2022.11.14 16:28</span>
							</div>
							<div class="comment-meta mt-2">
							</div>

							<div class="comment-content mt-3">
								<p>학원 재미없어요 </p>
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="comment-area-box d-block d-sm-flex">
						<div class="comment-thumb">
							<img alt="" src="images/blog/testimonial2.jpg" style="width: 70px">
						</div>

						<div class="block">
							<div class="comment-info">
								<h5 class="mb-1">강성욱</h5>
								<span class="date-comm">| 2022.11.13 13:11</span>
							</div>

							<div class="comment-meta mt-2">
							</div>

							<div class="comment-content mt-3">
								<p>현대빈 너무 하네요 </p>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

<!-- /comment -->

<!-- ===============================  footer  =============================== -->
 <c:import url="/WEB-INF/views/include/footer.jsp"/>
<!-- ===============================  footer  =============================== -->

<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- filter -->
<script src="plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>

</body>
</html>