var myApp = new Framework7();
var $$ = Dom7;
var mainView = myApp.addView('.view-main', {
    dynamicNavbar: true
});
/*----消息----*/
// 会话flag
var conversationStarted = false;
// 初始化消息框
var myMessages = myApp.messages('.messages', {
    autoLayout:true
});
// 初始化消息发送栏
var myMessagebar = myApp.messagebar('.messagebar');
// 消息处理
$$('.messagebar .link').on('click', function () {
    // Message text
    var messageText = myMessagebar.value().trim();
    // Exit if empy message
    if (messageText.length === 0) return;

    // Empty messagebar
    myMessagebar.clear()

    // 随机消息类型
    var messageType = (['sent', 'received'])[Math.round(Math.random())];

    // 接收的消息的头像和名称
    var avatar, name;
    if(messageType === 'received') {
        avatar = 'http://lorempixel.com/output/people-q-c-100-100-9.jpg';
        name = 'Kate';
    }
    // Add message
    myMessages.addMessage({
        // Message text
        text: messageText,
        // 随机消息类型
        type: messageType,
        // 头像和名称
        avatar: avatar,
        name: name,
        // 日期
        day: !conversationStarted ? 'Today' : false,
        time: !conversationStarted ? (new Date()).getHours() + ':' + (new Date()).getMinutes() : false
    })

    // 更新会话flag
    conversationStarted = true;
});
/*----消息----*/
//关闭侧栏
$$('.panel-close').on('click', function (e) {
    myApp.closePanel();
});
//义诊页面幻灯片
myApp.onPageInit('clinic', function (page) {
    $$(".toolbar").addClass("toolbar-hidden");
    var mySwiper = new Swiper('.swiper-container', {
        preloadImages: false,
        lazyLoading: true,
        pagination: '.swiper-pagination',
        paginationHide: false,
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        zoom: true,
    })
    $$(".navbar").addClass("bg-black");
    $$(".back" ).click(function(){
        $$(".navbar").removeClass("bg-black");
        $$(".toolbar").removeClass("toolbar-hidden");
    })
});
//评论页自适应高度
myApp.onPageAfterAnimation("detail", function (page) {
    $$("#iframepage").attr("height", $$("#tab2" ).height());
})
//首页幻灯片
var mySwiper1 = myApp.swiper('.swiper-1', {
    pagination:'.swiper-1 .swiper-pagination',
    spaceBetween: 50
});
//优惠活动无限滚动
myApp.onPageAfterAnimation("activity", function(page) {
    //如果列表内容没有占满屏幕，则隐藏加载图
    var loaddiv = $$(".is-hide").offset();
    if (loaddiv !== null) {
        if (loaddiv.top < $$("body").height()) {
            $$(".is-hide").css("display", "none");
        }
    }
    // 加载flag
    var loading = false;
    //初始页码
    var initPage = 1;
    // 注册'infinite'事件处理函数
    $$('.infinite-scroll').on('infinite', function () {
        // 如果正在加载，则退出
        if (loading) return;
        // 设置flag
        loading = true;
        // 1s后加载
        setTimeout(function () {
            // 重置加载flag
            loading = false;
            $$.get(page.url, {foo:'infinite',p:++initPage,type:'activity'}, function(data) {
                $$('.page-on-center .card-box').append(data);
                if (data.indexOf('<p style="text-align: center;margin:0;padding:1em 0;">已经加载完毕了!</p>') > 0) {
                    // 加载完毕，则注销无限加载事件，以防不必要的加载
                    myApp.detachInfiniteScroll($$('.infinite-scroll'));
                    // 删除加载提示符
                    $$('.infinite-scroll-preloader').remove();
                    return;
                }
            })
        }, 500);
    });
})
//普通文章无限滚动
myApp.onPageAfterAnimation("defaultlist", function(page) {
    //如果列表内容没有占满屏幕，则隐藏加载图
    var loaddiv = $$(".is-hide").offset();
    if (loaddiv !== null) {
        if (loaddiv.top < $$("body").height()) {
            $$(".is-hide").css("display", "none");
        }
    }
    // 加载flag
    var loading = false;
    //初始页码
    var initPage = 1;
    // 注册'infinite'事件处理函数
    $$('.infinite-scroll').on('infinite', function () {
        // 如果正在加载，则退出
        if (loading) return;
        // 设置flag
        loading = true;
        // 1s后加载
        setTimeout(function () {
            // 重置加载flag
            loading = false;
            $$.get(page.url, {foo:'infinite',p:++initPage,type:'defaultlist'}, function(data) {
                $$('.page-on-center .list-block ul').append(data);
                if (data.indexOf('<p style="text-align: center;margin:0;padding:1em 0;">已经加载完毕了!</p>') > 0) {
                    // 加载完毕，则注销无限加载事件，以防不必要的加载
                    myApp.detachInfiniteScroll($$('.infinite-scroll'));
                    // 删除加载提示符
                    $$('.infinite-scroll-preloader').remove();
                    return;
                }
            })
        }, 1000);
    });
})
//慈善义诊无限滚动
myApp.onPageAfterAnimation("clinic", function(page) {
    // 加载flag
    var loading = false;
    //初始页码
    var initPage = 1;
    // 注册'infinite'事件处理函数
    $$('.infinite-scroll').on('infinite', function () {
        // 如果正在加载，则退出
        if (loading) return;
        // 设置flag
        loading = true;
        // 1s后加载
        setTimeout(function () {
            // 重置加载flag
            loading = false;
            $$.get(page.url, {foo:'infinite',p:++initPage,type:'clinic'}, function(data) {
                 $$('.card-box').append(data);
                if (data.indexOf('<p style="text-align: center;margin:0;padding:1em 0;">已经加载完毕了!</p>') > 0) {
                    // 加载完毕，则注销无限加载事件，以防不必要的加载
                    myApp.detachInfiniteScroll($$('.infinite-scroll'));
                    // 删除加载提示符
                    $$('.infinite-scroll-preloader').remove();
                    return;
                }
            })
        }, 1000);
    });
})
var loaddiv = $$(".is-hide").offset();
if (loaddiv !== null) {
    if (loaddiv.top < $$("body").height()) {
        $$(".is-hide").css("display", "none");
    }
}