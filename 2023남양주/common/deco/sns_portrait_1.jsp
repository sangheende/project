<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="sns_facebook">
	<c:if test="${not empty snsItemVOList and fn:length(snsItemVOList) gt 0 }"> 
    <div class="sns_list">
        <!-- facebook 4개까지 불러와주세요 -->
        <c:forEach var="snsItem" items="${snsItemVOList }" varStatus="status">
        <div class="sns_item <c:if test="${status.index eq 0 }">slick-active</c:if>">
            <div class="sns_img">
                <img src="<c:url value="${snsItem.snsImageUrl }"/>" alt="이미지 대체텍스트">
            </div>
            <div class="sns_cont">
                <span class="sns_logo">
                	<c:choose>
                		<c:when test="${ snsItem.snsTy eq 'F' }">facebook</c:when>
                		<c:when test="${ snsItem.snsTy eq 'I' }">Instagram</c:when>
                		<c:when test="${ snsItem.snsTy eq 'Y' }">Youtube</c:when>
                		<c:when test="${ snsItem.snsTy eq 'T' }">Twitter</c:when>
                		<c:when test="${ snsItem.snsTy eq 'P' }">플러스 친구</c:when>
                		<c:when test="${ snsItem.snsTy eq 'L' }">LinkedIn</c:when>
                		<c:otherwise>Unknown</c:otherwise>
                	</c:choose>
                </span>
                <span class="sns_text"><c:out value="${snsItem.snsSj }"/></span>
                <a href="<c:out value="${snsItem.snsUrl }"/>" target="_blank" title="새창" rel="noopener noreferrer" class="sns_more">Read More</a> 
            </div>
        </div>
        </c:forEach>
    </div>
    <div class="sns_control">
        <button type="button" class="sns_prev">이전보기</button>
        <button type="button" class="sns_next">다음보기</button>
    </div>
    </c:if>
</div>
