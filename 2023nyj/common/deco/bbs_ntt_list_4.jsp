<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<!-- board_box -->
<c:if test="${empty siteIncludeBbs.bbsNttVOList or fn:length(siteIncludeBbs.bbsNttVOList) eq 0 }">
<span>등록된 게시물이 없습니다.</span>
</c:if>

<c:if test="${not empty siteIncludeBbs.bbsNttVOList or fn:length(siteIncludeBbs.bbsNttVOList) gt 0 }">
<div class="board_box">
	<c:if test="${not empty siteIncludeBbs.bbsNttVOList }">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
	<div class="board_item">
	    <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="board_anchor">
	        <p class="board_title"><c:out value="${result.nttSj }"/></p>
	        <p class="board_text"><c:out value="${tsu:nl2br(result.nttCn)}" escapeXml="false"/></p>
	        <p class="board_bottom">
	            <span class="board_major"><c:out value="${result.deptNm }"/></span>
	            <span class="board_date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
	        </p>
	        <span class="board_new"><span class="skip">최신 게시물</span>N</span> <!--최신 게시물-->
	    </a>
	</div>
	</c:forEach>
	</c:if>
</div>
</c:if>
<!-- //board_box -->
<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="board_more">더보기</a>
