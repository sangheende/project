<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<h2 class="skip">갤러리</h2>
<div class="wrap">
    <p class="galley_title">PHOTO <br> GALLERY</p>
    <div class="gallery_list n1">
		<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
        <div class="gallery_item">
            <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="gallery_anchor">
            	<c:url var="imageUrl" value="${result.firstImage.storePath}/${result.firstImage.storeFileNm }" />
            	<div class="galley_photo" style="background-image: url('${imageUrl }')">
            		<img src="${imageUrl }" alt="<c:out value="${result.replcText }"/>">
        		</div>
        		<div class="gallery_cont">
            		<p class="gallery_text"><c:out value="${result.nttSj }"/></p>
            		<span class="gallery_date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
        		</div>
    		</a>
		</div>
		</c:forEach>
	</div>
	<div class="gallery_control">
    	<div class="btn_wrap">
        	<button type="button" class="gallery_btn prev" style="">이전</button>
   			<button type="button" class="gallery_btn next" style="">다음</button>
		</div>
		<%--
		<c:choose>
		   <c:when test="${siteInfo.siteId eq 'ge'}">
		   <!-- 여기에 진성애교양대학 ge 용 galley_more -->
		   <a href="/ge/selectBbsNttList.do?bbsNo=1067&key=7506&" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'hcc'}">
		   <!-- 여기에 인문대학 hcc 용 galley_more -->
		   <a href="" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'phyedu'}">
		   <!-- 여기에 예술체육대학 phyedu 용 galley_more -->
		   <a href="" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'u_social'}">
		   <!-- 여기에 사회과학대학 u_social 용 galley_more -->
		   <a href="/u_social/selectBbsNttList.do?bbsNo=1070&key=7509" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'u_softmanage'}">
		   <!-- 여기에 소프트웨어경영대학 u_softmanage 용 galley_more -->
		   <a href="/u_softmanage/selectBbsNttList.do?bbsNo=637&key=7121" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'fsbt'}">
		   <!-- 여기에 융합과학대학 fsbt 용 galley_more -->
		   <a href="/fsbt/selectBbsNttList.do?bbsNo=1072&key=7511" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'u_engineering'}">
		   <!-- 여기에 창의공과대학 u_engineering 용 galley_more -->
		   <a href="/u_engineering/selectBbsNttList.do?bbsNo=576&key=3401" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:when test="${siteInfo.siteId eq 'u_tour'}">
		   <!-- 여기에 관광문화대학 u_tour 용 galley_more -->
		   <a href="/u_tour/selectBbsNttList.do?bbsNo=997&key=7298" class="gallery_more">갤러리 더보기</a>
		   </c:when>
		   <c:otherwise>
		   <a href="" class="gallery_more">갤러리 더보기</a>
		   </c:otherwise>
		</c:choose>
		--%>
		<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }" class="gallery_more">
			<span>더보기</span>
		</a>
    </div>
</div>
