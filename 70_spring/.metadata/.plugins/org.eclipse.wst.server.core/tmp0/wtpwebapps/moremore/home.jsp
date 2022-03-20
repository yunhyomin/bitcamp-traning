<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>moremore - 크라우드 펀딩</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0" />
	<link rel="shortcut icon" href="#">
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
   	<!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	<!-- Swiper's Style -->
   	<style>
      html, body {
        position: relative;]
        height: 100%;
      }

      body {
        background: #eee;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
        height: 400px;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
    </style>
    <script>
      $(document).ready(function () {
        console.log("home 실행");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        getJSONBestItemList();
        getJSONRecommendItemList();
        getJSONHashTagList(); 
        
          $("#hashTagBeauty").on("click", function () {
            console.log("hashTagBeauty 실행~~");
        	  var cate = "cate=1";
        	  getJSONHashTagItemCateList(cate);
          })
          
    	 	$("#hashTagAnimal").on("click", function () {
            console.log("hashTagAnimal 실행~~");
    		  var cate = "cate=2";
    		  getJSONHashTagItemCateList(cate);
          })
          
    	  	$("#hashTagFood").on("click", function () {
            console.log("hashTagFood 실행~~");
    		  var cate = "cate=3";
    		  getJSONHashTagItemCateList(cate);
    	  	})
        
      });
      
      function getJSONBestItemList() {
        console.log(">> getJSONBestItemList() 실행~~~");

        $.ajax("bestItemList.do", {
          type: "post",
          dataType: "json", 
          contentType: "application/json; UTF-8;",
       
          success: function (data) {
        	  const list = data["projectList"];
        	  var result = data.json;
              console.log("getJSONHome 함수 실행~~~");
              console.log(data);
              console.log(list);

              console.log(JSON.stringify(data))
              console.log(result);
            
            // 데이터 넣기 전 공백으로 초기화 
            $("#projectList").html("");
            
            var result = "";
            $.each(data, function(index, item){
	          	 console.log(index + " " + item.pro_stitle);
	          	 var proGprice = item.pro_gprice * 1;
	          	 var paymentPrice = item.pro_status * 1;
	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);
	          	 console.log("paymentPrice : " + paymentPrice);
	          	 console.log("proGprice : " + proGprice);
	          	 console.log("pro_percent : " + pro_percent);
	             result += "<li class='projectCardItem' onclick='go_project("+item.pro_no+")'>";
	             result += "<div class='projectThumbnailWrapper'>";
	             result += "<img class='projectThumbnail' src='" + item.pro_thumbnail_path + "'></div>";
	             result += "<div class='projectContent'>";
	             result += "<p>" + item.pro_stitle + "</p>";
	             result += "<span class='greyColor' style='color:#00a2a2;'>" + pro_percent + "</span>";
	             result += "<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>";
	             result += "<span class='greyColor floatRight' style='color:#286DB4;'>" + item.pro_close_dt + "일 남음</span></div></li>";
        	});
            console.log("result : " + result);
            $("#projectList").html(result);
            
          },
          error: function (request, status, error) {
        	 
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },
        });
      }
      
      function getJSONRecommendItemList() {
          console.log(">> getJSONRecommendItemList() 실행~~~");

          $.ajax("recommendItemList.do", {
            type: "post",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
         
            success: function (data) {
          	  var result = data.json;
                console.log("함수 실행~~~");
              
              // 데이터 넣기 전 공백으로 초기화 
              $("#projectRecommendList").html("");
              
              var result = "";
              $.each(data, function(index, item){
 	          	 console.log(index + " " + item.pro_stitle);
 	          	 var proGprice = item.pro_gprice * 1;
 	          	 var paymentPrice = item.pro_status * 1;
 	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);
 	          	 console.log("paymentPrice : " + paymentPrice);
 	          	 console.log("proGprice : " + proGprice);
 	          	 console.log("pro_percent : " + pro_percent);
 	             result += "<li class='projectCardItem' onclick='go_project("+item.pro_no+")'>";
 	             result += "<div class='projectThumbnailWrapper'>";
 	             result += "<img class='projectThumbnail' src='" + item.pro_thumbnail_path + "'></div>";
 	             result += "<div class='projectContent'>";
 	             result += "<p>" + item.pro_stitle + "</p>";
 	             result += "<span class='greyColor' style='color:#00a2a2;'>" + pro_percent + "</span>";
 	             result += "<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>";
 	             result += "<span class='greyColor floatRight' style='color:#286DB4;'>" + item.pro_close_dt + "일 남음</span></div></li>";
          	});
              console.log("result : " + result);
              $("#projectRecommendList").html(result);
              
            },
            error: function (request, status, error) {
          	 
              alert(
                "Ajax 처리 실패, " + "\n" +
                  "code : " + request.status + "\n" +
                  "message : " + request.responseText + "\n" +
                  "error : " + error
              );
            },
          });
        }      
      
      // 메인페이지에서 해시태그 공간 기본 상태
      function getJSONHashTagList() {
          console.log(">> hashTagItemList() 실행~~~");

          $.ajax("hashTagItemList.do", {
            type: "post",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
         
            success: function (data) {
          	  var result = data.json;
                console.log("함수 실행~~~");
              
              // 데이터 넣기 전 공백으로 초기화 
              $("#projectHashTagList").html("");
              
              var result = "";
              $.each(data, function(index, item){
 	          	 console.log(index + " " + item.pro_stitle);
 	          	 var proGprice = item.pro_gprice * 1;
 	          	 var paymentPrice = item.pro_status * 1;
 	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);
 	          	 console.log("paymentPrice : " + paymentPrice);
 	          	 console.log("proGprice : " + proGprice);
 	          	 console.log("pro_percent : " + pro_percent);
 	             result += "<li class='projectCardItem' onclick='go_project("+item.pro_no+")'>";
 	             result += "<div class='projectThumbnailWrapper'>";
 	             result += "<img class='projectThumbnail' src='" + item.pro_thumbnail_path + "'></div>";
 	             result += "<div class='projectContent'>";
 	             result += "<p>" + item.pro_stitle + "</p>";
 	             result += "<span class='greyColor' style='color:#00a2a2;'>" + pro_percent + "</span>";
 	             result += "<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>";
 	             result += "<span class='greyColor floatRight' style='color:#286DB4;'>" + item.pro_close_dt + "일 남음</span></div></li>";
          	});
              console.log("result : " + result);
              $("#projectHashTagList").html(result);
              
            },
            error: function (request, status, error) {
          	 
              alert(
                "Ajax 처리 실패, " + "\n" +
                  "code : " + request.status + "\n" +
                  "message : " + request.responseText + "\n" +
                  "error : " + error
              );
            },
          });
        }
      
	   // 해시태그 버튼 클릭 시 변경 상태
	      function getJSONHashTagItemCateList(cate) {
	          console.log(">> getJSONHashTagItemCateList() 실행~~~");
	          console.log("cate : " + cate);
	
	          $.ajax("hashTagItemCateList.do?" + cate, {
	            type: "get",
	            dataType: "json", 
	            contentType: "application/json; UTF-8;",
	         
	            success: function (data) {
	          	  var result = data.json;
	                console.log("함수 실행~~~");
	              
	              // 데이터 넣기 전 공백으로 초기화 
	              $("#projectHashTagList").html("");
	              
	              var result = "";
	              $.each(data, function(index, item){
	 	          	 console.log(index + " " + item.pro_stitle);
	 	          	 var proGprice = item.pro_gprice * 1;
	 	          	 var paymentPrice = item.pro_status * 1;
	 	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);
	 	          	 console.log("paymentPrice : " + paymentPrice);
	 	          	 console.log("proGprice : " + proGprice);
	 	          	 console.log("pro_percent : " + pro_percent);
	 	             result += "<li class='projectCardItem' onclick='go_project("+item.pro_no+")'>";
	 	             result += "<div class='projectThumbnailWrapper'>";
	 	             result += "<img class='projectThumbnail' src='" + item.pro_thumbnail_path + "'></div>";
	 	             result += "<div class='projectContent'>";
	 	             result += "<p>" + item.pro_stitle + "</p>";
	 	             result += "<span class='greyColor' style='color:#00a2a2;'>" + pro_percent + "</span>";
	 	             result += "<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>";
	 	             result += "<span class='greyColor floatRight' style='color:#286DB4;'>" + item.pro_close_dt + "일 남음</span></div></li>";
	          	});
	              console.log("result : " + result);
	              $("#projectHashTagList").html(result);
	              
	            },
	            error: function (request, status, error, data) {
	          	 
	              alert(
	                "Ajax 처리 실패, " + "\n" +
	                  "code : " + request.status + "\n" +
	                  "message : " + request.responseText + "\n" +
	                  "error : " + error +
	                  "data : " + data
	              );
	            },
	          });
	        }

	   go_project = (e) => {
		   location.href = "project/goProjectStart.do?pro_no="+e;
	   }
    </script>
</head>
<body>
	<%@include file="homeHeader.jsp" %>
	<!-- <div class="lightPink" id="headerSlide"> -->
	<div>
<!-- 		<img id="headerSlide" src="https://image.hago.kr/mall/display/mmon-templates/6/51/689/pc_image_1.jpg?ut=2021-11-05 18:08:53">
 -->		<!-- <img id="headerSlide" src="https://cdn.wadiz.kr/ft/images/green001/2021/1029/20211029103938521_4215.png/wadiz/optimize"> -->
	<!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img class="headerSlide" src="https://image.hago.kr/mall/display/mmon-templates/6/51/689/pc_image_1.jpg?ut=2021-11-05 18:08:53"></div>
        <div class="swiper-slide"><img class="headerSlide" src="https://image.hago.kr/mall/display/mmon-templates/6/51/844/pc_image_1.jpg?ut=2021-11-11 18:00:31"></div>
        <div class="swiper-slide"><img class="headerSlide" src="https://image.hago.kr/mall/display/mmon-templates/6/51/843/pc_image_1.jpg?ut=2021-11-11 18:00:31"></div>
        <div class="swiper-slide"><img class="headerSlide" src="https://image.hago.kr/mall/display/mmon-templates/6/51/590/pc_image_1.jpg?ut=2021-11-11 18:00:31"></div>
        <div class="swiper-slide"><img class="headerSlide" src="https://image-se.ycrowdy.com/20211022/CROWDY_0_202110222242110129_gaeul.png"></div>
      </div>
      <div class="swiper-button-next" style="color:grey;"></div>
      <div class="swiper-button-prev" style="color:grey;"></div>
      <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
	
	</div>
	<div id="containerWrapper">
		<div class="container" style="margin-top: 20px;">
			<div class="projectInfoBannerHome">
				<div class="projectInfoBannerMenuWrapper">
					<ul class="projectInfoBannerMenu centerItemTop">
						<li class="projectInfoItemTop" style="margin-right: 120px"><a href="#">206</a></li>
						<li class="projectInfoItemTop" style="margin-right: 90px"><a href="#">303,723,400</a></li>
						<li class="projectInfoItemTop"><a href="#">5,679</a></li>
					</ul>
				</div>
				<div class="projectInfoBannerMenuWrapper">
				<ul class="projectInfoBannerMenu centerItemBottom">
					<li class="projectInfoItemBottom"><a href="#">총 펀딩 프로젝트</a></li>
					<li class="projectInfoItemBottom"><a href="#">총 펀딩 금액</a></li>
					<li class="projectInfoItemBottom"><a href="#">참여 서포터 수</a></li>
				</ul>
				</div>
			</div>
			<div>
				<h3 class="mainMenuTitle" id="bestProjectTitle">인기 프로젝트</a></h3>
				<div class="projectWrapper">
					<ul id="projectList" class="projectCard">
					</ul>
				</div>				
			</div>
			<div class="">
				<h3 style="margin-top:120px;" class="mainMenuTitle" id="recommendProjectTitle">이 프로젝트 어때요?</h3>
				<div class="projectWrapper">
					<ul id="projectRecommendList" class="projectCard">
					</ul>
				</div>	
			</div>
			<div class="projectStatusBanner">
				<div style="display:flex;">
					<div>
						<ul>
							<li style="font-size: 20px; margin-right: 200px; margin-left: 200px;">오늘 이만큼 참여하셨어요!</li>
						</ul>
					</div>
					<div>
						<ul style="display:flex; font-size: 15px; margin-top: 5px;">
							<li style="padding-right: 20px; padding-top: 5px;">총 참여</li>
							<li style="padding-right: 20px; font-size:23px; color:#F4C539; font-weight: 800;">4,231명</li>
							<li style="padding-right: 20px; padding-top: 5px;">총 금액</li>
							<li style="padding-right: 20px; font-size:23px; color:#F4C539; font-weight: 800;">303,723,400원</li>
						</ul>
						<ul style="display:flex; font-size: 15px;">
							<li style="padding-right: 20px; padding-top: 5px;">오늘의 참여</li>
							<li style="padding-right: 20px; font-size:23px; color:#F4C539; font-weight: 800;">23명</li>
							<li style="padding-right: 20px; padding-top: 5px;">오늘 참여금액</li>
							<li style="padding-right: 20px; font-size:23px; color:#F4C539; font-weight: 800;">2,234,100원</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="containerHashTagArea">
				<ul class="containerHashTagMenu">
					<li class="hashTagBtn" id="hashTagBeauty">#뷰티</li>
					<li class="hashTagBtn" id="hashTagAnimal">#반려동물</li>
					<li class="hashTagBtn" id="hashTagFood">#푸드</li>
				</ul>
			</div>
			<div class="projectWrapper">
				<ul id="projectHashTagList" class="projectCard">
				</ul>
			</div>	
			<div class="projectStartBanner" >
				<p style="color:white;">좋은 아이디어가 있으신가요?</p>
				<h4 style="color:white;">지금바로 펀딩 프로젝트를 만들어서 참여해보세요!</h4> 
				<button class="IndigoBtn" type="button" onclick="go_funding()" style="margin-top: 20px;">바로 가기</button>
			</div>
			</div>
		</div>
	<%@include file="homeFooter.jsp" %>
</body>
<script>
	go_funding = () => {
		location.href="fromHomeToAdmin.jsp";
	}
</script>
</html>
