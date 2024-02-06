<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
		<div class="lnb">
            <div class="wrap">
                <div class="lnb_topbox">
                    <div class="login">
						<c:catch var="auth_ex"><jsp:include page="/common/deco/login.jsp"/></c:catch>
                    </div>
					<c:catch var="header_ex"><jsp:include page="/common/deco/header_link_family_wrap.jsp"/></c:catch>
                </div>
                <nav class="menu after eachdown">
                    <h2 class="skip">메뉴</h2>
                    <div class="depth depth1">
                         <c:catch var="tm_ex"><jsp:include page="/repository/${siteInfo.siteId}/menu/top.jsp"/></c:catch>
                    </div>
                </nav>
                <div class="menu_hide">
                    <button type="button" class="menu_button">메뉴 닫기</button>
                </div>
            </div>
        </div>
