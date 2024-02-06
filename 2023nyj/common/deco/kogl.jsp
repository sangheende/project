<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                    
                    
                    <h3 class="skip">공공누리 공공저작물</h3>
                    <c:choose>
                        <c:when test="${kogl eq 'KOGLTY01'}">
                            <div class="kogl_open">
                                <img src="/common/images/program/img_opencode1.jpg" alt="제1유형 : 출처표시 - 공공누리 공공저작물 자유이용허락" class="p-media__image--left">
                                본 저작물은 <em class="em_red">"공공누리 제1유형 : 출처표시"</em> 조건에 따라 이용할 수 있습니다.
                            </div>
                        </c:when>
                        <c:when test="${kogl eq 'KOGLTY02'}">
                            <div class="kogl_open">
                                <img src="/common/images/program/img_opencode2.jpg" alt="제2유형 : 출처표시 + 상업적 이용금지 - 공공누리 공공저작물 자유이용허락" class="p-media__image--left">
                                본 저작물은 <em class="em_red">"공공누리 제2유형 : 출처표시 + 상업적 이용금지"</em> 조건에 따라 이용할 수 있습니다.
                            </div>
                        </c:when>
                        <c:when test="${kogl eq 'KOGLTY03'}">
                            <div class="kogl_open">
                                <img src="/common/images/program/img_opencode3.jpg" alt="제3유형 : 출처표시 + 변경금지 - 공공누리 공공저작물 자유이용허락" class="p-media__image--left">
                                본 저작물은 <em class="em_red">"공공누리 제3유형 : 출처표시 + 변경금지"</em> 조건에 따라 이용할 수 있습니다.
                            </div>
                        </c:when>
                        <c:when test="${kogl eq 'KOGLTY04'}">
                            <div class="kogl_open">
                                <img src="/common/images/program/img_opencode4.jpg" alt="제4유형 : 출처표시 + 상업적 이용금지 + 변경금지 - 공공누리 공공저작물 자유이용허락" class="p-media__image--left">
                                본 저작물은 <em class="em_red">"공공누리 제4유형 : 출처표시 + 상업적 이용금지 + 변경금지"</em> 조건에 따라 이용할 수 있습니다.
                            </div>
                        </c:when>
                    </c:choose>