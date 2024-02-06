<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<input type="hidden" name="<%=kr.co.hanshinit.NeoCMS.cmm.util.TokenMngUtil.TOKEN_KEY_PARAMETER_NAME%>" value="${TOKEN_KEY_VAL}"/>
<input type="hidden" name="<%=kr.co.hanshinit.NeoCMS.cmm.util.TokenMngUtil.TOKEN_VAL_PARAMETER_NAME%>" value="${TOKEN_VAL}"/>
<input type="hidden" name="<%=kr.co.hanshinit.NeoCMS.cmm.util.TokenMngUtil.FAIL_URL_PARAMETER_NAME%>" value="${FAIL_URL_VAL}"/>
