/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.53
 * Generated at: 2022-01-10 12:38:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.spring.more.users.service.UsersVO;

public final class fundingProjectList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("jar:file:/C:/MyStudy/70_spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/moremore/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1635183043313L));
    _jspx_dependants.put("/homeHeader.jsp", Long.valueOf(1641817465995L));
    _jspx_dependants.put("/homeFooter.jsp", Long.valueOf(1641817465984L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.spring.more.users.service.UsersVO");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("	<title>moremore - 펀딩 리스트</title>\n");
      out.write("	<meta charset=\"UTF-8\" />\n");
      out.write("	<meta name=\"viewport\" content=\"width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0\" />\n");
      out.write("	<link rel=\"shortcut icon\" href=\"#\">\n");
      out.write("   	<link rel=\"stylesheet\" href=\"resources/css/styles.css\" type=\"text/css\" />\n");
      out.write("   	<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("      $(document).ready(function () {\n");
      out.write("        console.log(\"home 실행\");\n");
      out.write("        \n");
      out.write("        var link = document.location.href;\n");
      out.write("        console.log(\"link : \" + link );\n");
      out.write("        \n");
      out.write("        getJSONfundingList(); \n");
      out.write("        \n");
      out.write("          $(\"#hashTagBeauty\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagBeauty 실행~~\");\n");
      out.write("        	  var pro_cateno = \"pro_cateno=4\";\n");
      out.write("        	  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("          })\n");
      out.write("          \n");
      out.write("    	  $(\"#hashTagAnimal\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagAnimal 실행~~\");\n");
      out.write("    		  var pro_cateno = \"pro_cateno=2\";\n");
      out.write("    		  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("          })\n");
      out.write("          \n");
      out.write("    	  $(\"#hashTagFood\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagFood 실행~~\");\n");
      out.write("    		  var pro_cateno = \"pro_cateno=5\";\n");
      out.write("    		  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("    	  	})\n");
      out.write("    	  	\n");
      out.write("    	  $(\"#hashTagTach\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagTach 실행~~\");\n");
      out.write("    		  var pro_cateno = \"pro_cateno=1\";\n");
      out.write("    		  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("    	  	})\n");
      out.write("    	  	\n");
      out.write("    	  $(\"#hashTagTravel\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagTravel 실행~~\");\n");
      out.write("    		  var pro_cateno = \"pro_cateno=3\";\n");
      out.write("    		  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("    	  	})\n");
      out.write("    	  	\n");
      out.write("    	  $(\"#hashTagHomeLiving\").on(\"click\", function () {\n");
      out.write("            console.log(\"hashTagHomeLiving 실행~~\");\n");
      out.write("    		  var pro_cateno = \"pro_cateno=6\";\n");
      out.write("    		  getJSONfundingCateItemList(pro_cateno);\n");
      out.write("    	  	})\n");
      out.write("        \n");
      out.write("     	 });\n");
      out.write("      \n");
      out.write("      // 메인페이지에서 펀딩 리스트 공간 기본 상태\n");
      out.write("      function getJSONfundingList() {\n");
      out.write("          console.log(\">> getJSONfundingList() 실행~~~\");\n");
      out.write("\n");
      out.write("          $.ajax(\"fundingCateItemList.do?pro_cateno=4\", {\n");
      out.write("        	  type: \"get\",\n");
      out.write("              dataType: \"json\", \n");
      out.write("              contentType: \"application/json; UTF-8;\",\n");
      out.write("           \n");
      out.write("              success: function (data) {\n");
      out.write("            	  const list = data[\"projectList\"];\n");
      out.write("            	  var result = data.json;\n");
      out.write("                  console.log(\"getJSONfundingCateItemList 함수 실행~~~\");\n");
      out.write("                  console.log(data);\n");
      out.write("                  console.log(list);\n");
      out.write("\n");
      out.write("                  console.log(JSON.stringify(data))\n");
      out.write("                  console.log(result);\n");
      out.write("                \n");
      out.write("                // 데이터 넣기 전 공백으로 초기화 \n");
      out.write("                $(\"#projectHashTagList\").html(\"\");\n");
      out.write("                \n");
      out.write("                var result = \"\";\n");
      out.write("                $.each(data, function(index, item){\n");
      out.write("    	          	 console.log(index + \" \" + item.pro_stitle);\n");
      out.write("    	          	 var proGprice = item.pro_gprice * 1;\n");
      out.write("    	          	 var paymentPrice = item.pro_status * 1;\n");
      out.write("    	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);\n");
      out.write("    	          	 console.log(\"paymentPrice : \" + paymentPrice);\n");
      out.write("    	          	 console.log(\"proGprice : \" + proGprice);\n");
      out.write("    	          	 console.log(\"pro_percent : \" + pro_percent);\n");
      out.write("    	             result += \"<li class='projectCardItem'>\";\n");
      out.write("    	             result += \"<div class='projectThumbnailWrapper'>\";\n");
      out.write("    	             result += \"<img class='projectThumbnail' src='\" + item.pro_thumbnail_path + \"'></div>\";\n");
      out.write("    	             result += \"<div class='projectContent'>\";\n");
      out.write("    	             result += \"<p>\" + item.pro_stitle + \"</p>\";\n");
      out.write("    	             result += \"<span class='greyColor' style='color:#00a2a2;'>\" + pro_percent + \"</span>\";\n");
      out.write("    	             result += \"<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>\";\n");
      out.write("    	             result += \"<span class='greyColor floatRight' style='color:#286DB4;'>\" + item.pro_close_dt + \"일 남음</span></div></li>\";\n");
      out.write("            	});\n");
      out.write("                console.log(\"result : \" + result);\n");
      out.write("                $(\"#projectHashTagList\").html(result);\n");
      out.write("                \n");
      out.write("              },\n");
      out.write("              error: function (request, status, error) {\n");
      out.write("            	 \n");
      out.write("                alert(\n");
      out.write("                  \"Ajax 처리 실패, \" + \"\\n\" +\n");
      out.write("                    \"code : \" + request.status + \"\\n\" +\n");
      out.write("                    \"message : \" + request.responseText + \"\\n\" +\n");
      out.write("                    \"error : \" + error\n");
      out.write("                );\n");
      out.write("              },\n");
      out.write("            });\n");
      out.write("          }\n");
      out.write("      \n");
      out.write("	   // 카테고리 버튼 클릭 시 변경 상태\n");
      out.write("	      function getJSONfundingCateItemList(pro_cateno) {\n");
      out.write("        console.log(\">> getJSONfundingCateItemList() 실행~~~\");\n");
      out.write("        console.log(\"pro_cateno : \" + pro_cateno);\n");
      out.write("        \n");
      out.write("        $.ajax(\"fundingCateItemList.do?\" + pro_cateno, {\n");
      out.write("          type: \"get\",\n");
      out.write("          dataType: \"json\", \n");
      out.write("          contentType: \"application/json; UTF-8;\",\n");
      out.write("       \n");
      out.write("          success: function (data) {\n");
      out.write("        	  const list = data[\"projectList\"];\n");
      out.write("        	  var result = data.json;\n");
      out.write("              console.log(\"getJSONfundingCateItemList 함수 실행~~~\");\n");
      out.write("              console.log(data);\n");
      out.write("              console.log(list);\n");
      out.write("\n");
      out.write("              console.log(JSON.stringify(data))\n");
      out.write("              console.log(result);\n");
      out.write("            \n");
      out.write("            // 데이터 넣기 전 공백으로 초기화 \n");
      out.write("            $(\"#projectHashTagList\").html(\"\");\n");
      out.write("            \n");
      out.write("            var result = \"\";\n");
      out.write("            $.each(data, function(index, item){\n");
      out.write("	          	 console.log(index + \" \" + item.pro_stitle);\n");
      out.write("	          	 var proGprice = item.pro_gprice * 1;\n");
      out.write("	          	 var paymentPrice = item.pro_status * 1;\n");
      out.write("	         	 var pro_percent = Math.round((paymentPrice / proGprice) * 100);\n");
      out.write("	          	 console.log(\"paymentPrice : \" + paymentPrice);\n");
      out.write("	          	 console.log(\"proGprice : \" + proGprice);\n");
      out.write("	          	 console.log(\"pro_percent : \" + pro_percent);\n");
      out.write("	             result += \"<li class='projectCardItem'>\";\n");
      out.write("	             result += \"<div class='projectThumbnailWrapper'>\";\n");
      out.write("	             result += \"<img class='projectThumbnail' src='\" + item.pro_thumbnail_path + \"'></div>\";\n");
      out.write("	             result += \"<div class='projectContent'>\";\n");
      out.write("	             result += \"<p>\" + item.pro_stitle + \"</p>\";\n");
      out.write("	             result += \"<span class='greyColor' style='color:#00a2a2;'>\" + pro_percent + \"</span>\";\n");
      out.write("	             result += \"<span class='projectAchievementRate' style='color:#999DA3;'> %달성</span>\";\n");
      out.write("	             result += \"<span class='greyColor floatRight' style='color:#286DB4;'>\" + item.pro_close_dt + \"일 남음</span></div></li>\";\n");
      out.write("        	});\n");
      out.write("            console.log(\"result : \" + result);\n");
      out.write("            $(\"#projectHashTagList\").html(result);\n");
      out.write("            \n");
      out.write("          },\n");
      out.write("          error: function (request, status, error) {\n");
      out.write("        	 \n");
      out.write("            alert(\n");
      out.write("              \"Ajax 처리 실패, \" + \"\\n\" +\n");
      out.write("                \"code : \" + request.status + \"\\n\" +\n");
      out.write("                \"message : \" + request.responseText + \"\\n\" +\n");
      out.write("                \"error : \" + error\n");
      out.write("            );\n");
      out.write("          },\n");
      out.write("        });\n");
      out.write("      }\n");
      out.write("	   \n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("	");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("	<header class=\"header-wrapper greenColor\">\n");
      out.write("		<div class=\"header-contaniner\" id=\"headerContainerId\">\n");
      out.write("			<h4 class=\"headerLogo\">\n");
      out.write("				<a href=\"home.jsp\" class=\"headerLogo purple\">\n");
      out.write("				<span ><img src=\"resources/images/logo1.png\"></span>\n");
      out.write("				</a>\n");
      out.write("			</h4>\n");
      out.write("			<div class=\"headerMenuArea\">\n");
      out.write("				<ul class=\"headerMenu\">\n");
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuFunding\"><a href=\"fundingProjectList.jsp\">펀딩하기</a></li>\n");
      out.write("					<!-- <li class=\"headerMenuItem middleSize\" id=\"headerMenuBuy\"><a href=#>구매하기</a></li> -->\n");
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuGuide\"><a href=\"notice.do\" class=\"headerMenuHidden\">이용가이드</a></li>\n");
      out.write("					<li class=\"headerMenuItem moreItem\" id=\"headerMenuMoreItem\"><a href=# class=\"headerMenuHidden\">더보기</a></li>\n");
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuProjectBtnList\"><a href=\"fromHomeToAdmin.jsp\" id=\"headerMenuProjectBtn\" class=\"purple\">프로젝트 신청</a></li>\n");
      out.write("				</ul>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"headerUtil\">\n");
      out.write("				<form name=\"headerSearch\" action=\"searchFunding.do\" method=\"get\">\n");
      out.write("					<input type=\"search\" name=\"pro_stitle\" class=\"searchBar\" placeholder=\"프로젝트 검색하기\"/>\n");
      out.write("				</form>\n");
      out.write("				<!-- 비로그인 시 출력 -->\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("  \n");
      out.write("				<!-- 로그인 시 출력 -->\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	</header>");
      out.write("\n");
      out.write("	<!-- <div class=\"lightPink\" id=\"headerSlide\"> -->\n");
      out.write("	<div id=\"projectCate\">\n");
      out.write("		<h3 class=\"fundingProjectPageTitle\">펀딩에 참여하고 리워드를 받아요!</h3>\n");
      out.write("		<div class=\"containerHashTagArea\">\n");
      out.write("			<ul class=\"containerHashTagMenu\" style=\"padding-left: 300px;\">\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagAll\"><a>전체</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagBeauty\"><a>뷰티</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagAnimal\"><a>반려동물</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagFood\"><a>푸드</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagTach\"><a>테크</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagTravel\"><a>여행</a></li>\n");
      out.write("				<li class=\"fundingHashTagBtn\" id=\"hashTagHomeLiving\"><a>홈리빙</a></li>\n");
      out.write("			</ul>\n");
      out.write("		</div>\n");
      out.write("	</div>\n");
      out.write("	<div id=\"containerWrapper\">\n");
      out.write("		<div class=\"container\" style=\"margin-bottom: 300px; height: 1200px;\">\n");
      out.write("			\n");
      out.write("			<div class=\"projectWrapper\" id=\"\">\n");
      out.write("				<ul id=\"projectHashTagList\" class=\"projectCard\">\n");
      out.write("				</ul>\n");
      out.write("			</div>	\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	");
      out.write("\n");
      out.write("	<footer id=\"footer\">\n");
      out.write("      <div class=\"infoArea\">\n");
      out.write("        <div class=\"footerMenuArea\">\n");
      out.write("          <ul class=\"footerMenu\">\n");
      out.write("            <li>회사소개</li>\n");
      out.write("            <li>이용약관</li>\n");
      out.write("            <li>개인정보처리방침</li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footerArea\">\n");
      out.write("        <img src=\"resources/images/logo1.png\" style=\"display:inline; width : 150px; margin-left: 200px;\" />\n");
      out.write("          <div class=\"footerRight\">\n");
      out.write("            <ul class=footerList>\n");
      out.write("              <li><h4>모아모아</h4></li> \n");
      out.write("              <li>대표이사 : 모아모아</li>\n");
      out.write("              <li>\n");
      out.write("                주소 (우) 010101 서울특별시 비트로 999-1 비트캠프\n");
      out.write("              </li>\n");
      out.write("              <li>\n");
      out.write("                고객지원센터 : 1588-1111 \n");
      out.write("              </li>\n");
      out.write("              <li class=\"COPYRIGHT\">COPYRIGHTⓒ moremore</li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </footer>");
      out.write("\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("	go_info = (e) => {\n");
      out.write("		location.href=\"project/goProjectStart.do?pro_no=\"+e;\n");
      out.write("	}\n");
      out.write("</script>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /homeHeader.jsp(27,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty sessionScope.loginUsers }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='login.jsp'\">로그인</button>\n");
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='joinMembership.jsp'\">회원가입</button>\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /homeHeader.jsp(32,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ !empty sessionScope.loginUsers }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("		            <button type=\"button\" class=\"myPageBtn\" onclick=\"javascript:location.href='userInfo.jsp'\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ loginUsers.user_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("님</button>\n");
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='logout.do'\">로그아웃</button>\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }
}