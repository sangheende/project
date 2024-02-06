<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="p-form-row clearfix">
	<div class="col-18">
		<span>검색결과수 <strong>${paginationInfo.totalRecordCount}</strong></span>,
		<span class="division_line">페이지 <strong>${paginationInfo.currentPageNo}</strong> / ${paginationInfo.totalPageCount}</span>
	</div>
	<div class="col-6 right">
		<c:if test="${paginationInfo.totalPageCount gt 1}">
		<form:form commandName="scrit" name="searchForm" action="?${scrit.qsk}" method="post">
			<fieldset>
				<legend>페이지 이동 폼</legend>
				<form:label path="cpn" class="skip">페이지선택</form:label>
				<form:select path="cpn" class="p-input p-input--auto">
					<c:forEach var="p" begin="1" end="${paginationInfo.totalPageCount}">
					<c:if test="${scrit.cpn ne p}">
					<form:option value="${p}">${p}</form:option>
					</c:if>
					</c:forEach>
				</form:select>
				<input value="페이지이동" class="p-button p-button--small primary" type="submit" />
			</fieldset>
		</form:form>
		</c:if>
	</div>
</div>