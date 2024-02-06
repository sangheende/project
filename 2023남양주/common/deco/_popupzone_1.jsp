<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty popupZoneItmList and fn:length(popupZoneItmList) gt 0 }">

<section class="banner <c:out value="${popupZoneClass }"/>">
	<h2 class="skip"><c:out value="${popupZoneNm }"/></h2>
	<div class="banner_list">
		<c:forEach items="${popupZoneItmList }" var="popupZoneItm" varStatus="popupZoneItmStatus">
		<div class="banner_item">
			<a href="<c:out value="${popupZoneItm.linkUrl }"/>" <c:if test="${not empty popupZoneItm.linkTrget }">target="<c:out value="${popupZoneItm.linkTrget }"/>" title="새창"</c:if>>
				<img src="<c:out value="/DATA/popup/${popupZoneItm.imageFileNm }"/>" alt="<c:out value="${popupZoneItm.imageReplcText }"/>">
			</a>
		</div>
		</c:forEach>
	</div>
	<div class="banner_control">
		<span class="banner_count"> <span class="banner_current"></span>/<span
			class="banner_total"></span>
		</span>
		<button type="button" class="banner_auto"></button>
		<button type="button" class="banner_prev">이전보기</button>
		<button type="button" class="banner_next">다음보기</button>
	</div>
</section>

<section class="m_banner <c:out value="${popupZoneClass }"/>">
	<h2 class="skip">모바일 <c:out value="${popupZoneNm }"/></h2>
	<div class="banner_list">
		<c:forEach items="${popupZoneItmList }" var="popupZoneItm" varStatus="popupZoneItmStatus">
		<div class="banner_item">
			<a href="<c:out value="${popupZoneItm.linkUrl }"/>" <c:if test="${not empty popupZoneItm.linkTrget }">target="<c:out value="${popupZoneItm.linkTrget }"/>" title="새창"</c:if>>
				<c:choose>
					<c:when test="${not empty popupZoneItm.imageFileNmMobile }">
					<img src="<c:out value="/DATA/popup/${popupZoneItm.imageFileNmMobile }"/>" alt="<c:out value="${popupZoneItm.imageReplcText }"/>">
					</c:when>
					<c:otherwise>
					<img src="<c:out value="/DATA/popup/${popupZoneItm.imageFileNm }"/>" alt="<c:out value="${popupZoneItm.imageReplcText }"/>">
					</c:otherwise>
				</c:choose>				
				
			</a>
		</div>	
		</c:forEach>
	</div>
	<div class="banner_control">
		<span class="banner_count"> <span class="banner_current"></span>/<span
			class="banner_total"></span>
		</span>
		<button type="button" class="banner_auto"></button>
	</div>
</section>

</c:if>