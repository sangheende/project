<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.hanshinit.NeoCMS.cmm.util.*" %>
<%
	String mode = "";
	String result = "";
	int domain_no = 0;
	int max_count = 10;
	try {
		mode = request.getParameter("mode");
		
		if(mode == null) {
			mode = "rankings";
		}
		
		domain_no = Integer.parseInt(request.getParameter("domain_no"));
		
		if(domain_no != 0 && domain_no != 1) {
			domain_no = 0;
		}
		
		max_count = Integer.parseInt(request.getParameter("max_count"));
		
		if(max_count < 1 || max_count > 30) {
			max_count = 10;
		}
	}
	catch(IllegalArgumentException e) {
		//LoggingUtil.log(e.getMessage());
	} 
	
	if("rankings".equals(mode)) {
		result = HttpClientUtil.getResponseString("http://127.0.0.1:7614/ksf/api/rankings?domain_no=" + domain_no + "&max_count=" + max_count, "utf-8", 1000, 1000);
	}
	else if("suggest".equals(mode)) {
		String term = request.getParameter("term");
		result = HttpClientUtil.getResponseString("http://127.0.0.1:7614/ksf/api/suggest?domain_no=" + domain_no + "&max_count=" + max_count + "&target=related&term="+StringUtil.encode(term, "utf-8"), "utf-8", 1000, 1000);
	}
	
	out.println(result);
%>
	