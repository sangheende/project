<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <div class="shortcut">
                <div class="wrap">
                    <ul class="shortcut_list">
                        <li class="shortcut_item search"><button type="button" class="shortcut_anchor">검색</button></li>
						<c:choose>
				        <c:when test="${not empty sessionScope.loginVO and not empty sessionScope.loginVO.dplctCode}">
							<li class="shortcut_item logout"><a href="/logout.do" class="shortcut_anchor">로그아웃[<c:out value="${sessionScope.loginVO.userNm}"/>]</a></li>
				        </c:when>
				        <c:otherwise>
							<li class="shortcut_item login"><a href="/loginView.do" class="shortcut_anchor">로그인</a></li>
				        </c:otherwise>
				        </c:choose>
                        <li class="shortcut_item language toggle"><a href="/international_kgu/index.do" target="_blank" title="새창" rel="noopener noreferrer" class="shortcut_anchor language_show">언어</a></li>
                        <li class="shortcut_item sitemap"><a href="${pageContext.request.contextPath}/${siteInfo.siteId}/sitemapNoKey.do" class="shortcut_anchor">사이트맵</a></li>
                    </ul>
                </div>
            </div>
