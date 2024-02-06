<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

					<div class="family_wrap">
                        <button type="button" class="family_btn" title="주요사이트 열기">
                            주요 홈페이지
                        </button>
                        <div class="family_box" title="주요사이트 닫힘">
                            <c:catch var="fc_ex"><jsp:include page="/common/deco/family_content.jsp"/></c:catch>
                        </div>
                    </div>