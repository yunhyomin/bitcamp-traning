/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.53
 * Generated at: 2022-02-15 17:08:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminSalesManage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/siteAdminHeader.jsp", Long.valueOf(1637633663000L));
    _jspx_dependants.put("jar:file:/C:/MyStudy/70_spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/moremore/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1635183043313L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

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
  }

  public void _jspDestroy() {
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" href=\"resources/css/jsCalendar.css\">\n");
      out.write("    <!-- font 설정-->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!--jsCalendarAPI -->\n");
      out.write("    <script type=\"text/javascript\" src=\"calender/jsCalendar.js\"></script>\n");
      out.write("    <script src=\"calender/jsCalendar.datepicker.js\"></script>\n");
      out.write("    \n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>사이트 관리자 페이지 | more more</title>\n");
      out.write("   	<link rel=\"stylesheet\" href=\"resources/css/styles.css\" type=\"text/css\" />\n");
      out.write("  <style>\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("	//페이지 열리자 마자 모든기간 매출금액과 건수, 반품완료 금액과 건수 \n");
      out.write("	$.ajax(\"datePick.do\",{\n");
      out.write("		type: \"get\",\n");
      out.write("		dateType: \"json\",\n");
      out.write("		success:function(data){\n");
      out.write("			console.log(data);\n");
      out.write("			document.querySelector(\".saleMoney\").innerHTML = data.sales[0].SALESUM.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("			document.querySelector(\".saleCount\").innerHTML = data.sales[0].COUNT +\"건\";\n");
      out.write("			\n");
      out.write("			document.querySelector(\".cancelMoney\").innerHTML = data.cancel[0].SALESUM.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("			document.querySelector(\".cancelCount\").innerHTML = data.cancel[0].COUNT + \"건\";\n");
      out.write("			\n");
      out.write("			new Chart(document.getElementById(\"topDoughnut-chart\"), {\n");
      out.write("			    type: 'doughnut',\n");
      out.write("			    data: {\n");
      out.write("			      labels: [\"여성\",\"남성\"],\n");
      out.write("			      datasets: [\n");
      out.write("			        {\n");
      out.write("			          label: \"Population (millions)\",\n");
      out.write("			          backgroundColor: [\"#c45850\",\"#3cba9f\"],\n");
      out.write("			          data: [data.womanSale[0].WOMANTOTAL,(data.sales[0].SALESUM)-(data.womanSale[0].WOMANTOTAL)]\n");
      out.write("			        }\n");
      out.write("			      ]\n");
      out.write("			    },\n");
      out.write("			    options: {\n");
      out.write("			      title: {\n");
      out.write("			        display: true,\n");
      out.write("			        text: ''\n");
      out.write("			      }\n");
      out.write("			    }\n");
      out.write("			});\n");
      out.write("			\n");
      out.write("			new Chart(document.getElementById(\"bottomDoughnut-chart\"), {\n");
      out.write("			    type: 'doughnut',\n");
      out.write("			    data: {\n");
      out.write("			      labels: [\"뷰티\", \"홈&리빙\", \"푸드\", \"반려동물\"],\n");
      out.write("			      datasets: [\n");
      out.write("			        {\n");
      out.write("			          label: \"Population (millions)\",\n");
      out.write("			          backgroundColor: [\"#29577b\", \"#35c09c\",\"#f6ce49\",\"#f7a35c\"],\n");
      out.write("			          data: [data.category[0].CATESUM,data.category[1].CATESUM,data.category[2].CATESUM,data.category[3].CATESUM]\n");
      out.write("			        }\n");
      out.write("			      ]\n");
      out.write("			    },\n");
      out.write("			    options: {\n");
      out.write("			      title: {\n");
      out.write("			        display: true,\n");
      out.write("			        text: ''\n");
      out.write("			      }\n");
      out.write("			    }\n");
      out.write("			});\n");
      out.write("\n");
      out.write("			let result = \"\";\n");
      out.write("				for(let i=0; i<=4; i++){\n");
      out.write("				    const total = (data.rankProj[i].TOTAL).toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("				result += \"<tr>\"\n");
      out.write("						+\"<td>\"+data.rankProj[i].PRO_NO+\"</td>\"\n");
      out.write("						+\"<td>\"+data.rankProj[i].USER_NO+\"</td>\"\n");
      out.write("        			    +\"<td>\"+data.rankProj[i].PRO_TITLE+\"</td>\";\n");
      out.write("        			    if (data.rankProj[i].PRO_HASHTAG == undefined) {\n");
      out.write("	        			     result +=\"<td>-</td>\";	\n");
      out.write("	        			    } else {\n");
      out.write("	        			    	result += \"<td>\"+data.rankProj[i].PRO_HASHTAG+\"</td>\";\n");
      out.write("	        			    }	        			    \n");
      out.write("	        			   result += \"<td>\"+total+\"</td>\"\n");
      out.write("	        			    		+\"</tr>\";\n");
      out.write("				}\n");
      out.write("					document.querySelector(\".ProjTable\").innerHTML = result;\n");
      out.write("			let customer = \"\";\n");
      out.write("				for(let i=0; i<=4; i++){\n");
      out.write("					const total = (data.rankUser[i].TOTAL).toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("					customer += \"<tr>\"\n");
      out.write("								+\"<td>\"+data.rankUser[i].USER_NO+\"</td>\"\n");
      out.write("								+\"<td>\"+data.rankUser[i].USER_ID+\"</td>\"\n");
      out.write("								+\"<td>\"+data.rankUser[i].USER_EMAIL+\"</td>\"\n");
      out.write("								+\"<td>\"+total+\"</td>\"\n");
      out.write("		        			    +\"</tr>\";\n");
      out.write("				}\n");
      out.write("				document.querySelector(\".customerTable\").innerHTML = customer;\n");
      out.write("				\n");
      out.write("				\n");
      out.write("		},\n");
      out.write("		error:function(){\n");
      out.write("			alert(\"불러오기 실패!\");\n");
      out.write("		}\n");
      out.write("	});\n");
      out.write("	//기간별 매출금액과 건수, 반품완료 금액과 건수 \n");
      out.write("	const getDate = () =>{\n");
      out.write("		let startDate = document.getElementById(\"jsCal1-text\").value;\n");
      out.write("		let endDate = document.getElementById(\"jsCal2-text\").value;\n");
      out.write("		const date = {\"startDate\":startDate , \"endDate\":endDate};\n");
      out.write("		$.ajax(\"datePick.do\",{\n");
      out.write("			type: \"get\",\n");
      out.write("			dateType: \"json\",\n");
      out.write("			data: date,\n");
      out.write("			success:function(data){\n");
      out.write("				console.log(data);\n");
      out.write("				\n");
      out.write("				document.querySelector(\".saleMoney\").innerHTML = data.sales[0].SALESUM.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("				document.querySelector(\".saleCount\").innerHTML = data.sales[0].COUNT +\"건\";\n");
      out.write("				\n");
      out.write("				document.querySelector(\".cancelMoney\").innerHTML = data.cancel[0].SALESUM.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("				document.querySelector(\".cancelCount\").innerHTML = data.cancel[0].COUNT + \"건\";\n");
      out.write("				\n");
      out.write("				\n");
      out.write("				new Chart(document.getElementById(\"topDoughnut-chart\"), {\n");
      out.write("				    type: 'doughnut',\n");
      out.write("				    data: {\n");
      out.write("				      labels: [\"여성\",\"남성\"],\n");
      out.write("				      datasets: [\n");
      out.write("				        {\n");
      out.write("				          label: \"Population (millions)\",\n");
      out.write("				          backgroundColor: [\"#c45850\",\"#3cba9f\"],\n");
      out.write("				          data: [data.womanSale[0].WOMANTOTAL,(data.sales[0].SALESUM)-(data.womanSale[0].WOMANTOTAL)]\n");
      out.write("				        }\n");
      out.write("				      ]\n");
      out.write("				    },\n");
      out.write("				    options: {\n");
      out.write("				      title: {\n");
      out.write("				        display: true,\n");
      out.write("				        text: ''\n");
      out.write("				      }\n");
      out.write("				    }\n");
      out.write("				});\n");
      out.write("				\n");
      out.write("				new Chart(document.getElementById(\"bottomDoughnut-chart\"), {\n");
      out.write("				    type: 'doughnut',\n");
      out.write("				    data: {\n");
      out.write("				      labels: [\"뷰티\", \"홈&리빙\", \"푸드\", \"반려동물\"],\n");
      out.write("				      datasets: [\n");
      out.write("				        {\n");
      out.write("				          label: \"Population (millions)\",\n");
      out.write("				          backgroundColor: [\"#29577b\", \"#35c09c\",\"#f6ce49\",\"#f7a35c\"],\n");
      out.write("				          data: [data.category[0].CATESUM,data.category[1].CATESUM,data.category[2].CATESUM,data.category[3].CATESUM]\n");
      out.write("				        }\n");
      out.write("				      ]\n");
      out.write("				    },\n");
      out.write("				    options: {\n");
      out.write("				      title: {\n");
      out.write("				        display: true,\n");
      out.write("				        text: ''\n");
      out.write("				      }\n");
      out.write("				    }\n");
      out.write("				});\n");
      out.write("\n");
      out.write("				\n");
      out.write("				let result = \"\";\n");
      out.write("					for(let i=0; i<=4; i++){\n");
      out.write("					    const total = (data.rankProj[i].TOTAL).toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("					result += \"<tr>\"\n");
      out.write("							+\"<td>\"+data.rankProj[i].PRO_NO+\"</td>\"\n");
      out.write("							+\"<td>\"+data.rankProj[i].USER_NO+\"</td>\"\n");
      out.write("	        			    +\"<td>\"+data.rankProj[i].PRO_TITLE+\"</td>\";\n");
      out.write("	        			    if (data.rankProj[i].PRO_HASHTAG == undefined) {\n");
      out.write("	        			     result +=\"<td>-</td>\";	\n");
      out.write("	        			    } else {\n");
      out.write("	        			    	result += \"<td>\"+data.rankProj[i].PRO_HASHTAG+\"</td>\";\n");
      out.write("	        			    }	        			    \n");
      out.write("	        			   result += \"<td>\"+total+\"</td>\"\n");
      out.write("	        			    		+\"</tr>\";\n");
      out.write("					}\n");
      out.write("						document.querySelector(\".ProjTable\").innerHTML = result;\n");
      out.write("				let customer = \"\";\n");
      out.write("					for(let i=0; i<=4; i++){\n");
      out.write("						const total = (data.rankUser[i].TOTAL).toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ',');\n");
      out.write("						customer += \"<tr>\"\n");
      out.write("									+\"<td>\"+data.rankUser[i].USER_NO+\"</td>\"\n");
      out.write("									+\"<td>\"+data.rankUser[i].USER_ID+\"</td>\"\n");
      out.write("									+\"<td>\"+data.rankUser[i].USER_EMAIL+\"</td>\"\n");
      out.write("									+\"<td>\"+total+\"</td>\"\n");
      out.write("			        			    +\"</tr>\";\n");
      out.write("					}\n");
      out.write("					document.querySelector(\".customerTable\").innerHTML = customer;\n");
      out.write("\n");
      out.write("			},\n");
      out.write("			error:function(){\n");
      out.write("				alert(\"날짜로 검색 실패!\");\n");
      out.write("			}\n");
      out.write("		});\n");
      out.write("	}						\n");
      out.write("	\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("	//프로젝트 상세보기 \n");
      out.write("	function getProjDetail(){\n");
      out.write("		console.log(\"상세보기 시작\");\n");
      out.write("		$.ajax(\"getProj.do\",{\n");
      out.write("			type: \"get\",\n");
      out.write("			dataType: \"json\",\n");
      out.write("			success: function(data){\n");
      out.write("				console.log(\"성공!\");\n");
      out.write("				\n");
      out.write("			},\n");
      out.write("			error: function(){\n");
      out.write("				console.log(\"실패!\");\n");
      out.write("			}\n");
      out.write("		});\n");
      out.write("	}\n");
      out.write("</script>\n");
      out.write("<style>\n");
      out.write("	.adminContainerContent{\n");
      out.write("    	width: 850px;\n");
      out.write("    	height: 1100px;\n");
      out.write("	}\n");
      out.write("	.date span button{\n");
      out.write("		float: right;\n");
      out.write("	}\n");
      out.write("	input{\n");
      out.write("		width: 200px;\n");
      out.write("		height: 25px;\n");
      out.write("	}\n");
      out.write("	button{\n");
      out.write("		width: 50px;\n");
      out.write("    	height: 30px;\n");
      out.write("    	position: relative;\n");
      out.write("    	right: 160px;\n");
      out.write("    	bottom: -2px;\n");
      out.write("	}\n");
      out.write("	.date{\n");
      out.write("		position: relative;\n");
      out.write("    	left: 200px;\n");
      out.write("    	margin-top: 30px;\n");
      out.write("	}\n");
      out.write("	.infoSales{\n");
      out.write("		position: relative;\n");
      out.write("	    left: 100px;\n");
      out.write("	    margin-top: 60px;\n");
      out.write("	    width: 650px;\n");
      out.write("	    height: inherit;\n");
      out.write("	}\n");
      out.write("	.infoSales div{\n");
      out.write("		width: 100%;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.first div{\n");
      out.write("		float: left;\n");
      out.write("		width:50%;\n");
      out.write("		position:relative;\n");
      out.write("		height: 200px;\n");
      out.write("		text-align: center;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.first{\n");
      out.write("		height: 200px;\n");
      out.write("    	border: 1px solid #dde2e6;\n");
      out.write("    	border-radius: 14px;\n");
      out.write("    	background-color: white;\n");
      out.write("}\n");
      out.write("	.totalSales div{\n");
      out.write("		float: none;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.second{\n");
      out.write("		border: 1px solid #dde2e6;\n");
      out.write("    	border-radius: 14px;\n");
      out.write("    	margin-top: 40px;\n");
      out.write("    	height: 300px;\n");
      out.write("    	background-color: white;\n");
      out.write("    	text-align: center;\n");
      out.write("   	    text-transform: capitalize;\n");
      out.write("    	\n");
      out.write("	}\n");
      out.write("	.third{\n");
      out.write("		border: 1px solid #dde2e6;\n");
      out.write("    	border-radius: 14px;\n");
      out.write("    	margin-top: 40px;\n");
      out.write("    	height: 300px;\n");
      out.write("    	background-color: white;\n");
      out.write("    	text-transform: capitalize;\n");
      out.write("    	text-align: center;	\n");
      out.write("    	\n");
      out.write("	}\n");
      out.write("	.tableTitle{\n");
      out.write("		font-size:19px;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	th{\n");
      out.write("		font-size:19px;\n");
      out.write("	}\n");
      out.write("	.saleMoney{\n");
      out.write("		color: #5d5dcf;\n");
      out.write("    	font-size: 36px;\n");
      out.write("    	margin-top: 20px;\n");
      out.write("	}\n");
      out.write("	.saleCount{\n");
      out.write("		color: darkgray;\n");
      out.write("	}\n");
      out.write("	.cancelMoney{\n");
      out.write("		font-size: 36px;\n");
      out.write("    	margin-top: 20px;\n");
      out.write("    	color: #df6f5b;\n");
      out.write("	}\n");
      out.write("	.cancelCount{\n");
      out.write("		color: darkgray;\n");
      out.write("	}\n");
      out.write("	.saler{\n");
      out.write("		position: relative;\n");
      out.write("    	right: -5%;\n");
      out.write("   	 	width: 595px;\n");
      out.write("	}\n");
      out.write("	.customer{\n");
      out.write("		width: 544px;\n");
      out.write("    	position: relative;\n");
      out.write("    	right: -8%;\n");
      out.write("	}\n");
      out.write("\n");
      out.write("		#top-container{\n");
      out.write("		 height: 500px; \n");
      out.write("		}\n");
      out.write("		#bottom-container{\n");
      out.write("		 height: 500px; \n");
      out.write("		}\n");
      out.write("		.input-date\n");
      out.write("		{\n");
      out.write("			cursor: pointer;\n");
      out.write("		}\n");
      out.write("	#doughnut-chart\n");
      out.write("	{\n");
      out.write("		}\n");
      out.write("		\n");
      out.write("		.graph\n");
      out.write("		{\n");
      out.write("			position: relative;\n");
      out.write("   			right: -128%;\n");
      out.write("   			top: -86%;\n");
      out.write("    		width: 479px;\n");
      out.write("    		text-align: center;\n");
      out.write("		}\n");
      out.write("		\n");
      out.write("		.graph div\n");
      out.write("		{\n");
      out.write("			margin-bottom: 80px;\n");
      out.write("		}\n");
      out.write("		.graph span\n");
      out.write("		{\n");
      out.write("			position: absolute;\n");
      out.write("    		left: 32%;\n");
      out.write("   			 color: darkslategray;\n");
      out.write("		}\n");
      out.write("		#jsCal1-text, #jsCal2-text {cursor: pointer;}\n");
      out.write("		\n");
      out.write("		.headerUtil button\n");
      out.write("		{\n");
      out.write("			float: right;\n");
      out.write("			width: 60px;\n");
      out.write("			right:7px;\n");
      out.write("			position: relative;\n");
      out.write("		}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("	<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js\"></script>\n");
      out.write("	");
      out.write("\n");
      out.write("		<header class=\"adminHeaderWrapper\">\n");
      out.write("			<div class=\"adminHeaderContaniner\">\n");
      out.write("				<h4 class=\"headerLogo\">\n");
      out.write("					<a href=\"home.jsp\" class=\"headerLogo purple\">\n");
      out.write("					<span ><img src=\"resources/images/logo1.png\"></span>\n");
      out.write("					</a>\n");
      out.write("				</h4>\n");
      out.write("				<h8 class=\"adminHeaderTitle\">사이트 관리자</h8>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"headerUtil\">\n");
      out.write("	            <button type=\"button\" class=\"myPageBtn\" onclick=\"javascript:location.href='siteAdminHome.jsp'\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ loginUsers.user_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("님</button>\n");
      out.write("				<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='logout.do'\">로그아웃</button>\n");
      out.write("			</div>\n");
      out.write("		</header>\n");
      out.write("	\n");
      out.write("		");
      out.write("\n");
      out.write("	<div class=\"adminContainerWrapper\">\n");
      out.write("		<div class=\"adminContainerLeft\">\n");
      out.write("			<ul class=\"adminLeftMenu\">\n");
      out.write("				<li class=\"adminMenuItem\"><a href=\"siteAdminHome.jsp\">MAIN</a></li>\n");
      out.write("				<li class=\"adminMenuItem\"><a href=\"getUserList.do\">회원관리</a></li>\n");
      out.write("				<li class=\"adminMenuItem\"><a href=\"getProj.do\">프로젝트관리</a></li>\n");
      out.write("				<li class=\"adminMenuItem\"><a href=\"adminSalesManage.jsp\">매출관리</a></li>\n");
      out.write("				<li class=\"adminMenuItem\"><a href=\"notice.do\">FAQ / 공지</a></li>\n");
      out.write("			</ul>\n");
      out.write("		</div>\n");
      out.write("		<div class=\"adminContainerRightWrapper\">\n");
      out.write("			<div class=\"adminContainerRight\">\n");
      out.write("				<div class=\"adminLocationArea\">\n");
      out.write("					<h8>매출 관리</h8>\n");
      out.write("				</div>\n");
      out.write("				<div class=\"adminContainerContent\">\n");
      out.write("				  <div id=\"salesInfo\">\n");
      out.write("					<!-- 기간별 매출정보 검색공간  -->\n");
      out.write("					<div class=\"date\">\n");
      out.write("						<span class=\"input-date\">\n");
      out.write("						  <input type=\"text\" id=\"jsCal1-text\" name=\"startDate\"\n");
      out.write("		                         value=\"시작 날짜\"\n");
      out.write("		                         data-datepicker=''\n");
      out.write("		                         data-class=\"auto-jsCalendar clean-theme green\" readonly/>   \n");
      out.write("		                </span>\n");
      out.write("		                <span class=\"input-date\">\n");
      out.write("		                   <input type=\"text\" id=\"jsCal2-text\" name=\"endDate\"\n");
      out.write("		                          value=\"마지막 날짜\"\n");
      out.write("		                          data-datepicker=''\n");
      out.write("		                          data-class=\"auto-jsCalendar  clean-theme green\" readonly/>                    \n");
      out.write("		                </span>\n");
      out.write("		                <span>\n");
      out.write("		                   	<button type=\"button\" onclick=\"getDate()\">검색</button>\n");
      out.write("		                </span>\n");
      out.write("		            </div>\n");
      out.write("		           <!-- 왼쪽 -->\n");
      out.write("		            <div class=\"infoSales\">\n");
      out.write("		           	 	<!-- 첫번째  -->\n");
      out.write("		            	<div class=\"first\">\n");
      out.write("		            		<!-- 총매출 금액, 건수 -->\n");
      out.write("			            	<div class=\"totalSales\">\n");
      out.write("			            		<p class=\"saleTitle\">\n");
      out.write("			            			총매출\n");
      out.write("			            		</p>\n");
      out.write("			            		<p class=\"saleMoney\">\n");
      out.write("			            		</p>\n");
      out.write("			            		<p class=\"saleCount\">\n");
      out.write("			            		</p>\n");
      out.write("			            	</div>\n");
      out.write("			            	<!-- 취소 금액, 건수  -->\n");
      out.write("			            	<div class=\"cancelSales\">\n");
      out.write("			            		<p class=\"cancelTitle\">\n");
      out.write("			            			취소\n");
      out.write("			            		</p>\n");
      out.write("			            		<p class=\"cancelMoney\">\n");
      out.write("			            		</p>\n");
      out.write("			            		<p class=\"cancelCount\">\n");
      out.write("			            		</p>\n");
      out.write("			            		\n");
      out.write("			            	</div>\n");
      out.write("		            	</div>\n");
      out.write("		            	<!-- 두번째  -->\n");
      out.write("		            	<div class=\"second\">\n");
      out.write("			            	<!-- 가장많이 판매한 프로젝트  -->\n");
      out.write("				            <div class=\"saleKing\">\n");
      out.write("				            	<p class=\"tableTitle\">#많이 판매한 프로젝트 순위 \n");
      out.write("				            	<table class=\"saler\">\n");
      out.write("				            		<thead>\n");
      out.write("					            		<tr>\n");
      out.write("						            		<th>NO</th>\n");
      out.write("						            		<th>판매자 번호</th>\n");
      out.write("						            		<th>제목</th>\n");
      out.write("						            		<th>해시태그</th>\n");
      out.write("						            		<th>금액</th>\n");
      out.write("				            			</tr>\n");
      out.write("				            		</thead>\n");
      out.write("				            		<tbody class=\"ProjTable\">\n");
      out.write("				            		\n");
      out.write("				            		</tbody>\n");
      out.write("				            		<tfoot></tfoot>\n");
      out.write("				            	</table>\n");
      out.write("				            </div>\n");
      out.write("		            	</div>\n");
      out.write("		            	<!-- 세번째 -->\n");
      out.write("		            	<div class=\"third\">\n");
      out.write("		            		<!-- 가장많이 구매한 유저 --> \n");
      out.write("		            		<div class=\"customerKing\">\n");
      out.write("		            			<p class=\"tableTitle\">#많이 구매한 회원 순위\n");
      out.write("		            			<table class=\"customer\">\n");
      out.write("				            		<thead>\n");
      out.write("					            		<tr>\n");
      out.write("						            		<th>NO</th>\n");
      out.write("						            		<th>아이디</th>\n");
      out.write("						            		<th>이메일</th>\n");
      out.write("						            		<th>금액</th>\n");
      out.write("				            			</tr>\n");
      out.write("				            		</thead>\n");
      out.write("				            		<tbody class=\"customerTable\">\n");
      out.write("				            		\n");
      out.write("				            		</tbody>\n");
      out.write("				            		<tfoot></tfoot>\n");
      out.write("				            	</table>\n");
      out.write("		            		</div>\n");
      out.write("		            	</div>\n");
      out.write("		            </div>\n");
      out.write("		           <!-- 오른쪽 그래프 공간 -->\n");
      out.write("		           <div class=\"graph\">\n");
      out.write("		           		<span class=\"topTitle\">성비별 매출비율</span>\n");
      out.write("		           		<div class=\"topGraph\">\n");
      out.write("							<canvas id=\"topDoughnut-chart\"></canvas>\n");
      out.write("						</div>\n");
      out.write("						<span class=\"bottomTitle\">카테고리별 매출비율</span>\n");
      out.write("						<div class=\"bottomGraph\">\n");
      out.write("		           			<canvas id=\"bottomDoughnut-chart\"></canvas>\n");
      out.write("						</div>\n");
      out.write("		           </div>\n");
      out.write("		           \n");
      out.write("		           </div>\n");
      out.write("				</div>\n");
      out.write("			</div>\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	<div>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("<script>\n");
      out.write("		\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>");
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
}