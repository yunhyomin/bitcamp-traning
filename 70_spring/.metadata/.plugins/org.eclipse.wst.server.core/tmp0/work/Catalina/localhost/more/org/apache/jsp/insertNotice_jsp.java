/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.53
 * Generated at: 2022-02-15 17:19:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.spring.more.users.service.UsersVO;

public final class insertNotice_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("jar:file:/C:/MyStudy/70_spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/moremore/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1635183043313L));
    _jspx_dependants.put("/homeHeader.jsp", Long.valueOf(1637508896000L));
    _jspx_dependants.put("/homeFooter.jsp", Long.valueOf(1637387332000L));
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
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@9\"></script>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>공지작성</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"resources/css/styles.css\" type=\"text/css\"/>\n");
      out.write("</head>\n");
      out.write("<script>\n");
      out.write("	function viewimg(e){\n");
      out.write("		let html = \"\";\n");
      out.write("		for(let i=0; i<e.files.length; i++){\n");
      out.write("			let file = new FileReader();\n");
      out.write("			console.log(e.files[i]);\n");
      out.write("			file.readAsDataURL(e.files[i],\"UTF-8\");\n");
      out.write("			\n");
      out.write("			file.onload = function(){\n");
      out.write("				html = \"<div class='view'><img class='views' src='\"+this.result+\"'></div>'\";\n");
      out.write("				document.querySelector(\"#allimg\").innerHTML += html;\n");
      out.write("				/* document.querySelector(\".views\").src = this.result; */\n");
      out.write("				console.log(this.result);\n");
      out.write("				console.log(e.value);\n");
      out.write("				/* console.log(e.value.slice(e.files[i].lastIndexOf(\"\\\\\"))); */\n");
      out.write("				\n");
      out.write("			}\n");
      out.write("			\n");
      out.write("		}\n");
      out.write("	}\n");
      out.write("</script>\n");
      out.write("<style>\n");
      out.write("	.listOne li {\n");
      out.write("		list-style: none;\n");
      out.write("	}\n");
      out.write("	.listOne a{\n");
      out.write("		text-decoration: none;\n");
      out.write("		color: black;\n");
      out.write("	}\n");
      out.write("	.imgBox { \n");
      out.write("		float: right;\n");
      out.write("	}\n");
      out.write("	#headerSlide { \n");
      out.write("		background-color: #e9f1e77d;\n");
      out.write("		boder-bottom: 1px solid color:rgb(230,230,230);\n");
      out.write("		boder-bottom: 1px;\n");
      out.write("		boder-bottom: solid;\n");
      out.write("		boder-bottom-color: rgb(230,230,230);\n");
      out.write("		padding: 100px 1px 20px;\n");
      out.write("		margin-bottom: 40px;\n");
      out.write("	}\n");
      out.write("	.select{\n");
      out.write("		 width:100px;\n");
      out.write("	     padding:10px;\n");
      out.write("	     border:1px solid #999;\n");
      out.write("	     font-family:'Nanumgothic';\n");
      out.write("	     border-radius:6px;\n");
      out.write("	     -webkit-appearance: none;\n");
      out.write("	     -moz-appearance: none;\n");
      out.write("	     appearance : none;\n");
      out.write("	     margin-bottom: 50px;\n");
      out.write("		 margin-top: 40px;\n");
      out.write("		 cursor: pointer;\n");
      out.write("	}	 \n");
      out.write("	.noticeForm{\n");
      out.write("		padding: 0px 30px 88px;\n");
      out.write("		border-radius: 4px;\n");
      out.write("		border: 1px solid rgb(230,230,230);\n");
      out.write("	}\n");
      out.write("	#helpCenter{\n");
      out.write("		font-size: 40px;\n");
      out.write("	   align-items: center;\n");
      out.write("		padding: 32px 50px 60px;\n");
      out.write("		tranform: translate(10px, 800px);\n");
      out.write("		    color: slategray;\n");
      out.write("	}\n");
      out.write("	input[type=\"text\" i]{\n");
      out.write("		width: 1139px;\n");
      out.write("		height: 50px;\n");
      out.write("		border-radius: 10px;\n");
      out.write("		font-size: 20px; \n");
      out.write("	}\n");
      out.write("	textarea{\n");
      out.write("		width: 1139px;\n");
      out.write("		height: 521px;\n");
      out.write("		border-radius: 10px;\n");
      out.write("		font-size: smaller;\n");
      out.write("	}\n");
      out.write("	#allimg{\n");
      out.write("		\n");
      out.write("	}\n");
      out.write("	.veiws{\n");
      out.write("		margin-top: 30px;\n");
      out.write("		position: relative;\n");
      out.write("		width: 600px;\n");
      out.write("		\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.submit input{\n");
      out.write("		display: flex;\n");
      out.write("    	height: 50px;\n");
      out.write("	    font-size: 14px;\n");
      out.write("	    color: rgb(61,61,61);\n");
      out.write("	    border: 1px solid rgb(228, 228, 228);\n");
      out.write("	    justify-content: center;\n");
      out.write("	    align-items: center;\n");
      out.write("	    border-radius: 4px;\n");
      out.write("	    cursor: pointer;\n");
      out.write("	    float: right;\n");
      out.write("	    width: 100px;\n");
      out.write("	    margin-bottom: 70px;\n");
      out.write("	    margin-right: 70px;\n");
      out.write("	    transform: translate(-500%, 6px);\n");
      out.write("	    position:relative;\n");
      out.write("\n");
      out.write("	}\n");
      out.write("</style>\n");
      out.write("<body>\n");
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
      out.write("\n");
      out.write("	<div id=\"headerSlide\">\n");
      out.write("		<div id=\"helpCenter\">HelpCenter</div>\n");
      out.write("		\n");
      out.write("	</div>\n");
      out.write("		\n");
      out.write("	\n");
      out.write("	<div class=\"mainContainer\">\n");
      out.write("	<div class=\"noticeForm\">\n");
      out.write("		<form action=\"insertNotice.do\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("			<div class=\"selectBox\">\n");
      out.write("				<select class=\"select\" name=\"customer_category\">\n");
      out.write("					<option value=\"공지사항\">공지사항</option>\n");
      out.write("					<option value=\"FAQ\">FAQ</option>\n");
      out.write("				</select>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"board\">\n");
      out.write("				제목<p><input type=\"text\" name=\"customer_subject\"></p>\n");
      out.write("				내용<p><textarea name=\"customer_content\"></textarea></p>\n");
      out.write("				이미지<p ><input type=\"file\" id=\"real-input\" name=\"customer_imagee\" onchange=\"viewimg(this)\" required multiple ></p>\n");
      out.write("				<p id=\"allimg\"/></p>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"submit\">\n");
      out.write("				<input type=\"submit\" value=\"새글등록\">\n");
      out.write("				<input type=\"button\" onclick=\"location.href='notice.do'\" value=\"취소\">\n");
      out.write("			</div>\n");
      out.write("		</form>	\n");
      out.write("	</div>\n");
      out.write("	</div>\n");
      out.write("	\n");
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
