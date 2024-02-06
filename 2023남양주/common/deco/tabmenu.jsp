<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




                        <c:if test="${fn:length(tabMenuList) gt 0}">

						<c:choose>
						<c:when test="${fn:length(tabMenuList) lt 5 }">
						<div class="tab type1">
						</c:when>
						<c:otherwise>
						<div class="tab type2">
						</c:otherwise>
						</c:choose>

                            <div class="tab_menu">
								<c:forEach var="tm" items="${tabMenuList}" varStatus="status">
								<c:if test="${menuInfo.menuNo eq tm.menuNo or menuInfo.upperMenuNo eq tm.menuNo}">
								<button class="tab_select"><span><c:out value="${tm.menuNm}"/></span></button>
								</c:if>
								</c:forEach>

								<div class="tab_panel">
									<c:forEach var="tabMenu" items="${tabMenuList}">
										<div style="display:none;"><c:out value="${tabMenu.menuNm}"/></div>
									</c:forEach>


									<ul class="tab_list">
										<c:forEach var="tabMenu" items="${tabMenuList}">
											<li class="tab_item<c:if test="${not empty tabMenu.childMenuList and fn:length(tabMenu.childMenuList) gt 0}"> has</c:if><c:if test="${menuInfo.menuNo eq tabMenu.menuNo or menuInfo.upperMenuNo eq tabMenu.menuNo}"> active</c:if>">
											<a <c:if test="${menuInfo.menuNo eq tabMenu.menuNo or menuInfo.upperMenuNo eq tabMenu.menuNo}"> title="선택됨"</c:if> class="tab_button" href="<c:out value="${tabMenu.menuUrl}"/>" target="<c:out value="${tabMenu.linkTrget}"/>"><span><c:out value="${tabMenu.menuNm}"/></span></a>

											<c:if test="${not empty tabMenu.childMenuList and fn:length(tabMenu.childMenuList) gt 0}">
											<div class="tab_depth tab_depth2">    <!--//하위메뉴 탭안에 탭이 또 있는경우 마크업 표출 , 아닐때는 삭제-->
												<!--//1000px 아래에서 사용하는 6차 탭메뉴 열고닫는 버튼-->
												<!--//button 안에 텍스트가 선택된 6차 탭메뉴의 텍스트가 들어올 수 있게 개발 필요합니다-->
												<button type="button" title="목록 열기" class="tab_depth2_open"><span><em><c:out value="${menuInfo.menuNm}"/></em></span></button>    <!--//tab_depth2_open-->
												<ul class="cms_tab_list">
													<c:forEach var="cm" items="${tabMenu.childMenuList}">
													<li class="cms_tab_item<c:if test="${cm.menuNo eq menuInfo.menuNo}"> active</c:if>">    <!--//선택된 메뉴에 active 클레스와 title="선택됨" 개발요청-->
														<a class="cms_tab_link" href="<c:out value="${cm.menuUrl}"/>" target="<c:out value="${cm.linkTrget}"/>" <c:if test="${cm.menuNo eq menuInfo.menuNo}"> title="선택됨"</c:if>><span><em><c:out value="${cm.menuNm}"/></em></span></a>
													</li>    <!--//cms_tab_item-->
													</c:forEach>
												</ul>
											</div>
											</c:if>
										</li>    <!--//cms_tab_item-->
										</c:forEach>
									</ul>
								</div>
							</div>
                        </div>

                        </c:if>
