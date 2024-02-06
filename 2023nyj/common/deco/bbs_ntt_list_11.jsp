<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<c:if test="${empty siteIncludeBbs.bbsNttVOList and fn:length(siteIncludeBbs.bbsNttVOList) le 0 }">
등록된 게시물이 없습니다.
</c:if>

<c:if test="${not empty siteIncludeBbs.bbsNttVOList and fn:length(siteIncludeBbs.bbsNttVOList) gt 0 }">
    <div class="main_slide_list">
    	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
        <div class="main_slide_item">
            <a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>">
                <div class="title">
                    <div class="category">KGU NEWS</div>
                    <div class="text"><c:out value="${result.nttSj }"/></div>

                </div>
                <div class="source">
                    <span class="source_txt">경기일보</span>
                    <span class="date"><c:out value="${result.frstRegisterPnttmYMD }"/></span>
                </div>
                <div class="photo_box">
                	<c:url var="imageUrl" value="${result.firstImage.storePath}/${result.firstImage.storeFileNm }" />
                    <div class="inner_img" style="background-image: url('${imageUrl }')">                    
                        <img src="${imageUrl }" alt="이미지">
                    </div>
                </div>
            </a>
        </div>
        </c:forEach>
    </div>
    <div class="sub_slide_list">
    	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
        <div class="sub_slide_item">
            <div class="title">
                <div class="text"><c:out value="${result.nttSj }"/></div>
                <div class="date"><c:out value="${result.frstRegisterPnttmYMD }"/></div>
            </div>
        </div>
        </c:forEach>
    </div>
    <div class="visual_control">
        <button type="button" class="arrow prev">이전</button>
        <button type="button" class="arrow next">다음</button>
    </div>
    <div class="slide_bot">
        <div class="slide_btn">
            <button type="button" class="auto">재생</button>
            <a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="news_link">KGU NEWS더보기</a>
        </div>
    </div>
</c:if>
