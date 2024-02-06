<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
					<footer class="satisfaction">
						<c:if test="${not empty kogl}">
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
						</c:if>
						
						
						<h3 class="skip">콘텐츠 만족도 조사</h3>
						<div class="satisfaction_list clearfix">
							<p class="question">이 페이지에서 제공하는 정보에 대하여 어느 정도 만족하셨습니까?</p>
							<form method="post" name="" action="" onsubmit="">
								<fieldset>
									<legend>만족도 조사</legend>
									<div class="input_radio">
										<input name="" value="" id="value5" type="radio"><label for="value5">매우만족</label>
										<input name="" value="" id="value4" type="radio"><label for="value4">만족</label>
										<input name="" value="" id="value3" type="radio"><label for="value3">보통</label>
										<input name="" value="" id="value2" type="radio"><label for="value2">불만족</label>
										<input name="" value="" id="value1" type="radio"><label for="value1">매우불만족</label>
									</div>
									<div class="opinion">
										<input type="text" name="" id="" title="의견을 입력해주세요" placeholder="의견을 입력해 주세요">
										<span class="opinion_submit"><input type="submit" value="의견등록"></span>
									</div>
								</fieldset>
							</form>
						</div>
						<c:if test="${not empty menuInfo.deptNm or not empty menuInfo.emplTelno or not empty menuInfo.cntntsLastUpdusrPnttm}">
						<h3 class="skip">담당자 정보</h3>
						<div class="manager_info clearfix">
							<ul class="clearfix">
								<c:if test="${not empty menuInfo.deptNm}">
								<li><span>담당부서</span> 
								<c:choose>
								<c:when test="${not empty deptHmpg}">
								<a href="<c:out value="${deptHmpg}"/>">${menuInfo.deptNm}</a>
								</c:when>
								<c:otherwise>
								${menuInfo.deptNm}
								</c:otherwise>
								</c:choose>
								</li>
								</c:if>
								<c:if test="${not empty menuInfo.emplTelno}"><li><span>전화번호</span> <a href="tel:${menuInfo.emplTelno}">${menuInfo.emplTelno}</a></li></c:if>
								<c:if test="${not empty menuInfo.cntntsLastUpdusrPnttm}"><li><span>최종수정일</span> ${menuInfo.cntntsLastUpdusrPnttm}</li></c:if>
							</ul>
						</div>
						</c:if>
					</footer>

