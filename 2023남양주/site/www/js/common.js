// 탭메뉴 공통적으로 사용
function tabOn(tab,num,img) {
    var $tab,$tab_btn;
    var tabid=tab, n=num-1, btn_img=img;

    $tab = $(tabid+'> ul > li');
    $tab_btn = $(tabid+'> ul > li > a');

    $tab_btn.siblings().hide();
    $tab.eq(n).addClass('active');
    $tab.eq(n).children('a').siblings().show();

    if(btn_img =='img'){
        var btn = $tab.eq(n).children('a').find("img");
        btn.attr("src",btn.attr("src").replace("_off","_on"));
    }

    $tab_btn.on("click",function(event){
        var realTarget = $(this).attr('href');

        if(realTarget != "#"){
            return
        }
        if(btn_img =='img'){
            for(var i=0;i<$tab.size();i++){
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src",btn.attr("src").replace("_on","_off"));
            }
            var active = $(this).parent().attr('class');
            if(active != 'active'){
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src =  btn_img_off.src.replace('_off','_on');
            }
        }
        $tab_btn.siblings().hide();
        $tab_btn.parent().removeClass('active');

        $(this).siblings().show();
        $(this).parent().addClass('active');

        event.preventDefault();
    });
}

function tabOrg(tabid,a,img) {
    var $tab, $tab_btn,$obj,$obj_view;
    var tabid = tabid, num = a, btn_img = img;

    $tab = $(tabid+' .tab_item  > li');
    $tab_btn = $(tabid+' .tab_item > li > a');
    $obj = $(tabid+' .tab_obj');
    $obj_view = $(tabid+' .tab_obj.n'+num);

    $tab.eq(num-1).addClass('active');
    $obj_view.show();

    if(btn_img =='img'){
        var btn = $tab.eq(num-1).children('a').find("img");
        btn.attr("src",btn.attr("src").replace("_off","_on"));
    }

    $tab.bind("click",function(event){
        if(btn_img =='img'){
            for(var i=0;i<$tab.size();i++){
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src",btn.attr("src").replace("_on","_off"));
            }
            var active = $(this).parent().attr('class');
            if(active != 'active'){
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src =  btn_img_off.src.replace('_off','_on');
            }
        }

        var this_eq = $tab.index( $(this) );
        $tab.removeClass('active');
        $tab.eq(this_eq).addClass('active');

        $obj.hide();
        $(tabid+' .tab_obj.n'+(this_eq+1)).show();

        event.preventDefault ();
    });
}

$(document).ready(function(){
    //이미지 롤오버
    $('.overimg').mouseover(function (){
        var file = $(this).attr('src').split('/');
        var filename = file[file.length-1];
        var path = '';
        for(i=0 ; i < file.length-1 ; i++){
            path = ( i == 0 )?path + file[i]:path + '/' + file[i];
        }
        $(this).attr('src',path+'/'+filename.replace('_off.','_on.'));
    }).mouseout(function(){
        var file = $(this).attr('src').split('/');
        var filename = file[file.length-1];
        var path = '';
        for(i=0 ; i < file.length-1 ; i++){
            path = ( i == 0 )?path + file[i]:path + '/' + file[i];
        }
        $(this).attr('src',path+'/'+filename.replace('_on.','_off.'));
    });
});

function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'ko'}, 'google_translate_element2');
}

/**
 * @author (주)한신정보기술 퍼블리셔팀
 * @since 2019-03-18
 * @version 1.0.0
 */
(function($) {
    'use strict';

    var $window = $(window),
        $document = $(document),
        $html = $('html'),
        $head = $('head'),
        $screen = $.screen,
        $inArray = $.inArray;

    //브라우저
    var _browser = navigator.userAgent.toLowerCase();

    //ie7일 때
    if(_browser.indexOf('msie 7.0') > -1) {
        _browser = 'ie ie7';

        //ie8일 때
    }else if(_browser.indexOf('msie 8.0') > -1) {
        _browser = 'ie ie8';

        //ie9일 때
    }else if(_browser.indexOf('msie 9.0') > -1) {
        _browser = 'ie ie9';

        //ie10일 때
    }else if(_browser.indexOf('msie 10.0') > -1) {
        _browser = 'ie ie10';

        //ie11일 때
    }else if(_browser.indexOf('trident/7.0') > -1) {
        _browser = 'ie ie11';

        //edge일 때
    }else if(_browser.indexOf('edge') > -1) {
        _browser = 'edge MS';

    }else if(_browser.indexOf('edg/') > -1) {
        _browser = 'edge chromium_based';

        //opera일 때
    }else if(_browser.indexOf('opr') > -1) {
        _browser = 'opera';

        //chrome일 때
    }else if(_browser.indexOf('chrome') > -1) {
        _browser = 'chrome';

        //firefox일 때
    }else if(_browser.indexOf('firefox') > -1) {
        _browser = 'firefox';

        //safari일 때
    }else if(_browser.indexOf('safari') > -1) {
        _browser = 'safari';
    }else{
        _browser = 'unknown';
    }

    /**
     * @name 브라우저 얻기
     * @since 2017-12-06
     * @return {string}
     */
    window.getBrowser = function() {
        return _browser;
    };

    //브라우저 클래스 추가
    $html.addClass(_browser);

    $(function() {
        var $body = $('body'),
            $htmlAndBody = $html.add($body),
            $wrapper = $('#wrapper'),
            $header = $('#header'),
            $container = $('#container'),
            $footer = $('#footer');


        $window.on('screen:wide screen:web', function(event) {
            window.mode = 'pc';
        });

        $window.on('screen:tablet screen:phone', function(event) {
            window.mode = 'mobile';
        });

        //lnb
        var $lnb = $header.find('.lnb'),
            $lnbShow = $header.find('.menu_show'),
            $lnbShowBtn = $lnbShow.find('.menu_button'),
            $lnbHide = $lnb.find('.menu_hide'),
            $lnbHideBtn = $lnbHide.find('.menu_button'),
            $lnbDepthItem = $lnb.find('.depth_item'),
            $lnbMenu = $lnb.find('.menu'),
            $lnbDepth2FirstChild = $lnbMenu.find('.depth2 > :first-child'),
            $lnbSpy = $lnbMenu.find('.spy:last'),
            lnbHeight;
		setTimeout(function(){
			$lnbMenu.attr('data-loaded', 'Y');
		}, 10);
        if(!$lnb.find('.depth2').length){
            $header.attr('data-depth', 'none');
        }
		$lnb.find('.depth1_item').each(function(index, element) {
			var $this = $(this),
				ThisIndex = $this.index(),
				$Depth2 = $this.find('.depth2'),
				IsLast = $this.is(':last-child');
			if(!IsLast){
				$.ajax({
					url : '/site/www/menu/menu_title_'+ThisIndex+'.html',
					async: false,
					success : function (data) {
						$Depth2.prepend(data);
					},
					error:function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});

        function refreshLnbHeight() {
            lnbHeight = $lnbMenu.css('transition-property', 'none').outerHeight() || '';

            $lnbMenu.css('transition-property', '');
        }

        $lnbShowBtn.on('click', function(event) {
            //클래스 토글
            $html.toggleClass('lnb_show');
        });

        $lnbHideBtn.on('click', function(event) {
            //클래스 토글
            $html.removeClass('lnb_show');
        });
        $('.lnb_curtain button').on('click', function(event) {
            $html.removeClass('lnb_show');
        });

        $lnbDepthItem.on('mouseover focusin', function(event) {
            if(mode === 'pc') {
                var $this = $(this),
                    $depth1Item = ($this.hasClass('depth1_item')) ? $this : $this.parents('.depth1_item');
                if(!$header.is('[data-depth="none"]')){
                    if($lnbMenu.hasClass('pulldown')) {
                        var maxHeight = 0;

                        $lnbDepth2FirstChild.each(function(index, element) {
                            var $element = $(element),
                                outerHeight = $element.outerHeight() || 0;

                            //기존 값 보다 얻은 값이 초과일 때
                            if(outerHeight > maxHeight) {
                                maxHeight = outerHeight;
                            }
                        });

                        $lnbMenu.height(lnbHeight + maxHeight);
                    }else if($lnbMenu.hasClass('eachdown')) {
						var depth1Index = $depth1Item.index();
						$lnbMenu.attr('data-active', depth1Index);
                        $lnbMenu.height(lnbHeight + ($depth1Item.find('.depth_list').outerHeight() || ''));
                    }
                }
                $html.addClass('lnb_open');
                $lnbDepthItem.removeClass('active active_prev active_next');
                $this.addClass('active');
                $this.prev('.depth_item').addClass('active_prev');
                $this.next('.depth_item').addClass('active_next');
                $this.parents('li').addClass('active');
                $this.parents('li').prev('.depth_item').addClass('active_prev');
                $this.parents('li').next('.depth_item').addClass('active_next');
            }
            event.stopPropagation();
        }).on('click', function(event) {
            if(mode === 'mobile') {
                var $this = $(this),
                    $depthText = $this.children('.depth_text'),
                    eventTarget = event.target,
                    IsActive = $this.is('.active');

                if($depthText.find(eventTarget).length || $depthText[0] === eventTarget) {
                    if($this.hasClass('depth1_item')) {
                        if($this.hasClass('active')) {
                            $html.removeClass('lnb_open');
                        }else{
                            $html.addClass('lnb_open');
                        }
                    }

                    if($this.children('.depth').length) {
                        var $Depth = $this.children('.depth'),
                            DepthDisplay = $Depth.css('display'),
                            $item = $Depth.find('.depth_item:first'),
                            $childItem = $Depth.find('.depth2_item:first'),
                            $grandChildItem = $childItem.find('.depth3_item:first');
                        if(DepthDisplay!=='none'){//하위메뉴가 display:none이 아니면 실행
                            if(!IsActive){
                                $this.removeClass('active_prev active_next');
                                $this.addClass('active').siblings('.depth_item').removeClass('active active_prev active_next');
                                $this.prev('.depth_item').addClass('active_prev');
                                $this.next('.depth_item').addClass('active_next');

                                // 한번에 열리기
                                $item.removeClass('active_prev active_next');
                                $item.addClass('active').siblings('.depth_item').removeClass('active active_prev active_next');
                                $item.prev('.depth_item').addClass('active_prev');
                                $item.next('.depth_item').addClass('active_next');
                                // 3차 한번에 열리기
                                $childItem.removeClass('active_prev active_next');
                                $childItem.addClass('active').siblings('.depth_item').removeClass('active active_prev active_next');
                                $childItem.prev('.depth_item').addClass('active_prev');
                                $childItem.next('.depth_item').addClass('active_next');
                                // 3차 한번에 열리기
                                $grandChildItem.removeClass('active_prev active_next');
                                $grandChildItem.addClass('active').siblings('.depth_item').removeClass('active active_prev active_next');
                                $grandChildItem.prev('.depth_item').addClass('active_prev');
                                $grandChildItem.next('.depth_item').addClass('active_next');

                            } else{
                                $this.removeClass('active');
                                $this.siblings('.depth_item').removeClass('active_prev active_next');

                                // 3차까지 한번에 열리기
                                $item.removeClass('active');
                                $item.siblings('.depth_item').removeClass('active_prev active_next');
                                // 3차까지 한번에 열리기
                                $childItem.removeClass('active');
                                $childItem.siblings('.depth_item').removeClass('active_prev active_next');
                                // 3차까지 한번에 열리기
                                $grandChildItem.removeClass('active');
                                $grandChildItem.siblings('.depth_item').removeClass('active_prev active_next');
                            }
                            event.preventDefault();
                        }
                    }
                }
            }

            event.stopPropagation();
        }).each(function(index, element) {
            var $element = $(element);

            if($element.children('.depth').length) {
                $element.addClass('has');
            }else{
                $element.addClass('solo');
            }
        });

        $lnbMenu.on('mouseleave', function(event) {
            if(mode === 'pc') {
                $lnbMenu.height('').removeAttr('data-active');
                $html.removeClass('lnb_open');
                $lnbDepthItem.removeClass('active active_prev active_next');
            }
        });

        var $Depth1ItemLast = $lnb.find('.depth1_item:last-child'),
            Depth1ItemIsSolo = $Depth1ItemLast.is('.solo');
        if(Depth1ItemIsSolo){
            $Depth1ItemLast.find('>.depth_text').on('focusout', function(event) {
                if(mode === 'pc') {
                    $lnbMenu.height('').removeAttr('data-active');
                    $html.removeClass('lnb_open');
                    $lnbDepthItem.removeClass('active active_prev active_next');
                }
            });
        } else{
            var $Depth2ItemLast = $Depth1ItemLast.find('.depth2_item:last-child'),
                Depth2ItemIsSolo = $Depth2ItemLast.is('.solo');
            if(Depth2ItemIsSolo){
                $Depth2ItemLast.find('>.depth_text').on('focusout', function(event) {
                    if(mode === 'pc') {
                        $lnbMenu.height('').removeAttr('data-active');
                        $html.removeClass('lnb_open');
                        $lnbDepthItem.removeClass('active active_prev active_next');
                    }
                });
            } else{
                $lnb.find('.depth1_item:last-child .depth:visible:last').find('> .depth_list > .depth_item:last-child .depth_text').on('focusout', function(event) {
                    if(mode === 'pc') {
                        $lnbMenu.height('').removeAttr('data-active');
                        $html.removeClass('lnb_open');
                        $lnbDepthItem.removeClass('active active_prev active_next');
                    }
                });
            }
        }

		//사이트맵이동
		$('#header .header_login .login_wrap .sitemap a').on('click', function (event) {
			location.href = 'sub.do?key=3239';
			event.preventDefault();
		});

        /* 언어선택 */
        $('.lang_wrap .lang_btn').on('click', function () {
            var $this = $(this),
                $parent = $this.parent('.lang_wrap'),
                $list = $this.siblings('.lang_list');

            if($parent.hasClass('active')){
                $parent.removeClass('active');
                $this.attr('title','언어 선택 열림');
                $list.slideUp();
            }else{
                $parent.addClass('active');
                $this.attr('title','언어 선택 닫힘');
                $list.slideDown();
            }
        });

        /* 날씨팝업 */
        var $weather = $header.find('.weather_wrap'),
            $dustOpenBtn = $weather.find('.dust_btn'),
            $dustContent = $weather.find('.dust_info_box'),
            $dustCloseBtn = $dustContent.find('.dust_close');

        $dustOpenBtn.on('click', function (){
            var $this = $(this),
                $parent = $this.parent('.weather_wrap'),
                $dustBox = $this.siblings('.dust_info_box');

            if($parent.hasClass('active')){
                $parent.removeClass('active');
                $this.attr('title','미세먼지정보 열림');
                $dustBox.fadeOut();
            }else{
                $parent.addClass('active');
                $this.attr('title','미세먼지정보 닫힘');
                $dustBox.fadeIn();
            }
        });
        $dustCloseBtn.on('click', function (){
            var $this = $(this),
                $parentBox = $this.closest('.dust_info_box');

            $parentBox.css('display','none').fadeOut();
            $parentBox.parent('.weather_wrap').removeClass('active');
            $dustOpenBtn.attr('title','미세먼지정보 열기');
        });

        /* 팝업통합 */
        var $headerPop = $('[data-header-pop]'),
            $headerPanel = $headerPop.siblings('[data-header-panel]');

        $headerPop.on('click', function (){
            var $this = $(this),
                thisTitle = $this.attr('data-title'),
                thisPop = $this.attr('data-header-pop'),
                $thisPanel = $('[data-header-panel="' + thisPop + '"]');

            if($html.attr('data-open') === thisPop){
                $html.removeAttr('data-open');
                $this.attr('title',thisTitle + ' 열기');
                $thisPanel.attr('title',thisTitle + ' 닫힘');
                if(thisPop === 'detail'){
                    $thisPanel.slideUp();
                }
            } else {
                $headerPanel.each(function (){
                    var $this = $(this),
                        thisPop = $this.attr('data-header-panel'),
                        $thisPanel = $('[data-header-panel="' + thisPop + '"]');
                    if(thisPop === 'detail'){
                        $thisPanel.slideUp();
                    }
                });
                $html.attr('data-open',thisPop);
                $this.attr('title',thisTitle + ' 닫기');
                $thisPanel.attr('title',thisTitle + ' 열림');
                if(thisPop === 'detail'){
                    $thisPanel.slideDown();
                }
            }
        });

        $(document).on('click', '.header_search .detail_btn', function() {
            var $this = $(this),
                $header_search = $('.header_search'),
                $searchInputBox = $('.search_query');
            
            $searchInputBox.focus();
        });

        //상세검색
        var $detailBox = $wrapper.find('.detail_box'),
            $detailBtn = $wrapper.find('.detail_btn'),
            $detailClose = $detailBox.find('.detail_close');

        $detailClose.on('click',function (){
            $html.attr('data-open','');
            $detailBtn.attr('title','상세검색 열기');
        });
		//날짜 지정 - 월간,주간,일간
		function setDate(type) {
			var date = new Date();
			var endYear = date.getFullYear();
			var endMonth = date.getMonth()+1;
			var endDay = date.getDate();
			if(endMonth < 10){
				endMonth = '0'+endMonth;
			}
			if(endDay < 10){
				endDay = '0'+endDay;
			}
			var endDate = endYear+'-'+endMonth+'-'+endDay;
			
			if(type=='y'){
				date.setYear(parseInt(endYear)-1);
			}else if(type=='m'){
				date.setMonth(parseInt(endMonth)-2);
			}else if(type=='w'){
				date.setDate(parseInt(endDay)-7);
			}else if(type=='d'){
				date.setDate(parseInt(endDay)-1);
			}
			
			var startYear = date.getFullYear();
			var startMonth = date.getMonth()+1;
			var startDay = date.getDate();
			if(startMonth < 10){
				startMonth = '0'+startMonth;
			}
			if(startDay < 10){
				startDay = '0'+startDay;
			}
			
			var startDate = startYear+'-'+startMonth+'-'+startDay;
			$('.header_search .detail_box .detail_wrap .select_item .date .p-date .p-input[name="startDate"]').val(startDate);
			$('.header_search .detail_box .detail_wrap .select_item .date .p-date .p-input[name="endDate"]').val(endDate);
		};
		$('.header_search .detail_box .detail_wrap .select_item #s3').on('change',function (){
			var $this = $(this),
				$SelectedOption = $this.find('option:selected'),
				SelectedOptionVal = $SelectedOption.val();
			if(SelectedOptionVal!='all' && SelectedOptionVal!='custom'){
				setDate(SelectedOptionVal);
			} else{
				$('.header_search .detail_box .detail_wrap .select_item .date .p-date .p-input').val('');
			}
		});

        $window.on('screen:tablet screen:phone', function(event) {
            $('.search_btn').on('click', function (){
                $html.addClass('search_open');
            });
            $('.search_close .close_btn').on('click', function (){
                $html.removeClass('search_open');
            });
        });

        $window.on('screen:wide screen:web', function(event) {
            refreshLnbHeight();

            if($lnbSpy.length) {
                $html.removeClass('lnb_open');
                $lnbSpy.parents('.depth_item').removeClass('active');
                $lnbDepthItem.removeClass('active_prev active_next');
            }

        });

        $window.on('screen:tablet screen:phone', function(event) {
            refreshLnbHeight();

            if($lnbSpy.length) {
                $html.addClass('lnb_open');
                $lnbSpy.parents('.depth_item').addClass('active');
                $lnbSpy.parents('.depth_item').prev('.depth_item').addClass('active_prev');
                $lnbSpy.parents('.depth_item').next('.depth_item').addClass('active_next');
            }

        });

        $('.tab_menu').not($('.prettyprint').children()).each(function() {
            var li_length = $(this).children('ul').find('li').length;
            $(this).addClass('divide'+li_length);
        });


        // 주요사이트 family_box
        $('.family_btn').on('click', function () {
            var $this = $(this),
                $box = $this.siblings('.family_box');
            $box.addClass('active').attr('title', '주요사이트 열림');
        });
        $('.family_close').on('click', function () {
            var $this = $(this),
                $box = $this.closest('.family_box');

            $box.removeClass('active').attr('title', '주요사이트 닫힘');
        });

        $('.lnb .family_item .item_title').on('click', function () {
            var $this = $(this),
                $list = $this.siblings('.link_list'),
                $item = $this.parent('.family_item'),
                $otherItem = $item.siblings('.family_item');

            if($item.hasClass('active')){
                $this.attr('title', '열기');
                $item.removeClass('active');
                $list.attr('title', '닫힘');
            }else{
                $this.attr('title', '닫기');
                $item.addClass('active');
                $list.attr('title', '열림');
                $otherItem.removeClass('active').find('.item_title').attr('title', '열기').siblings('.link_list').attr('title', '닫힘');
            }
        });

        var $footer_slide_box = $('.footer_banner');
        $footer_slide_box.each(function (){

            var $this = $(this),
                $slide = $this.find('.banner_list');
            $slide.slick({
                slidesToScroll: 1,
                dots : false,
                autoplay:true,
                variableWidth: true,
                prevArrow : $('.footer_banner .slide_control .prev'),
                nextArrow : $('.footer_banner .slide_control .next'),

                //추가 기능
                autoArrow : $('.footer_banner .slide_control .auto'),
                pauseText : '정지',
                playText : '재생',
            });
        });

        /* 맨위로 */
        var $htmlBody = $('html, body'),
            $wrapper = $('#wrapper'),
            $footer = $wrapper.find('#footer'),
            $up = $footer.find('.up'),
            $upButton = $up.find('.up_button');

        $upButton.click(function (event) {
            var LinkAnchor = $(this).attr('href');
            event.preventDefault();
            $('html, body').animate({
                scrollTop: $('body').offset().top
            }, 400, function(){
                if(LinkAnchor){
                    location.href = LinkAnchor;
                }
            });
        });

        $window.scroll(function(){
            var scrollTop = $window.scrollTop();
            if(scrollTop > 1){
                $upButton.addClass('active');
            }else{
                $upButton.removeClass('active');
            }
        });

        //
        var $public_popup = $('.public_popup_zone');
        $public_popup.each(function(){
            var $this = $(this),
                $popup_slick = $this.find('.public_popup_list');
            $popup_slick.slick({
                //기본
                autoplay : true,
                dots : false,
                slidesToShow : 1,
                slidesToScroll: 1,
                prevArrow : $popup_slick.parent('.public_popup_zone').find('.public_popup_control .prev'),
                nextArrow : $popup_slick.parent('.public_popup_zone').find('.public_popup_control .next'),

                //추가 기능
                autoArrow : $popup_slick.parent('.public_popup_zone').find('.public_popup_control .auto'),
                pauseText : '정지',
                playText : '재생',
                total : $popup_slick.parent('.public_popup_zone').find('.public_popup_control .total'),
                current : $popup_slick.parent('.public_popup_zone').find('.public_popup_control .current'),
                customState : function(state) {
                    //현재 슬라이드 위치가 10보다 작을 때
                    if(state.current < 10) {
                        state.current = '0' + state.current;
                    }
                    //슬라이드 갯수가 10보다 작을 때
                    if(state.total < 10) {
                        state.total = '0' + state.total;
                    }

                    return state;
                }
            });
        });

		//맞춤서비스(모바일용)
		$('#header').after('<div class="service_curtain"></div><div class="service_layer"><button type="button" class="close">닫기</button></div>');
		$.ajax({
			url : '/common/deco/main_www_service.jsp',
			success : function (data) {
				$('.service_layer').prepend(data);
				var $CommonService = $('.service_layer'),
					$serviceTab = $CommonService.find('.service_tab'),
					$serviceItem = $serviceTab.find('.service_item');
				$serviceItem.each(function (){
					var $this = $(this),
						$slideList = $this.find('.slide_list'),
						$slidePrev = $this.find('.service_control .prev'),
						$slideNext = $this.find('.service_control .next');

					$slideList.slick({
						autoplay : false,
						dots:false,
						slidesToShow: 5,
						slidesToScroll: 1,
						infinite: false,
						arrows: true,
						prevArrow : $slidePrev,
						nextArrow : $slideNext,
						pauseOnDotsHover : true,
						swipe:false,
						draggable:false,
						responsive: [{
							breakpoint: 1501,
							settings: {
								slidesToShow: 3,
								swipe:true,
								draggable:true
							}
						},{
							breakpoint: 1201,
							settings: {
								slidesToShow: 2,
								swipe:true,
								draggable:true
							}
						},{
							breakpoint: 1001,
							settings: {
								slidesToShow: 5,
								swipe:true,
								draggable:true
							}
						},{
							breakpoint: 701,
							settings: {
								slidesToShow: 4,
								swipe:true,
								draggable:true
							}
						},{
							breakpoint: 551,
							settings: {
								slidesToShow: 3,
								swipe:true,
								draggable:true
							}
						},{
								breakpoint: 421,
								settings: {
									slidesToShow: 2,
									swipe:true,
									draggable:true
								}
							}
						]
					});
					var $slideItem = $serviceTab.find('.slick-slide'),
						$slideItemActive = $serviceTab.find('.slick-active'),
						ItemLength = $slideItem.length,
						ActiveItemLength = $slideItemActive.length;

					if(ItemLength > ActiveItemLength){
						$slideNext.addClass('on');
					} else {
						$slideNext.removeClass('on');
					}
				});
			}
		});
		$(document).on('click', '.service_layer .service_box .service_tab .service_item .service_btn', function() {
			var $parent = $(this).parent(),
				$tabContent = $parent.find('.service_panel'),
				$MySlide = $tabContent.find('.slide_list'),
				thisLength = $MySlide.find('.slick-slide').length;
			$(this).attr('title', '선택됨').closest('.service_item').addClass('active').siblings('.service_item').removeClass('active').find('.service_btn').removeAttr('title');
			$MySlide.slick('setPosition');
			if(thisLength < 6){
				$tabContent.addClass('disabled');
			}
		});
		$('#header .header_bottom .m_icon.m_service .bot_btn').on('click', function(){
			var $this = $(this),
				$service_layer = $('.service_layer');
			$html.addClass('service_open');
			$('.service_curtain').fadeIn();
			$service_layer.slideDown();
			$service_layer.find('.service_item.active .slide_list').slick('setPosition');
		});
		$(document).on('click', '.service_layer .close', function() {
			var $this = $(this),
				$Layer = $this.parent('.service_layer');
			$html.removeClass('service_open');
			$('.service_curtain').fadeOut();
			$Layer.slideUp();
		});
    });

    $document.on('ready', function(event) {
        /**
         * @link {https://github.com/JungHyunKwon/screen}
         */
        $screen({
            state : [{
                name : 'wide',
                horizontal : {
                    from : 9999,
                    to : 1201
                }
            }, {
                name : 'web',
                horizontal : {
                    from : 1200,
                    to : 1001
                }
            }, {
                name : 'tablet',
                horizontal : {
                    from : 1000,
                    to : 641
                }
            }, {
                name : 'phone',
                horizontal : {
                    from : 640,
                    to : 0
                }
            }]
        });
    });

    $window.on('load', function(event) {

        $window.on('screen:resize', function(event) {

        }).triggerHandler('screen:resize');
    });
})(jQuery);