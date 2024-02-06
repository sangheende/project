<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<div class="notice_box">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
    <div class="notice_item">
        <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="notice_link">
            <div class="notice_title"><c:out value="${result.nttSj }"/></div>
            <div class="notice_text"><c:out value="${tsu:nl2br(result.nttCn)}" escapeXml="false"/></div>
            <div class="notice_date"><c:out value="${result.frstRegisterPnttmYMD }"/></div>
        </a>
    </div>
    </c:forEach>
</div>
<div class="notice_control">
    <button type="button" class="arrow_btn prev_btn">이전</button>
    <span class="current"></span>
    <span class="gab">/</span>
    <span class="total"></span>
    <button type="button" class="arrow_btn next_btn">다음</button>
</div>
<div class="notice_more">
    <a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="more_btn">
        더보기
    </a>
</div>