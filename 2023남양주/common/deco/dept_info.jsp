<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>
<%@	page import="org.springframework.web.context.WebApplicationContext"%>
<%@	page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="kr.co.hanshinit.NeoCMS.cmm.util.*"%>
<%@ page import="kr.co.hanshinit.NeoCMS.cop.dep.service.*"%>
<%@ page import="kr.co.hanshinit.NeoCMS.sym.dep.service.*"%>
<%@ page import="kr.co.hanshinit.NeoCMS.sym.dep.emp.service.*"%>

<% pageContext.setAttribute("CRLF", "\r\n"); %>
<% pageContext.setAttribute("LF", "\n"); %>

<%
WebApplicationContext wac = null;
String deptCode = request.getParameter("dept_code");
try {
	wac = WebApplicationContextUtils.getRequiredWebApplicationContext(((HttpServletRequest) request).getSession().getServletContext());
	DeptEmployeeService deptEmployeeService = (DeptEmployeeService)wac.getBean("deptEmployeeService");
	DepartmentService departmentService = (DepartmentService)wac.getBean("departmentService");

	if(deptCode != null && deptCode.length() > 0) {
		Department department = departmentService.selectDepartment(deptCode);
		if(department != null) {
			request.setAttribute("department", department);
        }
	}
}
catch(IllegalStateException e) {
	kr.co.hanshinit.NeoCMS.cmm.util.LoggingUtil.log(e);
}
catch(Exception e) {
	kr.co.hanshinit.NeoCMS.cmm.util.LoggingUtil.debug(e);
}
%>

<c:catch>
<c:if test="${not empty department and not empty department.deptInfo }">
<c:set var="delims" value="__________"/>
<c:forTokens items="${fn:replace(department.deptInfo, CRLF, delims) }" delims="${delims }" var="result" varStatus="status">
<li><c:out value="${result }"/></li>
</c:forTokens>
</c:if>
</c:catch>