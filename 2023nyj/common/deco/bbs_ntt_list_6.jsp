<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<div class="notice_box">
	<c:forEach items="${siteIncludeBbs.bbsNttVOList }" var="result">
	<div class="notice_item">
    	<a href="selectBbsNttView.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }&nttNo=${result.nttNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="notice_link">
      		<div class="notice_title"> <c:out value="${result.nttSj }"/> </div>
      		<div class="notice_text"> <c:out value="${result.nttCn }"/> </div>
    	</a>
  	</div>
  	</c:forEach>
</div>
<div class="notice_control">
	<button type="button" class="arrow_btn prev_btn">이전</button>
	<div class="dots"></div>
	<button type="button" class="arrow_btn next_btn">다음</button>
</div>
<div class="notice_more">
	<a href="selectBbsNttList.do?key=${siteIncludeBbs.menuNo }&bbsNo=${siteIncludeBbs.bbsNo }<c:if test="${siteIncludeBbs.isDeptBbs eq 'Y' }">&sf.dc=<c:out value="${siteIncludeBbs.deptCode }"/></c:if>" class="more_btn">
		<span>더보기</span>
	</a>
	<%--
	<c:choose>	
    <c:when test="${siteInfo.siteId eq 'kgraduate'}">
      <!-- 여기에 일반대학원 kgraduate 용 more_btn -->
      <a href="/kgraduate/selectBbsNttList.do?bbsNo=413&key=146" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'kmba'}">
      <!-- 여기에 서비스경영전문대학원 kmba 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'politics'}">
      <!-- 여기에 정치전문대학원 politics 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'stourism'}">
      <!-- 여기에 관광전문대학원 stourism 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'pubadmin'}">
      <!-- 여기에 행정복지상담대학원 pubadmin 용 more_btn -->
      <a href="/pubadmin/selectBbsNttList.do?bbsNo=500&key=310" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'educate'}">
      <!-- 여기에 교육대학원 educate 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'gindustrial'}">
      <!-- 여기에 공학대학원 gindustrial 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'artgrad'}">
      <!-- 여기에 예술대학원 artgrad 용 more_btn -->
      <a href="/artgrad/selectBbsNttList.do?bbsNo=11&key=461" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'kgam'}">
      <!-- 여기에 대체의학대학원 kgam 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:when test="${siteInfo.siteId eq 'hallyu'}">
      <!-- 여기에 한류문화대학원 hallyu 용 more_btn -->
      <a href="" class="more_btn">
        <span>더보기</span>
      </a>
    </c:when>
    <c:otherwise></c:otherwise>
  </c:choose>
	--%>
</div>