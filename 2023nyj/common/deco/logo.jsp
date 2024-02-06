<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 
<!--            <div class="logo">-->
<!--                <div class="wrap">-->
<!--                    <a href="${pageContext.request.contextPath}/<c:out value="${siteInfo.siteId}"/>/index.do" class="logo_anchor">-->
<!--                        <span class="logoimage">-->
<!--                            <img src="${pageContext.request.contextPath}/common/images/layout/logo.png" alt="KGU 경기대학교">-->
<!--                        </span>-->
<!--                        <span class="logotext"><c:out value="${siteInfo.siteNm}"/></span>-->
<!--                    </a>-->
<!--                </div>-->
<!--            </div>-->
<div class="logo">
    <div class="wrap">
        <a href="${pageContext.request.contextPath}/<c:out value="${siteInfo.siteId}" />/index.do" class="logo_anchor">
            <span class="logoimage">
                <c:choose>
                    <c:when test="${siteInfo.siteId == 'kgumuseum'}">
                        <img src="${pageContext.request.contextPath}/site/kgumuseum/images/main/museumlogo.png" alt="KGU 경기대학교 소성박물관">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/common/images/layout/logo.png" alt="KGU 경기대학교">
                    </c:otherwise>
                </c:choose>
            </span>
			<c:if test="${siteInfo.siteId ne 'international_kgu'}">
            <span class="logotext">
                <c:out value="${siteInfo.siteNm}" />
            </span>
			</c:if>
        </a>
    </div>
</div>
