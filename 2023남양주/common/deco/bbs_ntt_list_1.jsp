<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="bbsNttCnt" value="0" />
<c:if test="${not empty siteIncludeBbs and not empty siteIncludeBbs.bbsNttVOList and fn:length(siteIncludeBbs.bbsNttVOList) gt 0 }">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
		<c:if test="${not empty result.dateDiffOfNowAndEndDE and result.dateDiffOfNowAndEndDE lt 0 }">
			<c:set var="bbsNttCnt" value="${bbsNttCnt +1 }" />		
		</c:if>
	</c:forEach>
</c:if>
  
<c:if test="${bbsNttCnt gt 0 }">
<div class="notice_title">교내채용공고</div>
<div class="notice_list">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
	<%--
    <div class="notice_item">
        <a href="#n">
            <span class="notice_box">
                <span class="notice_type">조교모집<span class="notice_dday">D-20</span></span>
                <span class="notice_subject">환경에너지공학과 실습조교 모집 환경에너지공학과 실습조교 모집</span>
            </span>
            <span class="notice_text person"><span>인원</span> 3명</span>
            <span class="notice_text date"><span>근무</span> 2022년 12월 1일 (목) 부터</span>
        </a>
    </div>
	--%>
    <div class="notice_item">
        <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>">
            <span class="notice_box">
                <span class="notice_type">조교모집
	            	<c:choose>
	            		<c:when test="${not empty result.dateDiffOfNowAndEndDE and result.dateDiffOfNowAndEndDE lt 0 }">
	            		<c:out value="D-${result.dateDiffOfNowAndEndDE < 0 ? -result.dateDiffOfNowAndEndDE : result.dateDiffOfNowAndEndDE}"/>
	            		</c:when>
	            		<c:when test="${not empty result.dateDiffOfNowAndEndDE and result.dateDiffOfNowAndEndDE ge 0 }">
	            		<c:out value="마감"/>
	            		</c:when>
	            	</c:choose>            
                </span>
                <span class="notice_subject"><c:out value="${result.nttSj }"/></span>
            </span>
            <c:if test="${not empty result.aditfield1 }">
            <span class="notice_text person"><span>인원</span> <c:out value="${result.aditfield1 }"/></span>
            </c:if>
            <c:catch><fmt:parseDate value="${result.bgnde }" pattern="yyyyMMdd" var="bgnde"/></c:catch>
            <c:catch><fmt:parseDate value="${result.endde }" pattern="yyyyMMdd" var="endde"/></c:catch>
            <span class="notice_text date">
            	<c:if test="${not empty bgnde or not empty endde }"><span>접수</span></c:if>            	
            	<c:if test="${not empty bgnde }"><fmt:formatDate value="${bgnde }" type="date" pattern="yyyy.MM.dd"/></c:if>
            	<c:if test="${not empty bgnde or not empty endde }">~</c:if>
            	<c:if test="${not empty endde }"><fmt:formatDate value="${endde }" type="date" pattern="yyyy.MM.dd"/></c:if>            	            	
            </span>            
            <c:if test="${not empty result.aditfield2 }">
            	<span class="notice_text date"><span>근무</span> <c:out value="${result.aditfield2 }"/> 부터</span>
            </c:if>
        </a>
    </div>
	</c:forEach>
</div>
<div class="notice_control">
    <button type="button" class="notice_prev">이전보기</button>
    <button type="button" class="notice_next">다음보기</button>
    <a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" title="새창" target="_blank" rel="noopener noreferrer" class="notice_more">더보기</a>
</div>
</c:if>
