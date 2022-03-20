<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>moremore - 검색 결과</title>
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
        
        var keyword = "<c:out value='${keyword}'/>";
        console.log("keyword : " + keyword );
                
        getJSONSearchItemList(keyword);
        
     	});
      
   // 해시태그 버튼 클릭 시 변경 상태
      function getJSONSearchItemList(keyword) {
          console.log(">> getJSONSearchItemList() 실행~~~");
          console.log("keyword : " + keyword);

          $.ajax("searchItemList.do?keyword=" + keyword, {
            type: "get",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
         
            success: function (data) {
          	  var result = data.json;
              console.log("함수 실행~~~");
              console.log(data.length);
              
              // 데이터 넣기 전 공백으로 초기화 
              $("#projectSearchItmeList").html("");

	              var result = "";
              if(data.length >= 1){
	              $.each(data, function(index, item){
	  	          	 console.log(index + " " + item.pro_stitle);
	  	          	 var proGprice = item.pro_gprice * 1;
	  	          	 var paymentPrice = item.pro_status * 1;
	  	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);
	  	          	 console.log("paymentPrice : " + paymentPrice);
	  	          	 console.log("proGprice : " + proGprice);
	  	          	 console.log("pro_percent : " + pro_percent);
	  	             result += "<li class='projectCardItem' onclick='go_info("+item.pro_no+")'>";
	  	             result += "<div class='projectThumbnailWrapper'>";
	  	             result += "<img class='projectThumbnail' src='" + item.pro_thumbnail_path + "'></div>";
	  	             result += "<div class='projectContent'>";
	  	             result += "<p>" + item.pro_stitle + "</p>";
	  	             result += "<span class='greyColor' style='color:#00a2a2;'>" + pro_percent + "</span>";
	  	             result += "<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>";
	  	             result += "<span class='greyColor floatRight' style='color:#286DB4;'>" + item.pro_close_dt + "일 남음</span></div></li>";
	          	});
	              console.log("result : " + result);
	              $("#projectSearchItmeList").html(result);
              } else {
            	 result += "<li style='padding-left: 600px;'>검색결과가 존재하지 않습니다.</li>"
                 console.log("result : " + result);
	             $("#projectSearchItmeList").html(result);
              }
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
	      go_info = (e) => {
	    	  location.href="project/goProjectStart.do?pro_no="+e;
	      }
    </script>
</head>
<body>
	<%@include file="homeHeader.jsp" %>
	<!-- <div class="lightPink" id="headerSlide"> -->
	<div id="projectCate">
		<h3 class="fundingProjectPageTitle"> ${keyword} 검색 결과</h3>
	</div>
	<div id="containerWrapper">
		<div class="container" style="margin-bottom: 300px;">
			<div class="projectWrapper">
				<ul id="projectSearchItmeList" class="projectCard">
				</ul>
			</div>	
			</div>
		</div>
	<%@include file="homeFooter.jsp" %>
</body>
</html>
