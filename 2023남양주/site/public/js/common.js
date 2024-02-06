// 탭메뉴 공통적으로 사용
function tabOn(tab, num, img) {
    var $tab, $tab_btn;
    var tabid = tab, n = num - 1, btn_img = img;

    $tab = $(tabid + '> ul > li');
    $tab_btn = $(tabid + '> ul > li > a');

    $tab_btn.siblings().hide();
    $tab.eq(n).addClass('active');
    $tab.eq(n).children('a').siblings().show();

    if (btn_img == 'img') {
        var btn = $tab.eq(n).children('a').find("img");
        btn.attr("src", btn.attr("src").replace("_off", "_on"));
    }

    $tab_btn.on("click", function (event) {
        var realTarget = $(this).attr('href');

        if (realTarget != "#") {
            return
        }
        if (btn_img == 'img') {
            for (var i = 0; i < $tab.size(); i++) {
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src", btn.attr("src").replace("_on", "_off"));
            }
            var active = $(this).parent().attr('class');
            if (active != 'active') {
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src = btn_img_off.src.replace('_off', '_on');
            }
        }
        $tab_btn.siblings().hide();
        $tab_btn.parent().removeClass('active');

        $(this).siblings().show();
        $(this).parent().addClass('active');

        event.preventDefault();
    });
}
function tabOrg(tabid, a, img) {
    var $tab, $tab_btn, $obj, $obj_view;
    var tabid = tabid, num = a, btn_img = img;

    $tab = $(tabid + ' .tab_item  > li');
    $tab_btn = $(tabid + ' .tab_item > li > a');
    $obj = $(tabid + ' .tab_obj');
    $obj_view = $(tabid + ' .tab_obj.n' + num);

    $tab.eq(num - 1).addClass('active');
    $obj_view.show();

    if (btn_img == 'img') {
        var btn = $tab.eq(num - 1).children('a').find("img");
        btn.attr("src", btn.attr("src").replace("_off", "_on"));
    }

    $tab.bind("click", function (event) {
        if (btn_img == 'img') {
            for (var i = 0; i < $tab.size(); i++) {
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src", btn.attr("src").replace("_on", "_off"));
            }
            var active = $(this).parent().attr('class');
            if (active != 'active') {
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src = btn_img_off.src.replace('_off', '_on');
            }
        }

        var this_eq = $tab.index($(this));
        $tab.removeClass('active');
        $tab.eq(this_eq).addClass('active');

        $obj.hide();
        $(tabid + ' .tab_obj.n' + (this_eq + 1)).show();

        event.preventDefault();
    });
}
$(document).ready(function () {
    //이미지 롤오버
    $('.overimg').mouseover(function () {
        var file = $(this).attr('src').split('/');
        var filename = file[file.length - 1];
        var path = '';
        for (i = 0; i < file.length - 1; i++) {
            path = (i == 0) ? path + file[i] : path + '/' + file[i];
        }
        $(this).attr('src', path + '/' + filename.replace('_off.', '_on.'));
    }).mouseout(function () {
        var file = $(this).attr('src').split('/');
        var filename = file[file.length - 1];
        var path = '';
        for (i = 0; i < file.length - 1; i++) {
            path = (i == 0) ? path + file[i] : path + '/' + file[i];
        }
        $(this).attr('src', path + '/' + filename.replace('_on.', '_off.'));
    });
});

// word 파라미터로 검색 함수 시작
function goSearch(word) {
    const sForm = document.createElement('form');
    sForm.name = 'sForm';
    sForm.method = 'post';
    sForm.action = '/search/search.jsp';

    const input1 = document.createElement('input');
    const input2 = document.createElement('input');

    input1.setAttribute('type', 'hidden');
    input1.setAttribute('name', 'collection');
    input1.setAttribute('value', 'ALL');

    input2.setAttribute('type', 'hidden');
    input2.setAttribute('name', 'query');
    input2.setAttribute('value', word);

    sForm.appendChild(input1);
    sForm.appendChild(input2);

    document.body.appendChild(sForm);
    sForm.submit();
}
// word 파라미터로 검색 함수 끝

(function ($) {
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
    if (_browser.indexOf('msie 7.0') > -1) {
        _browser = 'ie ie7';
        //ie8일 때
    } else if (_browser.indexOf('msie 8.0') > -1) {
        _browser = 'ie ie8';
        //ie9일 때
    } else if (_browser.indexOf('msie 9.0') > -1) {
        _browser = 'ie ie9';
        //ie10일 때
    } else if (_browser.indexOf('msie 10.0') > -1) {
        _browser = 'ie ie10';
        //ie11일 때
    } else if (_browser.indexOf('trident/7.0') > -1) {
        _browser = 'ie ie11';
        //edge일 때
    } else if (_browser.indexOf('edge') > -1) {
        _browser = 'edge MS';
    } else if (_browser.indexOf('edg/') > -1) {
        _browser = 'edge chromium_based';
        //opera일 때
    } else if (_browser.indexOf('opr') > -1) {
        _browser = 'opera';
        //chrome일 때
    } else if (_browser.indexOf('chrome') > -1) {
        _browser = 'chrome';
        //firefox일 때
    } else if (_browser.indexOf('firefox') > -1) {
        _browser = 'firefox';
        //safari일 때
    } else if (_browser.indexOf('safari') > -1) {
        _browser = 'safari';
    } else {
        _browser = 'unknown';
    }
    window.getBrowser = function () {
        return _browser;
    };

    //브라우저 클래스 추가
    $html.addClass(_browser);

    $(function () {
        var $body = $('body'),
            $htmlAndBody = $html.add($body),
            $wrapper = $('#wrapper'),
            $header = $('#header'),
            $container = $('#container'),
            $footer = $('#footer');

        $window.on('screen:wide screen:web', function (event) {
            window.mode = 'pc';
        });
        $window.on('screen:tablet screen:phone', function (event) {
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
        if (!$lnb.find('.depth2').length) {
            $header.attr('data-depth', 'none');
        }
        $lnbSpy.parents('.depth_item').addClass('actived');
        $lnbSpy.parents('.depth_item').prev('.depth_item').addClass('actived_prev');
        $lnbSpy.parents('.depth_item').next('.depth_item').addClass('actived_next');

        function refreshLnbHeight() {
            lnbHeight = $lnbMenu.css('transition-property', 'none').outerHeight() || '';
            $lnbMenu.css('transition-property', '');
        }

        $lnbShowBtn.on('click', function (event) {
            //클래스 토글
            $html.toggleClass('lnb_show');
        });
        $lnbHideBtn.on('click', function (event) {
            //클래스 토글
            $html.removeClass('lnb_show');
        });
        $('.lnb_curtain button').on('click', function (event) {
            $html.removeClass('lnb_show');
        });

        $lnbDepthItem.on('mouseover focusin', function (event) {
            if (mode === 'pc') {
                var $this = $(this),
                    $depth1Item = ($this.hasClass('depth1_item')) ? $this : $this.parents('.depth1_item');
                if (!$header.is('[data-depth="none"]')) {
                    if ($lnbMenu.hasClass('pulldown')) {
                        var maxHeight = 0;

                        $lnbDepth2FirstChild.each(function (index, element) {
                            var $element = $(element),
                                outerHeight = $element.outerHeight() || 0;

                            //기존 값 보다 얻은 값이 초과일 때
                            if (outerHeight > maxHeight) {
                                maxHeight = outerHeight;
                            }
                        });

                        $lnbMenu.height(lnbHeight + maxHeight);
                    } else if ($lnbMenu.hasClass('eachdown')) {
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
        }).on('click', function (event) {
            if (mode === 'mobile') {
                var $this = $(this),
                    $depthText = $this.children('.depth_text'),
                    eventTarget = event.target,
                    IsActive = $this.is('.active');

                if ($depthText.find(eventTarget).length || $depthText[0] === eventTarget) {
                    if ($this.hasClass('depth1_item')) {
                        if ($this.hasClass('active')) {
                            $html.removeClass('lnb_open');
                        } else {
                            $html.addClass('lnb_open');
                        }
                    }

                    if ($this.children('.depth').length) {
                        var $Depth = $this.children('.depth'),
                            DepthDisplay = $Depth.css('display');
                        if (DepthDisplay !== 'none') {//하위메뉴가 display:none이 아니면 실행
                            if (!IsActive) {
                                $this.removeClass('active_prev active_next');
                                $this.addClass('active').siblings('.depth_item').removeClass('active active_prev active_next');
                                $this.prev('.depth_item').addClass('active_prev');
                                $this.next('.depth_item').addClass('active_next');
                            } else {
                                $this.removeClass('active');
                                $this.siblings('.depth_item').removeClass('active_prev active_next');
                            }
                            event.preventDefault();
                        }
                    }
                }
            }
            event.stopPropagation();
        }).each(function (index, element) {
            var $element = $(element);
            if ($element.children('.depth').length) {
                $element.addClass('has');
            } else {
                $element.addClass('solo');
            }
        });

        $lnbMenu.on('mouseleave', function (event) {
            if (mode === 'pc') {
                $lnbMenu.height('');
                $html.removeClass('lnb_open');
                $lnbDepthItem.removeClass('active active_prev active_next');
            }
        });
        $lnb.find('.depth1_item:last-child .depth:last-child:visible').find('> .depth_list > .depth_item:last-child .depth_text').on('focusout', function (event) {
            if (mode === 'pc') {
                $lnbMenu.height('');
                $html.removeClass('lnb_open');
                $lnbDepthItem.removeClass('active active_prev active_next');
            }
        });

        //여기서부터 코드 작성해주세요

        setTimeout(function(){
            $body.addClass('start_ani');
        }, 1);

        //상단 언어 레이어 창 시작
        $('.etc_choice .etc_choice_list .etc_choice_item.language button.etc_choice_link').on('click', function(){
            var $this = $(this),
                $LangLayer = $this.siblings('.lang_layer'),
                $Language = $this.parent('.language'),
                IsActive = $Language.is('.active');
            if(!IsActive){
                $Language.addClass('active');
                $LangLayer.slideDown(200);
                $this.attr('title', '언어별 사이트 바로가기 리스트 닫기');
            }
            else{
                $Language.removeClass('active');
                $LangLayer.slideUp(200);
                $this.attr('title', '언어별 사이트 바로가기 리스트 열기');
            }
        });
        //상단 언어 레이어 창 끝

        //모바일 상단 검색창 열기, 닫기 시작
        $(document).on('click', '.header_box .search_show button.m_btn', function(){
            var $this = $(this),
                $HeaderBox = $this.parents('.header_box'),
                IsSearchOpen = $HeaderBox.is('.search_open');
            if(!IsSearchOpen){
                $HeaderBox.addClass('search_open');
            }
        });
        $(document).on('click', '.header_box .m_search button.m_search_close', function(){
            var $this = $(this),
                $HeaderBox = $this.parents('.header_box'),
                IsSearchOpen = $HeaderBox.is('.search_open');
            if(IsSearchOpen){
                $HeaderBox.removeClass('search_open');
            }
        });
        //모바일 상단 검색창 열기, 닫기 끝

        //모바일 상단 언어 레이어 창 시작
        $(document).on('click', '.lnb .lnb_topbox .m_site .etc_site .etc_site_list .language button.etc_site_link', function(){
            var $this = $(this),
                $LangLayer = $this.siblings('.lang_layer'),
                $Language = $this.parent('.language'),
                IsActive = $Language.is('.active');
            if(!IsActive){
                $Language.addClass('active');
                $LangLayer.slideDown(200);
                $this.attr('title', '언어별 사이트 바로가기 리스트 닫기');
            }
            else{
                $Language.removeClass('active');
                $LangLayer.slideUp(200);
                $this.attr('title', '언어별 사이트 바로가기 리스트 열기');
            }
        });
        //모바일 상단 언어 레이어 창 끝


        //푸터 상단 바로가기 시작
        $('.footer_go .go_btn').on('click', function() {
            $('html, body').animate({
                scrollTop : $body.offset().top
            }, 400);
        });
        //푸터 상단 바로가기 끝

        //모바일 전용 상단 바로가기 스크롤시 표출 시작
        var $mobildeWrapper = $('#wrapper');
        $mobildeWrapper.append('<div class="m_footer_go"><button type="button" class="go_btn">맨위로</button></div>');
        var $mobileFooterGoBtn = $mobildeWrapper.find('.m_footer_go');
        function mobileFooterGo() {
            if($window.scrollTop() > 96) {
                $mobileFooterGoBtn.addClass('active');
            }
            else{
                $mobileFooterGoBtn.removeClass('active');
            }
        }
        $window.scroll(function(){
            mobileFooterGo();
        });
        mobileFooterGo();
        $(document).on('click', '.m_footer_go button.go_btn', function(){
            $('html, body').animate({
                scrollTop : $body.offset().top
            }, 400);
        });
        //모바일 전용 상단 바로가기 스크롤시 표출 끝

        //푸터 레이어 열기 시작
        var $FooterQuickItem = $('.footer_quick .quick_list .quick_item');
        $FooterQuickItem.each(function(){
            var $this = $(this),
                $QuickOpenBtn = $this.find('button.quick_open_btn');
            $QuickOpenBtn.on('click', function(){
                var $MyBtn = $(this),
                    $MyItem = $MyBtn.parent('.quick_item'),
                    IsActive = $MyItem.is('.active'),
                    $MyLayer = $MyBtn.siblings('.quick_layer');
                if(!IsActive){
                    $MyItem.addClass('active');
                    $MyBtn.attr('title', '하위 리스트 닫기');
                    $MyLayer.slideDown(200);
                }
                else{
                    $MyItem.removeClass('active');
                    $MyBtn.attr('title', '하위 리스트 열기');
                    $MyLayer.slideUp(200);
                }
            });
        });
        //푸터 레이어 열기 끝

        $window.on('screen:wide screen:web', function (event) {
            refreshLnbHeight();
            if ($lnbSpy.length) {
                $html.removeClass('lnb_open');
                $lnbSpy.parents('.depth_item').removeClass('active');
                $lnbDepthItem.removeClass('active_prev active_next');
            }
        });
        $window.on('screen:tablet screen:phone', function (event) {
            refreshLnbHeight();
            if ($lnbSpy.length) {
                $html.addClass('lnb_open');
                $lnbSpy.parents('.depth_item').addClass('active');
                $lnbSpy.parents('.depth_item').prev('.depth_item').addClass('active_prev');
                $lnbSpy.parents('.depth_item').next('.depth_item').addClass('active_next');
            }
        });
    });

    $document.on('ready', function (event) {
        //wrapper, wrap 사이즈에 따라 값 맞출 것
        $screen({
            state: [{
                name: 'wide',
                horizontal: {
                    from: 9999,
                    to: 1461
                }
            }, {
                name: 'web',
                horizontal: {
                    from: 1460,
                    to: 1001
                }
            }, {
                name: 'tablet',
                horizontal: {
                    from: 1000,
                    to: 641
                }
            }, {
                name: 'phone',
                horizontal: {
                    from: 640,
                    to: 0
                }
            }]
        });
    });

    $window.on('load', function (event) {
        $window.on('screen:resize', function (event) {

        }).triggerHandler('screen:resize');
    });
})(jQuery);