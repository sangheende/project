<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="kr.co.hanshinit.NeoCMS.cmm.util.*"%>
<%@ page import="kr.co.hanshinit.NeoCMS.sym.sit.sii.service.*"%>
<%@ page import="kr.co.hanshinit.NeoCMS.cop.pum.pui.service.*" %>
<%@ page import="kr.co.hanshinit.NeoCMS.cmm.service.*" %>
<%
if(request.getAttribute("popupItemList") == null) {
    SiteInfo siteInfo = (SiteInfo)request.getAttribute("siteInfo");
    if(siteInfo != null) {
        WebApplicationContext wac = null;
        try {
            wac = WebApplicationContextUtils.getRequiredWebApplicationContext(((HttpServletRequest) request).getSession().getServletContext());
            String siteId = siteInfo.getSiteId();
    
            out.println("<!--" + siteId + "-->");
            //팝업
            PopupItemService popupItemService = (PopupItemService)wac.getBean("popupItemService");
            List<PopupItemVO> popupItemList = popupItemService.selectPopupItemList(siteId, "always");
            request.setAttribute("popupItemList", popupItemList);
        }
        catch(Exception e) {
    
        }
    }
}
%>

<c:if test="${fn:length(popupItemList) gt 0}">
    <c:set var="sNumber" value="1"/>
    <c:forEach items="${popupItemList}" var="popupItem">
        <c:choose>
            <c:when test="${popupItem.type eq 'window'}">
                <script>
                //<![CDATA[
                    var popup_expire_str_${sNumber} = localStorage.getItem("popup${sNumber}");
                    var popup_expire${sNumber} = {expire:0};
                    if(popup_expire_str_${sNumber} != null) {
                        popup_expire${sNumber}  = JSON.parse(popup_expire_str_${sNumber});
                    }
                    var now_timestamp${sNumber} = Date.now();

                    if(popup_expire${sNumber} && now_timestamp${sNumber} < popup_expire${sNumber}.expire) {
                        window.open('/common/popup.jsp?link=<c:out value="${popupItem.linkUrl}"/>&target=<c:out value="${popupItem.linkTrget}"/>&num=<c:out value="${sNumber}"/>&pitem=<c:out value="${popupItem.popupIemNo}"/>&img=<c:out value="${popupItem.imageFileNm}"/>&width=<c:out value="${popupItem.popupw}"/>&height=<c:out value="${popupItem.popuph}"/>','spop${sNumber}','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no, width=${popupItem.popupw}px,height=${popupItem.popuph+35 }px, left=${popupItem.popupx }px, top=${popupItem.popupy }px');
                    }
                //]]>
                </script>
            </c:when>
            <c:otherwise>
                <div class="popup_layer popup${sNumber}" style="z-index:1000;position:absolute;border:double;left:${popupItem.popupx}px; top:${popupItem.popupy}px;">
                    <a <c:if test="${popupItem.popupw gt 0}"> style="max-height:${popupItem.popuph}px;" </c:if> href="${popupItem.linkUrl}" target="${popupItem.linkTrget}"<c:if test="${popupItem.linkTrget eq '_blank'}"> title="새창"</c:if>><img style="width:${popupItem.popupw}px; height:${popupItem.popuph}px;" src="/DATA/popup/${popupItem.imageFileNm}" alt="${popupItem.imageReplcText}" /></a>
                    <div class="popup_close clearfix">
                        <div class="popup_close_left">
                            <input type="checkbox" name="today_close${sNumber}" id="today_close${sNumber}" value="checkbox" />
                            <label for="today_close${sNumber}">1일간 다시보지않기</label>
                        </div>
                        <div class="popup_close_right">
                            <button type="button" onclick="closePopup${sNumber}();">닫기</button>
                        </div>
                    </div>
                </div>
                <script>
                //<![CDATA[
                    function closePopup${sNumber}() {
                        if($("#today_close${sNumber}").is(":checked")) {
                            var expire_timestamp = Date.now() + (1000 * 60 * 60 * 24);
                            var expire_obj = {
                                expire : expire_timestamp
                            };
                            localStorage.setItem("popup${sNumber}", JSON.stringify(expire_obj));
                        }

                        $('.popup${sNumber}').hide();
                    }

                    var popup_expire_str_${sNumber} = localStorage.getItem("popup${sNumber}");
                    var popup_expire${sNumber} = {expire:0};
                    if(popup_expire_str_${sNumber} != null) {
                        popup_expire${sNumber}  = JSON.parse(popup_expire_str_${sNumber});
                    }
                    var now_timestamp${sNumber} = Date.now();

                    //console.log(popup_expire${sNumber});
                    //console.log(now_timestamp${sNumber});

                    if(popup_expire${sNumber} && now_timestamp${sNumber} < popup_expire${sNumber}.expire) {
                        $('.popup${sNumber}').hide();
                    }
                    else{
                        $('.popup${sNumber}').show();
                    }
                //]]>
                </script>
            </c:otherwise>

        </c:choose>

    <c:set var="sNumber" value="${sNumber+1}"/>
    </c:forEach>
</c:if>