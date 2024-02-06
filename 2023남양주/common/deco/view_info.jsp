<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="pageFileLocation">
    <p><span class="em_b">ViewFile : </span>
        <c:choose>
            <c:when test="${!empty viewFile}">
                ${viewFile}
            </c:when>
            <c:otherwise>
                <%=request.getServletPath()%>
            </c:otherwise>
        </c:choose>
    </p>
    <p><span class="em_b">Validator : </span><a href="https://validator.w3.org/check?uri=referer" target="_blank" title="W3C Markup Validation 새 브라우저 열림">HTML</a> / <a href="https://jigsaw.w3.org/css-validator/check/referer" target="_blank" title="W3C CSS Validation 새 브라우저 열림">CSS</a></p>
</div>