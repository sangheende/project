<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <div class="header_top">
            <div class="wrap clearfix">
                <div class="sitelink">
                    <ul class="clearfix">
                        <li><a href="/www/index.do" target="_blank" title="새창">경기대학교</a></li>
                        <li><a href="http://enter.kyonggi.ac.kr/index.do" target="_blank" title="새창" rel="noopener noreferrer">입시홈페이지</a></li>
                        <li><a href="https://kutis.kyonggi.ac.kr/webkutis/view/indexWeb.jsp" target="_blank" title="새창" rel="noopener noreferrer">KUTIS</a></li>
                    </ul>
                </div>
                <div class="gnb">
                    <ul class="clearfix">
                        <li class="gnbitem gnbsearch"><button type="button" class="gnbbtn">통합검색</button></li>
						<c:choose>
				        <c:when test="${not empty sessionScope.loginVO and not empty sessionScope.loginVO.dplctCode}">
							<li class="gnbitem logout"><a href="/logout.do" class="gnbbtn">로그아웃[<c:out value="${sessionScope.loginVO.userNm}"/>]</a></li>
				        </c:when>
				        <c:otherwise>
							<li class="gnbitem login"><a href="/loginView.do" class="gnbbtn">로그인</a></li>
				        </c:otherwise>
				        </c:choose>
                        <li class="gnbitem language">
                            <button type="button" title="하위메뉴열기" class="gnbbtn">Language</button>
                            <div class="language_panel">
                                <ul class="language_list">
                                    <li class="language_item<c:if test="${siteInfo.siteId eq 'www'}"> active</c:if>"><a href="/www/index.do" class="language_anchor">Korean</a></li>
                                    <li class="language_item<c:if test="${siteInfo.siteId eq 'english'}"> active</c:if>"><a href="/english/index.do" class="language_anchor">English</a></li>
                                    <li class="language_item<c:if test="${siteInfo.siteId eq 'chinese'}"> active</c:if>"><a href="/chinese/index.do" class="language_anchor">Chinese</a></li>
                                    <li class="language_item<c:if test="${siteInfo.siteId eq 'vietnam'}"> active</c:if>"><a href="/vietnam/index.do" class="language_anchor">Vietnamese</a></li>
                                </ul>
                                <button type="button" class="language_hide">닫기</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
