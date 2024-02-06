<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<button type="button" class="notice_btn"><c:out value="${bbs_title }"/></button>
<a href="javascript:alert('준비중 입니다.');" class="notice_ai"><span class="skip">KGU NEWS Ai 앵커가 소식을 전합니다.</span></a>
<ul class="notice_panel">
    <!-- 목록 6개씩 넣어주세요 -->
    <c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
    <li class="notice_panel_item">
        <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>">
            <span class="notice_panel_title"><c:out value="${result.nttSj }"/></span>
            <span class="notice_panel_text">
            	<c:out value="${tsu:nl2br(result.nttCn)}" escapeXml="false"/>
            </span>
            <span class="notice_panel_date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
        </a>
    </li>
    </c:forEach>
</ul>
<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="notice_more">더보기</a>
