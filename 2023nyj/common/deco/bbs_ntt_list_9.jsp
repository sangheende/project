<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<div class="board_list">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
    <div class="board_item">
        <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="board_anchor">
            <span class="board_item_info"><c:out value="${result.nttSj }"/></span>
            <span class="board_item_time"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
        </a>
    </div>
    </c:forEach>
</div>
<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="board_more_btn"><span class="skip"><c:out value="${bbsTitle }"/> 더보기</span></a>
