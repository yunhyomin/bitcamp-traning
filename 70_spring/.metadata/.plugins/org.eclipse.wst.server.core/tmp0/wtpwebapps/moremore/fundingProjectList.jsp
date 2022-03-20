<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>moremore - 펀딩 리스트</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0" />
	<link rel="shortcut icon" href="#">
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        console.log("home 실행");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        getJSONfundingList(); 
        
          $("#hashTagBeauty").on("click", function () {
            console.log("hashTagBeauty 실행~~");
        	  var pro_cateno = "pro_cateno=4";
        	  getJSONfundingCateItemList(pro_cateno);
          })
          
    	  $("#hashTagAnimal").on("click", function () {
            console.log("hashTagAnimal 실행~~");
    		  var pro_cateno = "pro_cateno=2";
    		  getJSONfundingCateItemList(pro_cateno);
          })
          
    	  $("#hashTagFood").on("click", function () {
            console.log("hashTagFood 실행~~");
    		  var pro_cateno = "pro_cateno=5";
    		  getJSONfundingCateItemList(pro_cateno);
    	  	})
    	  	
    	  $("#hashTagTach").on("click", function () {
            console.log("hashTagTach 실행~~");
    		  var pro_cateno = "pro_cateno=1";
    		  getJSONfundingCateItemList(pro_cateno);
    	  	})
    	  	
    	  $("#hashTagTravel").on("click", function () {
            console.log("hashTagTravel 실행~~");
    		  var pro_cateno = "pro_cateno=3";
    		  getJSONfundingCateItemList(pro_cateno);
    	  	})
    	  	
    	  $("#hashTagHomeLiving").on("click", function () {
            console.log("hashTagHomeLiving 실행~~");
    		  var pro_cateno = "pro_cateno=6";
    		  getJSONfundingCateItemList(pro_cateno);
    	  	})
        
     	 });
      
      // 메인페이지에서 펀딩 리스트 공간 기본 상태
      function getJSONfundingList() {
          console.log(">> getJSONfundingList() 실행~~~");

          $.ajax("fundingCateItemList.do?pro_cateno=4", {
        	  type: "get",
              dataType: "json", 
              contentType: "application/json; UTF-8;",
           
              success: function (data) {
            	  const list = data["projectList"];
            	  var result = data.json;
                  console.log("getJSONfundingCateItemList 함수 실행~~~");
                  console.log(data);
                  console.log(list);

                  console.log(JSON.stringify(data))
                  console.log(result);
                
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
    	             result += "<li class='projectCardItem'>";
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
      
	   // 카테고리 버튼 클릭 시 변경 상태
	      function getJSONfundingCateItemList(pro_cateno) {
        console.log(">> getJSONfundingCateItemList() 실행~~~");
        console.log("pro_cateno : " + pro_cateno);
        
        $.ajax("fundingCateItemList.do?" + pro_cateno, {
          type: "get",
          dataType: "json", 
          contentType: "application/json; UTF-8;",
       
          success: function (data) {
        	  const list = data["projectList"];
        	  var result = data.json;
              console.log("getJSONfundingCateItemList 함수 실행~~~");
              console.log(data);
              console.log(list);

              console.log(JSON.stringify(data))
              console.log(result);
            
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
	             result += "<li class='projectCardItem'>";
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
	   
    </script>
</head>
<body>
	<%@include file="homeHeader.jsp" %>
	<!-- <div class="lightPink" id="headerSlide"> -->
	<div id="projectCate">
		<h3 class="fundingProjectPageTitle">펀딩에 참여하고 리워드를 받아요!</h3>
		<div class="containerHashTagArea">
			<ul class="containerHashTagMenu" style="padding-left: 300px;">
				<li class="fundingHashTagBtn" id="hashTagAll"><a>전체</a></li>
				<li class="fundingHashTagBtn" id="hashTagBeauty"><a>뷰티</a></li>
				<li class="fundingHashTagBtn" id="hashTagAnimal"><a>반려동물</a></li>
				<li class="fundingHashTagBtn" id="hashTagFood"><a>푸드</a></li>
				<li class="fundingHashTagBtn" id="hashTagTach"><a>테크</a></li>
				<li class="fundingHashTagBtn" id="hashTagTravel"><a>여행</a></li>
				<li class="fundingHashTagBtn" id="hashTagHomeLiving"><a>홈리빙</a></li>
			</ul>
		</div>
	</div>
	<div id="containerWrapper">
		<div class="container" style="margin-bottom: 300px; height: 1200px;">
			
			<div class="projectWrapper" id="">
				<ul id="projectHashTagList" class="projectCard">
				</ul>
			</div>	
			</div>
		</div>
	<%@include file="homeFooter.jsp" %>
</body>
<script>
	go_info = (e) => {
		location.href="project/goProjectStart.do?pro_no="+e;
	}
</script>
</html>
