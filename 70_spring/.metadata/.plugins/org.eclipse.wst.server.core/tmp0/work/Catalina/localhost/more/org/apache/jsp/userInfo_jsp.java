/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.53
 * Generated at: 2022-02-15 17:07:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.spring.more.users.service.UsersVO;

public final class userInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP?????? ?????? GET, POST ?????? HEAD ??????????????? ???????????????. Jasper??? OPTIONS ????????? ?????? ???????????????.");
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
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>?????? ?????????</title>\n");
      out.write("	<meta charset=\"UTF-8\" />\n");
      out.write("	<meta name=\"viewport\" content=\"width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0\" />\n");
      out.write("   	<link rel=\"stylesheet\" href=\"resources/css/styles.css\" type=\"text/css\" />\n");
      out.write("   	<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write(" <style>\n");
      out.write(" .sub_title\n");
      out.write(" {\n");
      out.write(" 	position: relative;\n");
      out.write(" 	left: 400px;\n");
      out.write(" }\n");
      out.write(" .title_like\n");
      out.write(" {\n");
      out.write(" 	left: 430px;\n");
      out.write(" }\n");
      out.write(" .adminContainerContentHeader\n");
      out.write(" {\n");
      out.write(" 	position: relative;\n");
      out.write(" 	right: 200px;\n");
      out.write(" 	width: 1000px;\n");
      out.write(" }\n");
      out.write(" .wishtitle, .ordertitle {\n");
      out.write("    margin: 10px 70px 70px;\n");
      out.write("    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );\n");
      out.write("    width: 870px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".funding_table {\n");
      out.write("    border-radius: 5px;\n");
      out.write("    font-size: 12px;\n");
      out.write("    font-weight: normal;\n");
      out.write("    border: none;\n");
      out.write("    border-collapse: collapse;\n");
      out.write("    width: 100%;\n");
      out.write("    max-width: 100%;\n");
      out.write("    white-space: nowrap;\n");
      out.write("    background-color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".funding_table td, .funding_table th {\n");
      out.write("    text-align: center;\n");
      out.write("    padding: 8px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".funding_table td {\n");
      out.write("    border-right: 1px solid #f8f8f8;\n");
      out.write("    font-size: 12px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".funding_table thead th {\n");
      out.write("    color: black;\n");
      out.write("    background: #dcdcdc;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".funding_table thead th:nth-child(odd) {\n");
      out.write("    color: black;\n");
      out.write("    background: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".funding_table tr:nth-child(even) {\n");
      out.write("    background: #F8F8F8;\n");
      out.write("    color: black;\n");
      out.write("}\n");
      out.write(".literal {position: relative; right: 30px;}\n");
      out.write(" </style>\n");
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
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuFunding\"><a href=\"fundingProjectList.jsp\">????????????</a></li>\n");
      out.write("					<!-- <li class=\"headerMenuItem middleSize\" id=\"headerMenuBuy\"><a href=#>????????????</a></li> -->\n");
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuGuide\"><a href=\"notice.do\" class=\"headerMenuHidden\">???????????????</a></li>\n");
      out.write("					<li class=\"headerMenuItem moreItem\" id=\"headerMenuMoreItem\"><a href=# class=\"headerMenuHidden\">?????????</a></li>\n");
      out.write("					<li class=\"headerMenuItem middleSize\" id=\"headerMenuProjectBtnList\"><a href=\"fromHomeToAdmin.jsp\" id=\"headerMenuProjectBtn\" class=\"purple\">???????????? ??????</a></li>\n");
      out.write("				</ul>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"headerUtil\">\n");
      out.write("				<form name=\"headerSearch\" action=\"searchFunding.do\" method=\"get\">\n");
      out.write("					<input type=\"search\" name=\"pro_stitle\" class=\"searchBar\" placeholder=\"???????????? ????????????\"/>\n");
      out.write("				</form>\n");
      out.write("				<!-- ???????????? ??? ?????? -->\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("  \n");
      out.write("				<!-- ????????? ??? ?????? -->\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	</header>");
      out.write("\n");
      out.write("	<div class=\"adminContainerWrapper\">\n");
      out.write("		<div class=\"myPageContainerLeft\">\n");
      out.write("			<ul class=\"myPageLeftMenu\">\n");
      out.write("				<li class=\"myPageMenuItem\"><a href=\"userInfo.jsp\">??????</a></li>\n");
      out.write("				<li class=\"myPageMenuItem\"><a href=\"userInfoValidate.jsp\">My ?????? ??????</a></li>\n");
      out.write("				<li class=\"myPageMenuItem\"><a href=\"myPage.jsp\">?????? ????????????</a></li>\n");
      out.write("				<li class=\"myPageMenuItem\"><a href=\"withdrawal.jsp\">?????? ??????</a></li>\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("				");
      if (_jspx_meth_c_005fif_005f4(_jspx_page_context))
        return;
      out.write("\n");
      out.write("			</ul>\n");
      out.write("		</div>\n");
      out.write("		<div class=\"adminContainerRightWrapper\">\n");
      out.write("			<div class=\"adminContainerRight\">\n");
      out.write("				<div class=\"myPageLocationArea\">\n");
      out.write("					<h8>?????? ?????????</h8>\n");
      out.write("				</div>\n");
      out.write("				<!-- ???????????? ???????????? ????????? ????????? -->\n");
      out.write("				<form action=\"getWishList.do\" method=\"post\"></form>\n");
      out.write("				\n");
      out.write("<!-- 				??? ???????????? ?????? ???????????? -->\n");
      out.write("				<div class=\"adminContainerContentArea\">\n");
      out.write("					<div class=\"adminContainerContentHeader\">\n");
      out.write("						<p class=\"sub_title\">?????? ??????</p>\n");
      out.write("						<div class=\"boughtContainer\"><div></div></div>\n");
      out.write("					</div>\n");
      out.write("					<div class=\"adminContainerContent\">\n");
      out.write("					</div>\n");
      out.write("				</div>\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	</div>\n");
      out.write("	");
      out.write("\n");
      out.write("	<footer id=\"footer\">\n");
      out.write("      <div class=\"infoArea\">\n");
      out.write("        <div class=\"footerMenuArea\">\n");
      out.write("          <ul class=\"footerMenu\">\n");
      out.write("            <li>????????????</li>\n");
      out.write("            <li>????????????</li>\n");
      out.write("            <li>????????????????????????</li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footerArea\">\n");
      out.write("        <img src=\"resources/images/logo1.png\" style=\"display:inline; width : 150px; margin-left: 200px;\" />\n");
      out.write("          <div class=\"footerRight\">\n");
      out.write("            <ul class=footerList>\n");
      out.write("              <li><h4>????????????</h4></li> \n");
      out.write("              <li>???????????? : ????????????</li>\n");
      out.write("              <li>\n");
      out.write("                ?????? (???) 010101 ??????????????? ????????? 999-1 ????????????\n");
      out.write("              </li>\n");
      out.write("              <li>\n");
      out.write("                ?????????????????? : 1588-1111 \n");
      out.write("              </li>\n");
      out.write("              <li class=\"COPYRIGHT\">COPYRIGHT??? moremore</li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </footer>");
      out.write("\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("window.onload = () => {\n");
      out.write("	// ????????????????????? ???????????? ??????\n");
      out.write("	getOrderListData();\n");
      out.write("}\n");
      out.write("	// ????????? ?????? ?????? ?????????\n");
      out.write("	function getOrderListData() {\n");
      out.write("		const user_no = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.loginUsers.user_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'; // ????????? ????????? ????????? ?????? ?????? ????????? (?????? ????????? ??? ???????????? ??????????????? ???????????????)\n");
      out.write("		console.log(\"getOrderListData: \" + user_no);\n");
      out.write("		var param = {\n");
      out.write("				user_no : user_no\n");
      out.write("		}\n");
      out.write("		console.log(param.user_no);\n");
      out.write("		\n");
      out.write("		$.ajax(\"getOrderList.do\", {\n");
      out.write("			type: \"get\",\n");
      out.write("			contentType: \"application/json\",\n");
      out.write("			data: param\n");
      out.write("		}).done(function(data, status, xhr) {\n");
      out.write("			let dispHtml = '<div class=\"main_div\">';\n");
      out.write("			dispHtml += \"<p class='sub_title'>????????? ??????</p>\";\n");
      out.write("			dispHtml += \"</div>\";\n");
      out.write("			\n");
      out.write("			dispHtml += \"<div class='ordertitle'>\";\n");
      out.write("			dispHtml += head_table(\"\");\n");
      out.write("			dispHtml += '<tbody class=\"orderlist\">';	\n");
      out.write("			$.each(data, function(index, obj) {\n");
      out.write("				if (index <= 5) {\n");
      out.write("					dispHtml += '<tr class=\"orderinfo\">';\n");
      out.write("					dispHtml += '<td class=\"thumb\">';\n");
      out.write("					dispHtml += \"<img src='\"+this.pro_thumbnail_path+\"' width='115px' height='80px' style='margin-top: 0px'>\";\n");
      out.write("					dispHtml += \"</td>\";\n");
      out.write("					\n");
      out.write("					dispHtml += '<td class=\"orderleft\">';\n");
      out.write("					dispHtml += \"<strong>\";\n");
      out.write("					dispHtml += this.pro_title;\n");
      out.write("					dispHtml += \"</strong>\";\n");
      out.write("					dispHtml += '<div class=\"option\">';\n");
      out.write("					dispHtml += '<div class=\"reward\">';\n");
      out.write("					dispHtml += this.goods_title;\n");
      out.write("					dispHtml += \"</div>\";\n");
      out.write("					dispHtml += '<div class=\"state\">';\n");
      out.write("					dispHtml += this.pro_status;\n");
      out.write("					dispHtml += \"</div>\";\n");
      out.write("					dispHtml += \"</div>\";\n");
      out.write("					dispHtml += \"</td>\";\n");
      out.write("					\n");
      out.write("					dispHtml += \"<td>\";\n");
      out.write("					dispHtml += this.order_ea;\n");
      out.write("					dispHtml += \"</td>\";\n");
      out.write("					\n");
      out.write("					dispHtml += '<td class=\"orderdate\">';\n");
      out.write("					dispHtml += \"<p>\";\n");
      out.write("					dispHtml += this.order_date.substring(0,10);\n");
      out.write("					dispHtml += \"</p>\";\n");
      out.write("					dispHtml += \"<p>\";\n");
      out.write("					dispHtml += this.order_no;\n");
      out.write("					dispHtml += \"</p>\";\n");
      out.write("					dispHtml += \"</td>\";\n");
      out.write("					\n");
      out.write("					dispHtml += '<td class=\"orderright\">';\n");
      out.write("					dispHtml += \"<strong>[\";\n");
      out.write("					dispHtml += this.payment_price;\n");
      out.write("					dispHtml += \"]</strong>\";\n");
      out.write("					dispHtml += \"<p>\";\n");
      out.write("					dispHtml += this.payment_status;\n");
      out.write("					dispHtml += \"</p>\";\n");
      out.write("					if(this.order_status!=='????????????'){ /* ?????? ?????? ?????? ?????? */\n");
      out.write("						dispHtml += \"<button class='requestCancelBtn' data-order_no='\"\n");
      out.write("						dispHtml += this.order_no\n");
      out.write("						dispHtml += \"'>????????????</button>\";\n");
      out.write("					}\n");
      out.write("					dispHtml += \"</td>\";\n");
      out.write("					dispHtml += \"</tr>\";\n");
      out.write("				}\n");
      out.write("			});\n");
      out.write("			if (data.length === 0 || data.user_no === null) {\n");
      out.write("				\n");
      out.write("				dispHtml += \"<tbody class='orderlist'>\"\n");
      out.write("					+ \"<tr class='orderinfo'>\"\n");
      out.write("				    + \"<td class='thumb' colspan=1>\"\n");
      out.write("					+ \"<img src='images/logo4.png' width='50px' height='20px' alt='??????'>\"\n");
      out.write("					+ \"</td>\"\n");
      out.write("					+ \"<td class='orderleft' colspan='4'>\"\n");
      out.write("					+ \"<span class='literal'>???????????? ???????????? ????????????.</span></td>\"\n");
      out.write("					+ \"</tr>\"\n");
      out.write("				\n");
      out.write("			}\n");
      out.write("			\n");
      out.write("			dispHtml += \"</tbody>\";\n");
      out.write("			dispHtml +=	\"</table>\";	\n");
      out.write("			dispHtml += \"</div>\";\n");
      out.write("			console.log(\"????????? ???.\");\n");
      out.write("			$(\".boughtContainer\").html(dispHtml);\n");
      out.write("		}).fail(function(data, status, error) {\n");
      out.write("			console.log(\"??????,,\", data);\n");
      out.write("			\n");
      out.write("		});\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	$(document).on(\"click\",\".requestCancelBtn\",function (){ /* ?????? ?????? ?????? ?????? */\n");
      out.write("		const data = this.dataset;\n");
      out.write("		const btn=this;\n");
      out.write("		console.log(btn);\n");
      out.write("		console.log(data);\n");
      out.write("		$.ajax(\"requestOrderCancel.do\", {\n");
      out.write("			type: \"get\",\n");
      out.write("			contentType: \"application/json\",\n");
      out.write("			data: data,\n");
      out.write("			success : function(data) {\n");
      out.write("				console.log(\"?????? ???.\");\n");
      out.write("				btn.previousSibling.innerText=data.order_status;\n");
      out.write("				console.log(\"???????????????\"+data);\n");
      out.write("			},error : function() {\n");
      out.write("				alert(\"????????? ????????? ???????????????. ?????? ?????? ?????? ????????? ?????????...\");\n");
      out.write("			}\n");
      out.write("		\n");
      out.write("		});\n");
      out.write("		\n");
      out.write("	});\n");
      out.write("	\n");
      out.write("head_table = (e) => {\n");
      out.write("	e += '<table border=\"1\" summary class=\"funding_table\">';\n");
      out.write("	e += \"<thead>\";\n");
      out.write("	e += \"<tr>\";\n");
      out.write("	e += '<th scope=\"col\">?????????</th>';\n");
      out.write("	e += '<th scope=\"col\">?????? ??????</th>';\n");
      out.write("	e += '<th scope=\"col\">??????</th>';\n");
      out.write("	e += '<th scope=\"col\">?????? ??????<br>?????? ??????</th>';\n");
      out.write("	e += '<th scope=\"col\">????????????<br>?????? ??????</th>';\n");
      out.write("	e += \"</tr>\";\n");
      out.write("	e += \"</thead>\";\n");
      out.write("	return e;\n");
      out.write("}\n");
      out.write("</script>\n");
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
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='login.jsp'\">?????????</button>\n");
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='joinMembership.jsp'\">????????????</button>\n");
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
          out.write("???</button>\n");
          out.write("					<button type=\"button\" class=\"noneBtn\" onclick=\"javascript:location.href='logout.do'\">????????????</button>\n");
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

  private boolean _jspx_meth_c_005fif_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f2_reused = false;
    try {
      _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f2.setParent(null);
      // /userInfo.jsp(84,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginUsers.user_type == '?????? ?????????'}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
      if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("					<li class=\"myPageMenuItem\"><a href=\"fundingAdminHome.jsp\">?????? ?????? ?????????</a></li>\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      _jspx_th_c_005fif_005f2_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f2, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f2_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f3(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f3_reused = false;
    try {
      _jspx_th_c_005fif_005f3.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f3.setParent(null);
      // /userInfo.jsp(87,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginUsers.user_type == '?????? ?????????'}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f3 = _jspx_th_c_005fif_005f3.doStartTag();
      if (_jspx_eval_c_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("					<li class=\"myPageMenuItem\"><a href=\"productAdminHome.jsp\">?????? ?????? ?????????</a></li>\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f3.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f3);
      _jspx_th_c_005fif_005f3_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f3, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f3_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f4(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f4 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f4_reused = false;
    try {
      _jspx_th_c_005fif_005f4.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f4.setParent(null);
      // /userInfo.jsp(90,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginUsers.user_type == '?????????'}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f4 = _jspx_th_c_005fif_005f4.doStartTag();
      if (_jspx_eval_c_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("					<li class=\"myPageMenuItem\"><a href=\"siteAdminHome.jsp\">????????? ?????????</a></li>\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f4.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f4);
      _jspx_th_c_005fif_005f4_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f4, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f4_reused);
    }
    return false;
  }
}
