<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <div class="main n2">
                <div class="wrap">
                    <section class="custom">
                        <h2 class="skip">맞춤정보</h2>
                        <div class="custom_info">
                            <!--<div class="info_tag">
                                <ul class="tag_list">
                                </ul>
                                <span class="tag_text">의 정보만 찾았어요.</span>
                                <button type="button" class="tag_set">맞춤옵션</button>
                            </div>-->


							<div id="todayMenuView">
								<!-- /todayMenuViewHTML.do -->
							</div>

							<div id="fitInfoView">
								<div class="fitInfoWrap">
									<!-- /fitInfoMenuViewHTML.do -->
								</div>
							</div>


							<div class="info_season">
								<c:forEach var="tb" items="${tongNoticeBbsNttListMap}">
								<c:set var="bl" value="${tb.value}"/>
								<c:if test="${not empty bl and fn:length(bl) gt 0}">
								<div class="season_sub_title">${tb.key}</div>
	                            <ul class="season_sub_list type2">
								<c:forEach var="n" items="${bl}">
	                                <li><a href="./selectBbsNttView.do?key=7520&amp;bbsNo=${n.bbsNo}&amp;nttNo=${n.nttNo}"><c:out value="${n.nttSj}"/></a></li>
								</c:forEach>
	                            </ul>
								</c:if>
								</c:forEach>
							</div>

							<div id="subscriptBbsView">
								<div class="info_season">
									<!-- /subscriptBbsViewHTML.do -->
								</div>
							</div>

                        </div>

						<div class="custom_cont swiper-no-swiping"></div>
                    </section>
                </div>
            </div>
