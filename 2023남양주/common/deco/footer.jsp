<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<footer id="footer">
        <div class="footer_banner">
            <div class="wrap">
                <div class="slide_control">
                    <button type="button" class="banner_btn prev">이전</button>
                    <button type="button" class="banner_btn auto">정지</button>
                    <button type="button" class="banner_btn next">다음</button>
                </div>
                <ul class="banner_list">
                    <li class="banner_item">
                        <a href="">비영리 변호사정보센터</a>
                    </li>
                    <li class="banner_item">
                        <a href="">경기공유서비스</a>
                    </li>
                    <li class="banner_item">
                        <a href="">남양주시어린이급식관리지원센터</a>
                    </li>
                    <li class="banner_item">
                        <a href="">바른땅 지적재조사행정시스템</a>
                    </li>
                    <li class="banner_item">
                        <a href="">중앙부처 법령 유권해석</a>
                    </li>
                    <li class="banner_item">
                        <a href="">남양주시 노인복지회관</a>
                    </li>
                    <li class="banner_item">
                        <a href="">남양주시 자율방재단</a>
                    </li>
                    <li class="banner_item">
                        <a href="">비영리 변호사정보센터</a>
                    </li>
                    <li class="banner_item">
                        <a href="">비영리 변호사정보센터</a>
                    </li>
                    <li class="banner_item">
                        <a href="">비영리 변호사정보센터</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer_address">
            <div class="wrap">
                <ul class="footer_link">
                    <li class="link_item point_link">
                        <a href="">개인정보 처리방침</a>
                    </li>
                    <li class="link_item">
                        <a href="">사이트맵</a>
                    </li>
                    <li class="link_item">
                        <a href="">조직안내</a>
                    </li>
                    <li class="link_item">
                        <a href="">찾아오시는 길</a>
                    </li>
                </ul>
                <div class="footer_info">
                    <ul>
                        <li class="footer_item">
                           ${siteInfo.insttAdres}
                        </li>
                        <li class="footer_item">
                            ${siteInfo.insttTelno}
                        </li>
                        <li class="footer_item">
                            ${siteInfo.insttFax}
                        </li>
                    </ul>
                    <p>${siteInfo.siteCpyrht}</p>
                </div>
            </div>
        </div>
        <div class="up">
            <a href="#wrapper" class="up_button">맨위로</a>
        </div>
    </footer>

