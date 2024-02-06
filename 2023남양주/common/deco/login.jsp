<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

						<c:choose>
				        <c:when test="${not empty sessionScope.loginVO and not empty sessionScope.loginVO.dplctCode}">
							<button type="button" class="login_button logout" onclick="href.location='/logout.do'">로그아웃[<c:out value="${sessionScope.loginVO.userNm}"/>]</button>
				        </c:when>
				        <c:otherwise>
							<button type="button" class="login_button" onclick="href.location='/loginView.do'">로그인</button>
				        </c:otherwise>
				        </c:choose>