<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
						<div class="pathbox">
                            <ul class="path">
                               <li class="path_item home">
									<a href="${pageContext.request.contextPath}/${siteInfo.siteId}/index.do" class="path_btn">홈</a>
                               </li>
								<c:forEach var="navi" items="${menuInfo.naviList}" varStatus="status">
                                <li class="path_item">
                                    <a href="${pageContext.request.contextPath}/${siteInfo.siteId}/sub.do?key=${navi.menuNo}" class="path_btn"><c:out value="${navi.menuNm}"/></a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
