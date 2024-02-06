<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<div class="board_content">
    <ul class="cont_list">
        <c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
        <li class="cont_item">
            <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>">
                <span class="tit"><c:out value="${result.nttSj }"/></span>
                <span class="date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
            </a>
        </li>
        </c:forEach>
    </ul>
</div>
<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="board_more"><c:out value="${bbsNm }"/> 더보기</a>
