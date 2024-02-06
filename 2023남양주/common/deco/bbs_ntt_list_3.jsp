<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<ul class="photo_list">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
    <li class="photo_item">
        <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>">
            <span class="photo_img">
                <%-- <img src="/site/www/images/main/photo_img01.jpg" alt="이미지 대체텍스트"> --%>
                <c:url var="imageUrl" value="${result.firstImage.storePath}/${result.firstImage.storeFileNm }" />
                <img src="${imageUrl }" alt="<c:out value="${result.replcText }"/>">                
            </span>
            <span class="photo_subject"><c:out value="${result.nttSj }"/></span>
            <span class="photo_text"><c:out value="${tsu:nl2br(result.nttCn)}" escapeXml="false"/></span>
            <span class="photo_date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
        </a>
    </li>
    </c:forEach>
</ul>
<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="photo_more">더보기</a>