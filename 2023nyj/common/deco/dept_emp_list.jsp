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
<%
WebApplicationContext wac = null;
String deptCode = request.getParameter("dept_code");
try {
	wac = WebApplicationContextUtils.getRequiredWebApplicationContext(((HttpServletRequest) request).getSession().getServletContext());
	DeptEmployeeService deptEmployeeService = (DeptEmployeeService)wac.getBean("deptEmployeeService");
	DepartmentService departmentService = (DepartmentService)wac.getBean("departmentService");

	if(deptCode == null) {
		deptCode = "";
	}


    Employee deptEmp = new Employee();
    deptEmp.setDeptCode(deptCode);

	if(StringUtils.isNotBlank(deptEmp.getDeptCode())) {
		Department deptInfo = departmentService.selectDepartment(deptCode);
		if(deptInfo != null) {
            deptEmp.setDeptSortCodeLen(deptInfo.getDeptSortCode().length());
			deptEmp.setDeptSortCodeCut(deptInfo.getDeptSortCode());
			request.setAttribute("deptInfo", deptInfo);

    		// 게시물 카운트
    		int totCnt = deptEmployeeService.selectDeptEmployeeTotCnt(deptEmp);

    		// 페이징 정보
    		deptEmp.setPageUnit(totCnt);
    		deptEmp.getNeoPaginationInfo(totCnt);

    		// 리스트
    		List<Employee> deptEmpList = deptEmployeeService.selectDeptEmployeeList(deptEmp);
    		request.setAttribute("deptEmpList", deptEmpList);
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
	<table class="table responsive">
		<caption>${deptInfo.deptNm} 교직원안내 테이블 - 직위, 성명, 업무, 사무실 연락처, 메일주소 순으로 내용을 제공하고 있습니다.</caption>
		<colgroup>
            <col style="width:10%;" />
			<col style="width:10%;" />
			<col>
			<col style="width:15%;" />
			<col style="width:20%" />
		</colgroup>
		<thead>
			<tr>
                <th scope="col">직위</th>
                <th scope="col">성명</th>
				<th scope="col">업무</th>
				<th scope="col">사무실 연락처</th>
				<th scope="col">메일주소</th>
			</tr>
		</thead>
		<c:if test="${fn:length(deptEmpList) gt 0}">
		<tbody>
		<c:forEach var="result" items="${deptEmpList}" varStatus="dstt">
			<tr>
				<td data-content="직급"><c:out value="${result.rspofc}" /></td>
				<td data-content="성명"><c:out value="${result.emplNm}" /></td>
				<td data-content="담당업무" class="text_left">${result.emplJob}</td>
				<td data-content="전화번호"><c:out value="${result.emplTelno}" /></td>
				<td data-content="이메일"><c:if test="${not empty result.emplEmail}"><a href="mailto:<c:out value="${result.emplEmail}" />" title="새창" target="_blank" class="btn small">이메일</a></c:if></td>
				<%-- <td data-content="소속"><c:out value="${result.deptNm}" /></td> --%>
				<%-- <td data-content="직명"><c:out value="${result.clsf}" /></td> --%>
			</tr>
		</c:forEach>
		</tbody>
		</c:if>
	</table>
