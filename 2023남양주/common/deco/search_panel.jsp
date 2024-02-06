<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			
            <div class="search_panel">
                <div class="wrap">
                    <div class="search_title">더욱 강화된 검색으로<br><span>간편하게 정보</span>를 찾아드립니다.</div>
                    <form class="search_form" method="post" action="/search/search.do"><!-- ★호환성 준수를 위해 임시로 action="javascript:void(0);" 넣었음★ 개발시 action 값 채워주세요 javascript로 개발하여 action이 필요없다면 form 태그 제거요망 2023-04-06 서정한 -->
                        <fieldset class="search_fieldset">
                            <legend>검색</legend>
                            <div class="search_input">
                                <input type="hidden" name="category" value="TOTAL"/>
								<input type="search" class="search_query" id="sub_search_kwd_${siteInfo.siteId}" name="kwd" title="검색어 입력" placeholder="검색어를 입력하세요">
                                <button type="submit" class="search_submit" title="검색"><span class="skip">검색</span></button>
                                <!-- 검색어 입력 시 자동완성 목록이 보이게 해주세요. ex)'경기' 입력시 -->
                                <div id="auto_list_div" class="search_auto" style="display:none">
                                    <ul class="auto_list">
										<li class="skip">추천검색어자동완성</li>
                                    </ul>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <div class="search_keyword">
                        <div class="keyword_box">
                            <div class="keyword_title">내가찾은 검색어</div>
							<div class="keyword_list recent" id="my_keyword"></div>
                        </div>
                        <div class="keyword_box">
                            <div class="keyword_title">인기 검색어</div>
                            <div class="keyword_list popular">
                                
                            </div>
                        </div>
                    </div>
                    <button type="button" class="search_hide"><span class="skip">닫기</span></button>
                </div>
            </div>
			<script>
			// 검색어 추천
			$(document).on('focusout', '#sub_search_kwd_${siteInfo.siteId}', function() {
				$('ul.auto_list li:not(.skip)').remove();
				$('#auto_list_div').hide();
			});
			
			$(document).on('keyup', '#sub_search_kwd_${siteInfo.siteId}', function() {
				var term = $('#sub_search_kwd_${siteInfo.siteId}').val();
				$('#auto_list_div').show();
				
				if(term != '') {
					console.log(term);
					$.ajax({
						url: "/search/ksf/akc.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: { mode: 's', domain_no : 0, term: term, max_count : 5 },
						method: "GET",
						dataType: "json"
					})
					.done(function(json) {
						$('ul.auto_list li:not(.skip)').remove();
						for(i in json.suggestions) {
							var kwdArr = json.suggestions[i];
							for(j in kwdArr) {
								var kwd = kwdArr[j];
								console.log(kwd);
								var li = '<li class="auto_item"><a href="/search/search.do?category=TOTAL&kwd=' + encodeURIComponent(kwd) + '">' + kwd + '</a></li>';
								$("ul.auto_list").append(li);
							}
						}
					});
				}
				else {
					
				}
			});
									
			// 인기검색어
			$.ajax({
				url: "/search/ksf/ppk.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: { fields:"daily" },
				method: "GET",
				dataType: "json"
			})
			.done(function(json) {
				console.log(json);
				for(idx in json) {
					var kwd = json[idx].ppk;
					var li = '<div class="keyword_item"><a href="/search/search.do?category=TOTAL&kwd=' + encodeURIComponent(kwd) + '" target="_blank" title="새창" rel="noopener noreferrer">#' + kwd + '</a><button type="button" class="keyword_del">삭제</button></div>';
					$('.keyword_list.popular').append(li);
				}
			});
			</script>
			
			<!-- // 내가찾은 검색어 -->
			<script src="/common/js/jquery-ui.js"></script>
			<script src="/common/js/jquery.cookie.js"></script>
			<script>
			(function ($, undefined) {
				$.widget( "konan.recent", {
					options: {
						cookie: {
							name: "konan-recent",
							separator: "__",
							setting : { path: '/',	expires: 365}
						},
						max_count: 10
					},
				
					_create: function() {
						this.ol = $("<ul>")/*.addClass("keyword_list")*/.appendTo(this.element.empty());
						this.boxMsg = $("<div>").addClass("box-msg").text('내가 찾은 검색어가 없습니다.').appendTo(this.element);
						
						var that = this, 
							items = this._read();
						if (items) {
							$.each( items, function( index, item ) {
								that._renderItem(that.ol, item, true);
							});
							if (items.length > 0) {
								this.boxMsg.hide();
							}
						}
				
						this._on({
							"click .keyword_del": function( event ) {
								$( event.target ).parents( "li:first" ).remove();
								that._write();
								if (that.ol.children().size() == 0) {
									this.boxMsg.show();
								}
							}
						});
					},
					
					_read: function() {
						//var cookie = $.cookie(this.options.cookie.name, this.options.cookie.setting);
						var cookie = $.cookie(this.options.cookie.name);
						return (cookie) ? unescape(cookie).split(this.options.cookie.separator) : null;
					},
				
					_write: function() {
						$.cookie(this.options.cookie.name, escape(this.ol.find( "a" ).map(function() {
							return $(this).text();
						}).get().join(this.options.cookie.separator)), this.options.cookie.setting);
					},
					
					add: function( item ) {
						var term = $.trim(item);
						if ( term ) {
							this.boxMsg.hide();
							this.ol.find( "a" ).filter(function() { return $(this).text() === term; }).parent().remove();
							this._renderItem(this.ol, term, false);
							if (this.ol.children().size() > this.options.max_count) {
								this.ol.find( "li:last ").remove();
							}
							this._write();
						}
					},
				
					_renderItem: function(ol, item, append) {
						var li = $('<li class="keyword_item">').append( $('<a href="/search/search.do?category=TOTAL&kwd=' + encodeURIComponent(item) + '" target="_blank" title="새창" rel="noopener noreferrer">').text(item) ).append('<button type="button" class="keyword_del">삭제</button>');
						return append ? li.appendTo(ol) : li.prependTo(ol);
					}
				});
			}(jQuery));
			
			$('#my_keyword').recent();
			</script>