<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <title>话题动态 - 知乎</title>
    <link rel="stylesheet" href="${ctx}/assets/css/z1.css">
</head>

<body class="zhi js-topic-feed-page topic-feed-page">

<div role="navigation" class="zu-top" data-za-module="TopNavBar">
    <div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
        <a href="${ctx}/" class="zu-top-link-logo" id="zh-top-link-logo" data-za-c="view_home"
           data-za-a="visit_home" data-za-l="top_navigation_zhihu_logo">知乎</a>

        <div class="top-nav-profile">
            <a href="${ctx}/people/guo-xiao-hu-47" class="zu-top-nav-userinfo " id=":0" role="button"
               aria-haspopup="true" aria-activedescendant="">
                <span class="name">郭小虎</span>
                <img class="Avatar" src="https://pic3.zhimg.com/5e9fbaf3314270ae46eea42f99577e3e_s.jpg"
                     srcset="https://pic3.zhimg.com/5e9fbaf3314270ae46eea42f99577e3e_xs.jpg 2x" alt="郭小虎">
                <span id="zh-top-nav-new-pm" class="zg-noti-number zu-top-nav-pm-count" style="visibility:hidden"
                      data-count="0">

</span>
            </a>
            <ul class="top-nav-dropdown" id="top-nav-profile-dropdown" aria-labelledby=":0">
                <li>
                    <a href="${ctx}/people/guo-xiao-hu-47" tabindex="-1" id=":1">
                        <i class="zg-icon zg-icon-dd-home"></i>我的主页
                    </a>
                </li>

                <li>
                    <a href="${ctx}/inbox" tabindex="-1" id=":2">
                        <i class="zg-icon zg-icon-dd-pm"></i>私信
                        <span id="zh-top-nav-pm-count" class="zu-top-nav-pm-count zg-noti-number"
                              style="visibility:hidden" data-count="0">

</span>
                    </a>
                </li>
                <li>
                    <a href="${ctx}/settings" tabindex="-1" id=":3">
                        <i class="zg-icon zg-icon-dd-settings"></i>设置
                    </a>
                </li>
                <li>
                    <a href="${ctx}/logout" tabindex="-1" id=":4">
                        <i class="zg-icon zg-icon-dd-logout"></i>退出
                    </a>
                </li>
            </ul>

        </div>


        <button class="zu-top-add-question" id="zu-top-add-question">提问</button>


        <div role="search" id="zh-top-search" class="zu-top-search">
            <form method="GET" action="${ctx}/search" id="zh-top-search-form" class="zu-top-search-form">


                <input type="hidden" name="type" value="content">
                <label for="q" class="hide-text">知乎搜索</label><input type="text" class="zu-top-search-input" id="q"
                                                                    name="q" autocomplete="off" value="" maxlength="100"
                                                                    placeholder="搜索你感兴趣的内容..." role="combobox"
                                                                    aria-autocomplete="list">
                <button type="submit" class="zu-top-search-button"><span class="hide-text">搜索</span><span
                        class="sprite-global-icon-magnifier-dark"></span></button>
            </form>
        </div>


        <div id="zg-top-nav" class="zu-top-nav">
            <ul class="zu-top-nav-ul zg-clear">

                <li class="zu-top-nav-li " id="zh-top-nav-home">
                    <a class="zu-top-nav-link" href="${ctx}/" id="zh-top-link-home" data-za-c="view_home"
                       data-za-a="visit_home" data-za-l="top_navigation_home">首页</a>
                </li>


                <li class="top-nav-topic-selector zu-top-nav-li current" id="zh-top-nav-topic">
                    <a class="zu-top-nav-link" href="./话题动态 - 知乎_files/话题动态 - 知乎.html" id="top-nav-dd-topic">话题</a>
                </li>

                <li class="zu-top-nav-li " id="zh-top-nav-explore">
                    <a class="zu-top-nav-link" href="${ctx}/explore">发现</a>
                </li>

                <li class="top-nav-noti zu-top-nav-li ">
                    <a class="zu-top-nav-link" href="javascript:;" id="zh-top-nav-count-wrap" role="button"><span
                            class="mobi-arrow"></span>消息<span id="zh-top-nav-count"
                                                              class="zu-top-nav-count zg-noti-number"
                                                              style="display: none;">0</span></a>
                </li>


            </ul>
            <div class="zu-top-nav-live zu-noti7-popup zg-r5px no-hovercard" id="zh-top-nav-live-new" role="popup"
                 tabindex="0">
                <div class="zu-top-nav-live-inner zg-r5px">
                    <div class="zu-top-live-icon">&nbsp;</div>
                    <div class="zu-home-noti-inner" id="zh-top-nav-live-new-inner">
                        <div class="zm-noti7-popup-tab-container clearfix" tabindex="0" role="tablist">
                            <button class="zm-noti7-popup-tab-item message" role="tab">
                                <span class="icon">消息</span>
                            </button>
                            <button class="zm-noti7-popup-tab-item user" role="tab">
                                <span class="icon">用户</span>
                            </button>
                            <button class="zm-noti7-popup-tab-item thanks" role="tab">
                                <span class="icon">赞同和感谢</span>
                            </button>
                        </div>
                    </div>
                    <div class="zm-noti7-frame-border top"></div>
                    <div class="zm-noti7-frame">
                        <div class="zm-noti7-content message zh-scroller" style="position: relative; overflow: hidden;">
                            <div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;">
                                <div class="zh-scroller-content"
                                     style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                                    <div class="zm-noti7-content-inner">
                                        <div class="zm-noti7-content-body">
                                            <div class="zm-noti7-popup-loading">
                                                <span class="noti-spinner-loading"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="zh-scroller-bar-container"
                                 style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
                                <div style="-webkit-user-select: none;"></div>
                            </div>
                            <div class="zh-scroller-bar"
                                 style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
                        </div>
                        <div class="zm-noti7-content user zh-scroller"
                             style="display: none; position: relative; overflow: hidden;">
                            <div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;">
                                <div class="zh-scroller-content"
                                     style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                                    <div class="zm-noti7-content-inner">
                                        <div class="zm-noti7-content-body">
                                            <div class="zm-noti7-popup-loading">
                                                <span class="noti-spinner-loading"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="zh-scroller-bar-container"
                                 style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
                                <div style="-webkit-user-select: none;"></div>
                            </div>
                            <div class="zh-scroller-bar"
                                 style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
                        </div>
                        <div class="zm-noti7-content thanks zh-scroller"
                             style="display: none; position: relative; overflow: hidden;">
                            <div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;">
                                <div class="zh-scroller-content"
                                     style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                                    <div class="zm-noti7-content-inner">
                                        <div class="zm-noti7-content-body">
                                            <div class="zm-noti7-popup-loading">
                                                <span class="noti-spinner-loading"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="zh-scroller-bar-container"
                                 style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
                                <div style="-webkit-user-select: none;"></div>
                            </div>
                            <div class="zh-scroller-bar"
                                 style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
                        </div>
                    </div>
                    <div class="zm-noti7-frame-border bottom"></div>
                    <div class="zm-noti7-popup-footer">
                        <a href="${ctx}/notifications" class="zm-noti7-popup-footer-all zg-right">查看全部
                            »</a>
                        <a href="${ctx}/settings/notification" class="zm-noti7-popup-footer-set"
                           title="通知设置"><i class="zg-icon zg-icon-settings"></i></a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<div class="zg-wrap zu-main clearfix " role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">

            <div class="topic-feed-title">
                <i class="zg-icon zg-icon-feedlist"></i>
                <span>已关注的话题动态</span>
                <a target="_blank" href="${ctx}/people/guo-xiao-hu-47/topics"
                   class="zg-link-gray zg-right">
                    共关注 <span class="follow-topics-count">1</span> 个话题
                </a>
            </div>

            <ul class="zm-topic-cat-main js-topic-cat-main clearfix">

                <li class="zm-topic-cat-item current" data-id="162745" data-href="/topic/20031686"><a
                        href="${ctx}/topic#2015 年盘点">2015 年盘点</a></li>

            </ul>
            <div class="topic-title clearfix js-topic-title" style="display: block;">

                <a href="${ctx}/topic/20031686" target="_blank" class="zg-left js-topic-title-avatar">
                    <img class="Avatar Avatar--m js-topic-avatar"
                         src="https://pic3.zhimg.com/1720d08cb8e682f0d5219efa4453c4a2_m.png" alt="2015 年盘点">
                </a>
                <a href="${ctx}/topic/20031686" target="_blank"
                   class="zg-left topic-title-name js-topic-title-name">
                    2015 年盘点
                </a>
                <div class="feed-switcher js-feed-switcher">
                    <a href="javascript:;" class="current" data-feed-type="smart_feed">热门排序</a>
                    | <a href="javascript:;" data-feed-type="timeline_feed">时间排序</a>
                </div>

            </div>
            <div class="zm-topic-list-container">
                <div class="zu-top-feed-list" id="zh-topic-feed-list">
                    <div class="zh-general-list clearfix" style="display: block;">
                        <div class="feed-item feed-item-hook question-item" itemprop="question" itemscope=""
                             itemtype="http://schema.org/Question" data-score="3500.77126476" data-type="Question"
                             data-za-module="QuestionItem">
                            <link itemprop="url" href="${ctx}/question/37010129">
                            <meta itemprop="answerCount" content="105">
                            <meta itemprop="isTopQuestion" content="false">

                            <h2 class="question-item-title">

                                <a target="_blank" class="question_link" href="${ctx}/question/37010129">2015
                                    年有哪些快速衰落的公司？有哪些快速崛起的公司？</a>
                            </h2>

                            <div class="question-item-meta">
                                <a class="zg-link-gray-normal meta-item" target="_blank"
                                   href="${ctx}/question/37010129">105 个回答</a>
                                <span class="zg-bull">•</span>
                                <a class="zg-link-gray-normal meta-item"
                                   href="${ctx}/question/37010129/followers">11K 人关注</a>
                                <span class="zg-bull zu-autohide">•</span>

                                <a data-follow="q:link" class="follow-link zg-follow meta-item zu-autohide"
                                   href="javascript:;" id="sfb-7011032">关注问题</a>

                                <span class="zg-bull zu-autohide">•</span>

                                <a href="${ctx}/topic#"
                                   class="js-questionUnhelpful meta-item zu-autohide" data-qid="7011032">没有帮助</a>

                            </div>

                        </div>
                        <div class="feed-item feed-item-hook  folding" itemprop="question" itemscope=""
                             itemtype="http://schema.org/Question" data-score="3500.69067974" data-type="Answer"
                             data-za-module="AnswerItem">
                            <link itemprop="url" href="${ctx}/question/37624440/answer/72870384">
                            <meta itemprop="answer-id" content="24570607">
                            <meta itemprop="answer-url-token" content="72870384">
                            <meta itemprop="answerCount" content="194">
                            <meta itemprop="isTopQuestion" content="false">
                            <div class="feed-main">
                                <div class="feed-content">
                                    <h2><a class="question_link" href="${ctx}/question/37624440"
                                           target="_blank" data-id="7256992" data-za-element-name="Title">
                                        2015 年国内外有什么让你眼前一亮的 App？
                                    </a></h2>
                                    <div class="expandable entry-body">
                                        <link itemprop="url"
                                              href="${ctx}/question/37624440/answer/72870384">
                                        <!-- <meta itemprop="answer-id" content="24570607">
                                        <meta itemprop="answer-url-token" content="72870384"> -->

                                        <div class="zm-item-vote">
                                            <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                               data-bind-votecount="">1797</a>
                                        </div>

                                        <div class="zm-votebar" data-za-module="VoteBar">
                                            <button class="up" aria-pressed="false" title="赞同">
                                                <i class="icon vote-arrow"></i>
                                                <span class="count">1797</span>
                                                <span class="label sr-only">赞同</span>
                                            </button>
                                            <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                                <i class="icon vote-arrow"></i>
                                                <span class="label sr-only">反对，不会显示你的姓名</span>
                                            </button>
                                        </div>


                                        <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$mingkyle420" target="_blank" href="${ctx}/people/mingkyle420">赵明亿</a></span><span
        title="前 36 氪作者，現網易策劃，關注互聯網新產品" class="bio">
前 36 氪作者，現網易策劃，關注互聯網新…
</span>
</span>
                                        </div>

                                        <div class="zm-item-vote-info" data-votecount="1797" data-async-voters="1"
                                             data-za-module="VoteInfo">


                                            <span class="voters text"><a href="${ctx}/topic#"
                                                                         class="more text"><span class="js-voteCount">1797</span>&nbsp;人赞同</a></span>


                                        </div>
                                        <div class="zm-item-rich-text expandable js-collapse-body"
                                             data-resourceid="7256992" data-action="/answer/content"
                                             data-author-name="赵明亿" data-entry-url="/question/37624440/answer/72870384">

                                            <textarea hidden="" class="content">&lt;img src="https://pic4.zhimg.com/19a30ab1d73cc7fc212de1fa84bae45b_b.png" data-rawwidth="1920" data-rawheight="1080" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic4.zhimg.com/19a30ab1d73cc7fc212de1fa84bae45b_r.png"&gt;&lt;p&gt;这是一个好问题， 2015 年这一年，我开始不停地写各种各样的 app 文章、报道与测评，这一年也快过完了，是时候想想今年有哪些让我眼前一亮的 app 了。&lt;/p&gt;&lt;br&gt;&lt;p&gt;在这之前，可以先回顾一下 2014 年，去年底，没毕业的我还在为 AppSolution 撰稿（ifanr 旗下的应用推荐媒体），大概是圣诞节的时候，我们一起为去年国内外的 app 精选了一些榜单：&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/aecccf7323cfd8583fda1892f4ef67c6_b.jpg" data-rawwidth="1095" data-rawheight="998" class="origin_image zh-lightbox-thumb" width="1095" data-original="https://pic3.zhimg.com/aecccf7323cfd8583fda1892f4ef67c6_r.jpg"&gt;&lt;i&gt;此图为国外 iOS 独占 app 榜单，图片过长，为了不影响阅读体验，稍作了调整。#全部榜单在 AppSolution 微信订阅号里搜索关键词「2014」可以查看到。&lt;br&gt;&lt;/i&gt;&lt;br&gt;&lt;p&gt;当时我们在挑选这个榜单的时候，具有「前瞻性」与「新形态」也是其中的标准之一。回过头来再看，回过头来再看，这个榜单上最让我觉得「眼前一亮」的是 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/2552" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Paper&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;、&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1635" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Ping&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 与 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1991" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Dispatch&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，他们都曾在去年引起了不少讨论。其中 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1635" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Ping&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的理念与形态，在今年被国内的「&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18367" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;即刻&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;」成功复制，甚至做得更好，周围也有不少朋友认为「&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18367" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;即刻&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;」是今年让他们眼前一亮的产品。。&lt;/p&gt;&lt;br&gt;&lt;p&gt;接下来说说 2015 年出现的新 app。让人眼前一亮，可以说一定程度上与每年系统更新的新特性有关，比如 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1892" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Clips&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 利用了通知中心可显示第三方应用程序附带的 Widget（小插件），&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/3386" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Sunrise&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 甚至直接把日历集成在第三方键盘中，这些都是 iOS 8 带来的新特性。&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic1.zhimg.com/fee0c21ca070b1bbfbd3cb60fd6b3604_b.jpg" data-rawwidth="1280" data-rawheight="753" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/fee0c21ca070b1bbfbd3cb60fd6b3604_r.jpg"&gt;&lt;p&gt;&lt;em&gt;我的 iPhone 主屏，这样看起来有点可怕… 后面还有一页更可怕的...&lt;/em&gt;&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/0a63b92d7ca5004b98da89b248de3d27_b.png" data-rawwidth="1000" data-rawheight="750" class="origin_image zh-lightbox-thumb" width="1000" data-original="https://pic4.zhimg.com/0a63b92d7ca5004b98da89b248de3d27_r.png"&gt;&lt;p&gt;而 iOS 9 又有什么独特的新特性呢，除了字体上的变化、对于内置 app 与基础功能的一系列升级之外，留给第三方的可能就只有 Split View 了，至于 硬件上的变化 —— 3D Touch 与 iPad Pro，可能等到明年才会优秀的开发者在这两点上发力。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;于是，我大概罗列了 20 个让我觉得眼前一亮，而且印象深刻的 app，也算是对于&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/collections/518" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;我眼中 2015 年 iOS 软件生态圈趋势的一点总结&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18656" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Paper 3.0&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：排名没有先后之分，至于为什么要先说 Paper，大概是因为 9 月份 Georg Petschnigg 来北京开发布会的时候，给我留下了深刻印象。在 Paper 3.0 之前，我们通常认为它是用来画画的，或施展艺术工作者的创意。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18656" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Paper&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 3.0 今年最重大的更新就是推出了 iPhone 版本，也让我对它有了全新的认识。Paper for iPhone 重新设计了界面，定义了一系列基础操作，现在用它可以做笔记、列清单，给照片和截图添加标记，绘制简单的图表或脑图。听上去似乎不再是原来的那个 Paper，但却成为了真正意义上的「Paper」。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/844e4f3d16bbad68e947ced62cb848f1_b.jpg" data-rawwidth="1280" data-rawheight="1132" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic2.zhimg.com/844e4f3d16bbad68e947ced62cb848f1_r.jpg"&gt;&lt;p&gt;还记得当时 Georg 讲了很多它为什么要做出这些功能，他是一个非常具有工匠精神的人。&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18656" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Paper&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的这些新功能也具有前瞻性，将创作与效率真正结合在一起，当然放在 iPad Pro 上也会变得非常有意思。&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/13781" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Spark&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：要在今年评一款最佳邮箱应用，Spark 的支持率一定不少，成熟、友好与设计优秀，几乎满足了我心中对于一款邮箱客户端的所有要求。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;简单的说几个点，除了邮件回撤机制、深度集成日历、完整的签名系统以及第三方服务之外，Spark 结合了类似 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/2359" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Inbox&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的邮件智能归类功能，继承了 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/16924" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Mailbox&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的滑动手势，还可以看到源自 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1703" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Path&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的经典弧形菜单，有趣的是，Spark 甚至还引用了 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/2557" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Gmail&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 网页版里将草稿暂时缩放于界面底部的设计。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/be2acecf9bba613a8127779e7b3d5d9e_b.png" data-rawwidth="1514" data-rawheight="1334" class="origin_image zh-lightbox-thumb" width="1514" data-original="https://pic3.zhimg.com/be2acecf9bba613a8127779e7b3d5d9e_r.png"&gt;&lt;p&gt;可以说 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/13781" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Spark&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 几乎是集百家所长，将其深度融合，带给重度邮件用户无尽的快感，Readdle 也在&lt;a href="//link.zhihu.com/?target=https%3A//twitter.com/SparkMailApp/status/675034328322154497" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;近期表示&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;开始了 iPad 与 Mac 版本的测试，很快就能覆盖三个平台上的用户。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/527866" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;[评测] 手机 Email 叕被改造了，这次挺靠谱 – Spark&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/441" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Telegram&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：微信、Whatsapp，或是Messenger，他们都是先行者，而 Telegram 则是后来者。还记得 Telegram 那天正好是微信在朋友圈投放了第一条广告，而 Telegram 则主打安全与纯净。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;Telegram 来自俄罗斯最大的社交网络服务 VKontakte 创始者 Pavel Durov 的非盈利项目，客户端基于 FOSS（自由及开放源代码软件），这也是它在日后越来越与传统 IM app 不一样的出发点&lt;br&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/1bd4a87082adf915fe67c9a7bf9bdecb_b.png" data-rawwidth="1508" data-rawheight="1334" class="origin_image zh-lightbox-thumb" width="1508" data-original="https://pic4.zhimg.com/1bd4a87082adf915fe67c9a7bf9bdecb_r.png"&gt;&lt;p&gt;除了聊天体验极佳 —— 私密聊天模式、超过 1000 人的群组以及公告板等设定，Telegram 还延展出很多有意思的功能，例如最近推出的类似订阅 RSS 的 Channel、聊天功能中的针对性回复引用、第三方服务接口等，让它与传统 IM 软件相比更加的开放，不过可以看到最近各家也在朝着开放与平台化的方向发展。&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/485421" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;微信之外最优选！纯净安全的聊天工具 – Telegram&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/342" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Due 2&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：同样是在今年进行了重大更新的 Due 2，它让「提醒」的效率再次获得了巨大的提升，简单得来说，就是一个字 ——「非常快」。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/9fae9bc4219364a26cef0b44aeb71355_b.jpg" data-rawwidth="967" data-rawheight="572" class="origin_image zh-lightbox-thumb" width="967" data-original="https://pic2.zhimg.com/9fae9bc4219364a26cef0b44aeb71355_r.jpg"&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/342" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Due&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 在设计之初就考虑了 URL Scheme 以及 x-callback-url 在处理任务上的支持，开发者在一年多之后更新的 2.0 版本，让这个强大的效率工具变得更「亲民」，这是一个好的方向，我们也可以看到这一年中越来越多的效率工具变得愈加完美。&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/342" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Due&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 适合一切繁杂琐事，通过全新的滑动手势、自然语义输入、可定制化功能来完成所有提醒操作，大大减少时间上的成本。2.0 版本中也加入了后台同步功能，使其在多设备中可以无缝使用，这对于一个处理任务的工具来说很重要。&lt;/p&gt;&lt;br&gt;&lt;p&gt;所以说 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/342" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Due&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 是将 Reminder 做到极致的应用也不为过，它几乎是我离不开的一个工具。&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/8033" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Hydra&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：iOS 上有不少「黑科技」的应用， Hydra 算是 2015 年的一支新秀，它可以让 800 万像素的 iPhone 6 拍出 3200 万像素的照片，以及给低光环境与高动态范围带来极大的提升。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/43fa61476577a56fb555c5ba1d1d164e_b.jpg" data-rawwidth="1294" data-rawheight="1136" class="origin_image zh-lightbox-thumb" width="1294" data-original="https://pic3.zhimg.com/43fa61476577a56fb555c5ba1d1d164e_r.jpg"&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/8033" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Hydra&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 通过连续拍摄 20 - 50 张照片来达到更完美的高分辨率、微距以及 HDR 照片，而 iPhone 自带的 HDR 模式则仅是通过三张不同曝光程度的照片来合成。Hydra 的高分辨率技术，是通过分析照片之间因为相机微小移动而丢失的信息，从而生成一张具有更多细节的照片，这一技术带来的效果，着实让人眼前一亮。&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/13711" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Moleskine Timepage&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：这是一个小众、但很有趣的 app，因为它高度借鉴了纸质日程笔记本的概念（Moleskine 笔记本的经典款之一）。&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic1.zhimg.com/d8076c5d5844eb9d712635b20b63fcf8_b.jpg" data-rawwidth="1000" data-rawheight="625" class="origin_image zh-lightbox-thumb" width="1000" data-original="https://pic1.zhimg.com/d8076c5d5844eb9d712635b20b63fcf8_r.jpg"&gt;从 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/13711" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Moleskine Timepage&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 这个命名上也能看出，它将日程、天气与笔记本很自然地融合在了一起，采用连续滚动式的日历呈现，右滑展开天气，点击进入日程管理，与一般的日历 app 逻辑很不一样，有一种很棒的沉浸体验感，而这种将实物质感转移到扁平化设计上的方向，我觉得会是日后的一大趋势。&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/16020" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;一览&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：我想如果要选一个国内 app，那一览应该值得一说。因为越多使用越会觉得，它不单单只是一个内容消费的产品，「应用内搜索」或者「移动端入口」可能才是它的野心。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/fe36926cf2ca897e67f7b2b13a18f773_b.jpg" data-rawwidth="1280" data-rawheight="1132" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/fe36926cf2ca897e67f7b2b13a18f773_r.jpg"&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/16020" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;一览&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;的模式可能是之前未曾见过的，它不断把更多的 app 内容抽出来，用一种刷 feed 流的方式聚合在一起，当它们聚集在一起之后，就可以开始做应用分发了，这也是豌豆荚的看家本领，它可能会成为一种未来应用商店的新形态。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/20110" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;PAUSE&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：可以说是纪念碑谷将游戏与医疗结合在一起的尝试，通过呼吸与冥想来帮助人们放松心情、缓解压力。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;p&gt;这也是 ustwo 最近一年来一直在探索的领域，比如之前与 &lt;a href="//link.zhihu.com/?target=http%3A//thriveport.com/" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Thriveport&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 共同开发的 &lt;a href="//link.zhihu.com/?target=http%3A//36kr.com/p/5036175.html" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Moodnotes&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;。PAUSE 没有任何剧情，完全通过移动手指与背景音乐提示来进入状态。&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/59364c13686879a9a8c56d0cfa2d043e_b.png" data-rawwidth="2266" data-rawheight="1334" class="origin_image zh-lightbox-thumb" width="2266" data-original="https://pic3.zhimg.com/59364c13686879a9a8c56d0cfa2d043e_r.png"&gt;&lt;blockquote&gt;深蓝色墨水在手机屏幕上散开，随着指尖滑动而游弋，当它变得越来越充盈，直到充满屏幕。这时，请闭上眼睛，感受耳边来自花虫鸟兽的声音，手指像一块磁铁般慢慢在屏幕上移动，而内心则渐渐变得空灵。&lt;/blockquote&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//36kr.com/p/5038214.html" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;「纪念碑谷」开发团队推出 PAUSE，欲颠覆心理治疗领域的又一新尝试&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/9490" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Meerkat&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：2015 年还有什么特别的社交产品？从 SXSW（西南偏南大会）上的 Meerkat 开始，到 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/9815" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Perisope&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，再到后来的 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/18319" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;17&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，视频直播类 app 开始爆红网络。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;p&gt;它们都有一个相似的地方，就是用户使用的门槛很低，通过简单点击就可以开始直播视频，视频只能实时在线观看，用户可以点赞或转发。&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/b31322fdfe71ea3b6a71ca945a6117c2_b.jpg" data-rawwidth="968" data-rawheight="856" class="origin_image zh-lightbox-thumb" width="968" data-original="https://pic3.zhimg.com/b31322fdfe71ea3b6a71ca945a6117c2_r.jpg"&gt;可以说随着 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/9490" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Meerkat&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 开始，视频直播在社交媒体中的位置与前景变得越来越明朗，很多人形容它是「下一代的 Twitter」，我觉得没错，尤其是等到某天 VR 普及之后。&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/15946" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;ZEEEN&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：同样是一款小众产品，也许你没听过，但是在 Dribbble 社区可是引起了不小的反响，作为一款设计师社区的第三方客户端，&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/15946" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Zeeen&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 有两个设计很有趣的地方。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/8c89cc56ff43bcf6e28ba67bfef3b597_b.jpg" data-rawwidth="1294" data-rawheight="1136" class="origin_image zh-lightbox-thumb" width="1294" data-original="https://pic4.zhimg.com/8c89cc56ff43bcf6e28ba67bfef3b597_r.jpg"&gt;首先是卡片式风格，虽然应该不是第一个采用圆角卡片（甚至连最底层的页面也是圆角）的设计风格，不过非常蛮贴合 Dribbble 的社区（篮球）文化。&lt;br&gt;&lt;br&gt;接下来才是最妙的地方，&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/15946" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Zeeen&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 通过一套算法，当用户在查看不同风格作品的时候，自动将页面的字体、背景色与作品的色调搭配，仿佛将作品融为一体，非常精妙。&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/3387" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Wildcard&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：还记得 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1096" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Circa&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 吗？对，就是那个通过碎片化信息来呈现新闻故事的 app，曾经一度被大家看好，但是最后仍难逃「新闻不赚钱」的命。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/dc948395ceaaa5bd272353299ce3a571_b.png" data-rawwidth="1508" data-rawheight="1334" class="origin_image zh-lightbox-thumb" width="1508" data-original="https://pic2.zhimg.com/dc948395ceaaa5bd272353299ce3a571_r.png"&gt;&lt;p&gt;而相比与传统的文字叙述，&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/3387" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Wildcard&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 更希望能通过新媒体的多个角度去了解一个新闻事件，Wildcard 同样也是透过卡片，组成一个新闻故事。&lt;/p&gt;&lt;br&gt;&lt;p&gt;这些卡片里，有不同媒体的报道，有新闻图片和视频，甚至还有来自 Twitter 用户的发言。同时 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/3387" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Wildcard&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的设计也非常流畅，卡片滚动与弹出的效果让人喜悦。前不久还听闻到 Circa &lt;a href="//link.zhihu.com/?target=https%3A//twitter.com/Circa/status/673914059037675520" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;宣布不久后即将回归的消息&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，也许新一代聚合形新闻客户端的风潮又将来临。&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/517320" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;VOX Player&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：今年我很喜欢的两个音乐播放器，一个是 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22972" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Cover Play&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; ，不过更多出于我对于个封面控的癖好，而另一个则是 VOX —— 近年来难得的一款功能强大的音乐播放器，不仅在交互上采用了大量的下拉手势，也在移动存储上带来了新的突破。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/e9a07156c7040ab0161f072acb1c6a16_b.jpg" data-rawwidth="800" data-rawheight="705" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic3.zhimg.com/e9a07156c7040ab0161f072acb1c6a16_r.jpg"&gt;新的突破在于 Loop，VOX 推出的一个云存储服务。Loop 提供了一个无限制的空间，可以随时随地在 iPhone 与 Mac 之间同步歌曲，不仅如此，它还不会损失一丁点音质，就像是为你而定制的私人电台，对于很多 hardcore 用户，简直就是难以抵抗的诱惑。&lt;br&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/517320" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;你在哪儿，好音乐就跟到哪儿 – VOX Player&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/10181" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Enlight&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：大而全好还是小而精好？自古两难全，直到有了 Enlight。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;用 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/1561" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;VSCO&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 调色，接着 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/11614" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Snapseed&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 精修，再用 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/3703" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;SKRWT&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;、&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/21631" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Facetune&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;、&lt;a href="//link.zhihu.com/?target=https%3A//itunes.apple.com/us/app/color-splash/id304871603%3Fmt%3D8" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Color Splash&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;、&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/5202" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;黄油相机&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;等进行更细分的处理，这是我平时修片时的选择，而现在 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/10181" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Enlight&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 就可以同时做到这一切。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/97f458e7b95e37d6f796b53de10c97e7_b.png" data-rawwidth="1936" data-rawheight="1136" class="origin_image zh-lightbox-thumb" width="1936" data-original="https://pic4.zhimg.com/97f458e7b95e37d6f796b53de10c97e7_r.png"&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/10181" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Enlight&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 做到了在复杂功能操作间的连续性与流畅感，这得益于它采用了多层级的设计，从底部直接选取照片，右侧唤出隐藏工具栏，简单的交互即可完成大部分操作，并且还将蒙版工具与重调功能置入在了许多处理环节，App Store 也将它列为了 2015 年度精选最佳 App 。&lt;br&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/501792" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;大概也许可能其他修图 app 都可以删了？- Enlight&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;Update at 11/28，懒癌如我今天终于鼓起勇气来补全最后的 5 个 app…&lt;br&gt;&lt;/b&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/7301" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;MacID&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：Mac OS X 与 iOS 正在变得越来越接近。基于两者之间的连续性（Continuity），开发者们搞出了很多好玩的东西，通过手机给 MacBook 解锁就是其中之一，例如 Near Lock、Kncok （它的宣传广告特别好玩），以及 MacID。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/e838ca8ad7999e2accb0390b2be1aede_b.png" data-rawwidth="1000" data-rawheight="625" class="origin_image zh-lightbox-thumb" width="1000" data-original="https://pic3.zhimg.com/e838ca8ad7999e2accb0390b2be1aede_r.png"&gt;&lt;p&gt;半年多下来，我觉得 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/7301" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;MacID&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 正在走向一个更成熟的方向，起初我让它来用 iPhone 6 的 Touch ID 来解锁电脑，现在不仅是手机，Apple Watch 和触控板的 Tap to Unlock 模式让解锁电脑这件事情变得非常方便。&lt;/p&gt;&lt;br&gt;&lt;p&gt;在最近几个版本迭代下来，&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/7301" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;MacID&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 相比最初的功能有了很大的变化，不再只是解锁而已 —— 现在还可以通过它来同步剪贴板，通过判断蓝牙信号强度自动唤醒、锁定电脑，MacID 真是充分利用了设备间的连续性。&lt;/p&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//sspai.com/27935" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;用 iPhone 指纹解锁 Mac 电脑，MacID for iOS 表现不错&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，&lt;a href="//link.zhihu.com/?target=http%3A//sspai.com/32055" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;优雅解锁 Mac 的 MacID&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;/b&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22973" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Implosion 聚爆&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：我认为如果要盘点 app，一定也不要让游戏缺席，于是我在文章的后半段选择了 6 个游戏，因为我觉得 2015 年是&lt;a href="//link.zhihu.com/?target=https%3A//zh.wikipedia.org/wiki/%25E6%2589%258B%25E6%259C%25BA%25E6%25B8%25B8%25E6%2588%258F%23.E5.B4.9B.E8.B5.B7.E8.88.87.E6.99.AE.E5.8F.8A" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;手机游戏&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;的走向成熟的一年。无论是疯狂卷钱的 &lt;a href="//link.zhihu.com/?target=https%3A//zh.wikipedia.org/zh/%25E9%2583%25A8%25E8%2590%25BD%25E5%2586%25B2%25E7%25AA%2581" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Clash of Clans&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，还是前不久将 MOBA 放到手机上的 &lt;a href="//link.zhihu.com/?target=https%3A//zh.wikipedia.org/wiki/%25E8%2599%259A%25E8%258D%25A3" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Vainglory&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，我认为都是非常成功的案例。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;而 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22973" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Implosion&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;（中文译名为聚爆）则有着另一个野心，那就是将主机级别游戏搬到移动平台上，并且它做到了。Rayark 这个来自台湾的游戏开发商，还曾推出过 Cytus 和 Deemo 这两个被大家所熟悉的音游，第一次制作 ARPG 游戏就将手机游戏推向了一个新高度。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/5598dab4fe2cb6b74d08244ce773ac4a_b.jpg" data-rawwidth="800" data-rawheight="600" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic3.zhimg.com/5598dab4fe2cb6b74d08244ce773ac4a_r.jpg"&gt;&lt;p&gt;当时我曾参与策划了一次线上沙龙，有幸与 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22973" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Implosion&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 主创团队「近距离接触」，了解这个在画面音乐、剧情故事以及游戏性都高出同类一截的游戏背后的故事。&lt;/p&gt;&lt;br&gt;&lt;p&gt;首先 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22973" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Implosion&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 有一个完整的世界观设定和剧情线，Rayark 注重游戏剧情的「好习惯」从 Deemo 就开始了。然后在游戏性上 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22973" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Implosion&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 采用左右虚拟摇杆，但在节奏感上下了很多功夫，会让人觉得出招、连击的动作非常流畅，这或许与制作音游的有异曲同工之妙，这种以前只在 PlayStation 上有过的体验，我还是第一次在手机上感受到。&lt;/p&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/510904" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;解密：这款叫 Implosion 的新游戏如何做到人神共爽？| 领客专栏·電腦玩物&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;，&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/special/rayark-live" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;爱范儿 x 雷亚 Live! 活动实录&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;/b&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22975" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Space Marshals&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：iOS 上的游戏太多太多，可能称得上是「神作」的却少之又少。我很喜欢那些有着丰富剧情、精致画面和游戏性极佳的游戏，每每遇到一部这样的「神作」都让我兴奋不已。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22975" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Space Marshals&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 就是这样的一款游戏，来自知名游戏开发商 Pixelbite。这是一款带有「潜行」元素的 RPG 射击类游戏，同样也是双摇杆操作，按住并滑动来瞄准敌人，松开射击，流畅度上也体验极佳。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/ff63c021c128ca235e55451b487565fd_b.png" data-rawwidth="2048" data-rawheight="1536" class="origin_image zh-lightbox-thumb" width="2048" data-original="https://pic2.zhimg.com/ff63c021c128ca235e55451b487565fd_r.png"&gt;&lt;p&gt;除了移动端上「前所未有」的流畅性，画面与音效也是让它非常成功的一点，场景内物体的动态阴影效果、色彩渲染，甚至爆炸粒子效果，都很出色，设计者选择的 45 度俯视视角也很有意思。&lt;/p&gt;&lt;br&gt;&lt;p&gt;总之我当时为了收集游戏里的所有道具，真是几天几夜乐此不疲。&lt;/p&gt;&lt;br&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/491963" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;牛仔帽与激光枪，孤胆刑警与星辰大海 | 败物·Space Marshals&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;/b&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22975" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Horizon Chase&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：2015 年真是有很多老牌游戏工作室在移动端上开始发力了，正如 Aquiris 前不久推出的赛车游戏 Horizon Chase，又是一个让人玩起来就停不下的游戏。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22975" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Horizon Chase&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 一上来就讲说，我要挑战赛车游戏的极限。它的画面很有特点，采用鲜明浓郁的 2D 场景画面，搭配全新的 3D 渲染技术，完美复刻了 80 年代风格的经典赛车游戏。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic1.zhimg.com/0dd6f38f5581ca563917d152516535cc_b.jpg" data-rawwidth="1280" data-rawheight="632" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/0dd6f38f5581ca563917d152516535cc_r.jpg"&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22975" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Horizon Chase&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 与 &lt;a href="//link.zhihu.com/?target=https%3A//itunes.apple.com/cn/app/real-racing-3/id556164350%3Fmt%3D8" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Real Racing&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 这一类的赛车游戏大相径庭，不追求拟真的驾驶感，反而寻找赛车中那种纯粹的快感，那些「不真实不科学」的游戏设定，再配上 80 年代的摇滚乐，反而让使我沉溺在这一场没有尽头的追逐中。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/568369" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;速度为王：老派却不失姿态的街机赛车 – Horizon Chase&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/7168" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Shadowmatic&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：非常惊艳，一款基于投影画面与手势交互来设计的解密类游戏。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;Shadowmatic 来自于 Triada Studio 的工作室，一个专业的计算机图形及动画特效团队，&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/7168" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Shadowmatic&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 也是他们第一次将自己成熟的图像引擎直接用于游戏开发。&lt;br&gt;&lt;br&gt;&lt;img src="https://pic3.zhimg.com/b703f92b9f93bee964a6c1a4e65caac6_b.png" data-rawwidth="2048" data-rawheight="1536" class="origin_image zh-lightbox-thumb" width="2048" data-original="https://pic3.zhimg.com/b703f92b9f93bee964a6c1a4e65caac6_r.png"&gt;&lt;p&gt;除了画面细节感人之外，游戏性是它最有趣的地方。如果你还记得小时候与玩伴嬉戏时经常玩的「手影」游戏，或者「皮影戏」，那么你便会觉得似曾相识。通过给出的物体材质、房间环境可以大概判断目标物体的类型，再充分发挥自己的想象力完成这个奇妙的过程。&lt;br&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//www.ifanr.com/app/487204" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;脑洞大开，亦有用武之地 – Shadowmatic&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/21289" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Lifeline&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：没有华丽的画面，这个游戏的灵魂是文字对话，但却让人乐此不疲。&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/21289" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Lifeline&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 的整个故事线由 Dave Justus 撰写，他曾参与 DC 经典漫画 The Wolf Among Us（人中之狼） 的编写。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/bb16bf21553406693c23ea60308a59b5_b.jpg" data-rawwidth="1294" data-rawheight="1136" class="origin_image zh-lightbox-thumb" width="1294" data-original="https://pic2.zhimg.com/bb16bf21553406693c23ea60308a59b5_r.jpg"&gt;&lt;p&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/21289" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Lifeline&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 应该说是让文字游戏重新火了一把，游戏中的时间与现实保持吻合，让人觉得很真实。前不久，Lifeline 的第三部作品 Lifeline: Silent Night 也上架了 App Store。&lt;/p&gt;&lt;br&gt;&lt;ul&gt;&lt;li&gt;&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/22977" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;Tap Titans&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;：最后要说 Tap Titans 也是年初在国外大热的游戏，大热是因为作为一款 RPG 游戏，它的玩法简单得令人发指 —— 不停戳屏幕。没有 HP，也没有组合连击，游戏的设定就是连续打倒 10 个小怪之后在规定时间内干掉 Boss，否则就要重新干掉一轮小怪。&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;img src="https://pic4.zhimg.com/1d975e99d0400048519f8dd19331e8b3_b.jpg" data-rawwidth="1280" data-rawheight="720" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/1d975e99d0400048519f8dd19331e8b3_r.jpg"&gt;&lt;p&gt;所以说整个游戏的玩法非常「粗暴」，让人联想到 Flappy Brid，不过在游戏过程中，角色也可以不断升级、学习技能或雇佣更多的英雄。可能我是一个很喜欢自我满足的人，Tap Titans 也抓住了这个心理特点，当你看到屏幕上不断跳出成千上万的伤害数字时，很容易就分泌多巴胺，从而获得满足感了。&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;更多阅读：&lt;a href="//link.zhihu.com/?target=http%3A//sspai.com/27863" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;越无聊越容易上瘾？这游戏能让你点屏幕点到发狂：Tap Titans&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;以上文中提到的 app 都被整理到 &lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;NEXT&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt; 上的产品集「&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts/collections/518" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;2015 年国内外让我眼前一亮的 App&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;」中了，把 NEXT 的产品集功能当做收集整理产品的工具特别好使，很推荐产品经理以及对此有需求的人&lt;a href="//link.zhihu.com/?target=http%3A//next.36kr.com/posts" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;将其善用&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;。&lt;/p&gt;&lt;br&gt;&lt;p&gt;如果你也有觉得在 2015 年中让自己觉得眼前一亮的新产品，欢迎与我分享、交流。&lt;/p&gt;&lt;br&gt;好了，2015 未完，2016 未至，也许还有惊喜接踵而来，希望明年能有更多让人眼前一亮的新东西。</textarea>


                                            <div class="zh-summary summary clearfix">
                                                <img src="https://pic4.zhimg.com/19a30ab1d73cc7fc212de1fa84bae45b_200x112.png"
                                                     data-rawwidth="1920" data-rawheight="1080"
                                                     class="origin_image inline-img zh-lightbox-thumb"
                                                     data-original="https://pic4.zhimg.com/19a30ab1d73cc7fc212de1fa84bae45b_r.png">
                                                这是一个好问题， 2015 年这一年，我开始不停地写各种各样的 app 文章、报道与测评，这一年也快过完了，是时候想想今年有哪些让我眼前一亮的
                                                app 了。 在这之前，可以先回顾一下 2014 年，去年底，没毕业的我还在为 AppSolution 撰稿（ifanr 旗下的应用推荐…

                                                <a href="${ctx}/question/37624440/answer/72870384"
                                                   class="toggle-expand">显示全部</a>

                                            </div>


                                            <p class="visible-expanded"><a itemprop="url"
                                                                           class="answer-date-link meta-item"
                                                                           data-tooltip="s$t$发布于 2015-11-18"
                                                                           target="_blank"
                                                                           href="${ctx}/question/37624440/answer/72870384">编辑于
                                                2016-12-24</a></p>

                                        </div>
                                    </div>
                                    <div class="zm-item-meta feed-meta">
                                        <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                            <div class="zm-meta-panel">

                                                <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                                   href="javascript:;" id="sfb-7256992"><i class="z-icon-follow"></i>关注问题</a>

                                                <a href="${ctx}/topic#" name="addcomment"
                                                   class="meta-item toggle-comment js-toggleCommentBox">
                                                    <i class="z-icon-comment"></i>90 条评论</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-thank" data-thanked="false"><i
                                                        class="z-icon-thank"></i>感谢</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                                   role="button" aria-expanded="false"
                                                   style="-webkit-user-select: none;" tabindex="0" aria-haspopup="true">
                                                    <div class="goog-inline-block goog-menu-button-outer-box">
                                                        <div class="goog-inline-block goog-menu-button-inner-box">
                                                            <div class="goog-inline-block goog-menu-button-caption"><i
                                                                    class="z-icon-share"></i>分享
                                                            </div>
                                                            <div class="goog-inline-block goog-menu-button-dropdown">
                                                                &nbsp;</div>
                                                        </div>
                                                    </div>
                                                </a>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-collect"><i
                                                        class="z-icon-collect"></i>收藏</a>


                                                <span class="zg-bull zu-autohide">•</span>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                                <span class="zg-bull zu-autohide">•</span>
                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-report">举报</a>


                                                <meta name="copyrightStatus" content="0">
                                                <meta name="disableCopyAvatar"
                                                      content="https://pic2.zhimg.com/c85108a743dcf8ed9e443d68f6935315_s.jpg">

                                                <span class="zg-bull">•</span>

                                                <a href="${ctx}/terms#sec-licence-6" target="_blank"
                                                   class="meta-item copyright">禁止转载</a>


                                                <button class="meta-item item-collapse js-collapse">
                                                    <i class="z-icon-fold"></i>收起
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="feed-item feed-item-hook  folding" itemprop="question" itemscope=""
                             itemtype="http://schema.org/Question" data-score="3499.84026641" data-type="Answer"
                             data-za-module="AnswerItem">
                            <link itemprop="url" href="${ctx}/question/38084181/answer/75512115">
                            <meta itemprop="answer-id" content="25628572">
                            <meta itemprop="answer-url-token" content="75512115">
                            <meta itemprop="answerCount" content="3086">
                            <meta itemprop="isTopQuestion" content="false">
                            <div class="feed-main">
                                <div class="feed-content">
                                    <h2><a class="question_link" href="${ctx}/question/38084181"
                                           target="_blank" data-id="7440937" data-za-element-name="Title">
                                        2015 年你有怎样的体验？
                                    </a></h2>
                                    <div class="expandable entry-body">
                                        <link itemprop="url"
                                              href="${ctx}/question/38084181/answer/75512115">
                                        <!-- <meta itemprop="answer-id" content="25628572">
                                        <meta itemprop="answer-url-token" content="75512115"> -->

                                        <div class="zm-item-vote">
                                            <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                               data-bind-votecount="">5504</a>
                                        </div>

                                        <div class="zm-votebar" data-za-module="VoteBar">
                                            <button class="up" aria-pressed="false" title="赞同">
                                                <i class="icon vote-arrow"></i>
                                                <span class="count">5504</span>
                                                <span class="label sr-only">赞同</span>
                                            </button>
                                            <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                                <i class="icon vote-arrow"></i>
                                                <span class="label sr-only">反对，不会显示你的姓名</span>
                                            </button>
                                        </div>


                                        <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$zhuangchan" target="_blank"
   href="${ctx}/people/zhuangchan">莊謙</a></span><span title="岁月忽已晚。" class="bio">
岁月忽已晚。
</span>
</span>
                                        </div>

                                        <div class="zm-item-vote-info" data-votecount="5504" data-async-voters="1"
                                             data-za-module="VoteInfo">


                                            <span class="voters text"><a href="${ctx}/topic#"
                                                                         class="more text"><span class="js-voteCount">5504</span>&nbsp;人赞同</a></span>


                                        </div>
                                        <div class="zm-item-rich-text expandable js-collapse-body"
                                             data-resourceid="7440937" data-action="/answer/content"
                                             data-author-name="莊謙" data-entry-url="/question/38084181/answer/75512115">

                                            <textarea hidden="" class="content">今年是我五十多圈的年轮里的最外圈，我用这个比喻，亦是希望我老来自知，宽度衬得起生命的长度。&lt;br&gt;&lt;br&gt;今年继父去世，我第二次返乡。&lt;br&gt;已逝之人不妄加相评，过去的都如烟尘消散。&lt;br&gt;几十年未见的老母亲前两年里摔到了腿，只能坐在轮椅上。这两年我都有托人转寄医药费生活费回去给她，虽说早年经历并不愉快，但继父逝世之后，我还是把母亲接到了家中来，与爱人照顾着她。&lt;br&gt;&lt;br&gt;趁着此次返乡，我再去了先父坟前，只剩一块孤零零的发黑的碑石矗立。便做了个决定，重新为他立一个墓。现已落好。&lt;br&gt;我虽是个彻底的无神论者，可我还是在他坟前一一讲述这些年的起起落落。直到天黑鸦啼，风声四起。&lt;br&gt;离开时想，若是算起来，我已经远远老过他了啊。&lt;br&gt;&lt;br&gt;挚友今年确诊得了咽喉癌加肝癌，化疗，手术，切除病灶，折腾过后，双腿不遂。&lt;br&gt;一个拼搏了半世的男人，从未有一天停歇，没有想到终有一天停下来的地方竟是病床。&lt;br&gt;我亲眼见着他坐在轮椅上，老泪纵横，哭着说我一生坚强，竟落成个废人田地。&lt;br&gt;他在今年去世了。&lt;br&gt;他筹划着死后的事，仿佛能预料到一般，在他去世的前一夜他为自己买了一块墓地。&lt;br&gt;去世的那天晚上，他强烈要求要出院回家乡。救护车开到半路，在高速公路上就断了气。若真有灵魂，不知他此刻能否飘回到家乡。&lt;br&gt;他年少双亲早逝，无依无靠命途多舛，跟他在结识交好，因我们同是沦落人。在他身上我能看到自己的影子，早年遭遇困厄时，我抽烟解苦，他喝酒浇愁。如今，肝癌夺去了他的生命。我深知他这一辈子的困苦，今日所有全由血泪筑成。&lt;br&gt;心有戚戚。&lt;br&gt;&lt;br&gt;前些年里因儿子身体问题，来回奔波，寻医问药，相比起同龄的小孩，他反应较为迟缓一些，今年他上初中，在学校常被孤立，没有玩伴。也便的，在今年，我把所有之前经营的生意全都转手了出去。全心全意地在家里陪伴他和照顾母亲。对了，我算是提前退休了。&lt;br&gt;&lt;br&gt;今年，养了十几年的伙伴，一只金毛寻猎犬，终老了。它的年龄跟儿子一样，它去世儿子哭得可是伤心。我自诩坚强，以为再不轻易泣涕，那天夜里抚摸着它的身体，却禁不住眼眶湿润。&lt;br&gt;&lt;br&gt;事情讲完，可摆上一篇流水账并非我意。&lt;br&gt;岁月无情，几年前我还特别怕“老”这个字眼。怕我糊涂之间便过了一生，余下的时间只是用来收拾前事，永无餍足的回忆过去而已。&lt;br&gt;可如今不知哪个节点开始，我已经愿意承认了，承认我的平凡世俗和受锤老去。&lt;br&gt;我不断地宽恕宽恕宽恕，直至再没我有资格去宽恕之人、之事。我以为洒脱能将自己的生命拉长放缓，可为了达到洒脱而进行的洒脱，只不过自欺。我悟到了，是否算是向前又走了一步。&lt;br&gt;一年其实过得飞快，一生也是。&lt;br&gt;&lt;br&gt;两年前我在此教人及时待自己好，别有亲情包袱。两年后的今天我又跟人讲述自己的宽恕理念，像是兜售人生鸡汤。&lt;br&gt;除了这些，好像也没什么能说给后来者。&lt;br&gt;&lt;br&gt;写得仓促杂乱，胡言妄语，带过便好。</textarea>


                                            <div class="zh-summary summary clearfix">

                                                今年是我五十多圈的年轮里的最外圈，我用这个比喻，亦是希望我老来自知，宽度衬得起生命的长度。 今年继父去世，我第二次返乡。
                                                已逝之人不妄加相评，过去的都如烟尘消散。 几十年未见的老母亲前两年里摔到了腿，只能坐在轮椅上。这两年我都有托人转寄医药…

                                                <a href="${ctx}/question/38084181/answer/75512115"
                                                   class="toggle-expand">显示全部</a>

                                            </div>


                                            <p class="visible-expanded"><a itemprop="url"
                                                                           class="answer-date-link meta-item"
                                                                           data-tooltip="s$t$发布于 2015-12-06"
                                                                           target="_blank"
                                                                           href="${ctx}/question/38084181/answer/75512115">编辑于
                                                2015-12-15</a></p>

                                        </div>
                                    </div>
                                    <div class="zm-item-meta feed-meta">
                                        <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                            <div class="zm-meta-panel">

                                                <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                                   href="javascript:;" id="sfb-7440937"><i class="z-icon-follow"></i>关注问题</a>

                                                <a href="${ctx}/topic#" name="addcomment"
                                                   class="meta-item toggle-comment js-toggleCommentBox">
                                                    <i class="z-icon-comment"></i>807 条评论</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-thank" data-thanked="false"><i
                                                        class="z-icon-thank"></i>感谢</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                                   role="button" aria-expanded="false"
                                                   style="-webkit-user-select: none;" tabindex="0" aria-haspopup="true">
                                                    <div class="goog-inline-block goog-menu-button-outer-box">
                                                        <div class="goog-inline-block goog-menu-button-inner-box">
                                                            <div class="goog-inline-block goog-menu-button-caption"><i
                                                                    class="z-icon-share"></i>分享
                                                            </div>
                                                            <div class="goog-inline-block goog-menu-button-dropdown">
                                                                &nbsp;</div>
                                                        </div>
                                                    </div>
                                                </a>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-collect"><i
                                                        class="z-icon-collect"></i>收藏</a>


                                                <span class="zg-bull zu-autohide">•</span>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                                <span class="zg-bull zu-autohide">•</span>
                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-report">举报</a>


                                                <meta name="copyrightStatus" content="1">
                                                <meta name="disableCopyAvatar" content="">

                                                <span class="zg-bull">•</span>

                                                <a href="${ctx}/terms#sec-licence-1" target="_blank"
                                                   class="meta-item copyright">
                                                    作者保留权利
                                                </a>


                                                <button class="meta-item item-collapse js-collapse">
                                                    <i class="z-icon-fold"></i>收起
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="feed-item feed-item-hook question-item" itemprop="question" itemscope=""
                             itemtype="http://schema.org/Question" data-score="3499.46932474" data-type="Question"
                             data-za-module="QuestionItem">
                            <link itemprop="url" href="${ctx}/question/39035428">
                            <meta itemprop="answerCount" content="124">
                            <meta itemprop="isTopQuestion" content="false">

                            <h2 class="question-item-title">

                                <a target="_blank" class="question_link" href="${ctx}/question/39035428">2015剩最后一天了，你有什么想说的？</a>
                            </h2>

                            <div class="question-item-meta">
                                <a class="zg-link-gray-normal meta-item" target="_blank"
                                   href="${ctx}/question/39035428">124 个回答</a>
                                <span class="zg-bull">•</span>
                                <a class="zg-link-gray-normal meta-item"
                                   href="${ctx}/question/39035428/followers">187 人关注</a>
                                <span class="zg-bull zu-autohide">•</span>

                                <a data-follow="q:link" class="follow-link zg-follow meta-item zu-autohide"
                                   href="javascript:;" id="sfb-7821372">关注问题</a>

                                <span class="zg-bull zu-autohide">•</span>

                                <a href="${ctx}/topic#"
                                   class="js-questionUnhelpful meta-item zu-autohide" data-qid="7821372">没有帮助</a>

                            </div>

                        </div>
                        <div class="feed-item feed-item-hook  folding" itemprop="question" itemscope=""
                             itemtype="http://schema.org/Question" data-score="3499.41434761" data-type="Answer"
                             data-za-module="AnswerItem">
                            <link itemprop="url" href="${ctx}/question/38781387/answer/78144001">
                            <meta itemprop="answer-id" content="26684241">
                            <meta itemprop="answer-url-token" content="78144001">
                            <meta itemprop="answerCount" content="42">
                            <meta itemprop="isTopQuestion" content="false">
                            <div class="feed-main">
                                <div class="feed-content">
                                    <h2><a class="question_link" href="${ctx}/question/38781387"
                                           target="_blank" data-id="7719840" data-za-element-name="Title">
                                        2015年，有哪些 App 或者产品帮你更好地健康生活？
                                    </a></h2>
                                    <div class="expandable entry-body">
                                        <link itemprop="url"
                                              href="${ctx}/question/38781387/answer/78144001">
                                        <!-- <meta itemprop="answer-id" content="26684241">
                                        <meta itemprop="answer-url-token" content="78144001"> -->

                                        <div class="zm-item-vote">
                                            <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                               data-bind-votecount="">112</a>
                                        </div>

                                        <div class="zm-votebar" data-za-module="VoteBar">
                                            <button class="up" aria-pressed="false" title="赞同">
                                                <i class="icon vote-arrow"></i>
                                                <span class="count">112</span>
                                                <span class="label sr-only">赞同</span>
                                            </button>
                                            <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                                <i class="icon vote-arrow"></i>
                                                <span class="label sr-only">反对，不会显示你的姓名</span>
                                            </button>
                                        </div>


                                        <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$lin-lu-89-7" target="_blank" href="${ctx}/people/lin-lu-89-7">猫禅</a></span>
</span>
                                        </div>

                                        <div class="zm-item-vote-info" data-votecount="112" data-async-voters="1"
                                             data-za-module="VoteInfo">


                                            <span class="voters text"><a href="${ctx}/topic#"
                                                                         class="more text"><span class="js-voteCount">112</span>&nbsp;人赞同</a></span>


                                        </div>
                                        <div class="zm-item-rich-text expandable js-collapse-body"
                                             data-resourceid="7719840" data-action="/answer/content"
                                             data-author-name="猫禅" data-entry-url="/question/38781387/answer/78144001">

                                            <textarea hidden="" class="content">关上手机</textarea>


                                            <div class="zh-summary summary clearfix">

                                                关上手机

                                                <a href="${ctx}/question/38781387/answer/78144001"
                                                   class="toggle-expand">显示全部</a>

                                            </div>


                                            <p class="visible-expanded"><a itemprop="url"
                                                                           class="answer-date-link meta-item"
                                                                           target="_blank"
                                                                           href="${ctx}/question/38781387/answer/78144001">发布于
                                                2015-12-23</a></p>

                                        </div>
                                    </div>
                                    <div class="zm-item-meta feed-meta">
                                        <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                            <div class="zm-meta-panel">

                                                <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                                   href="javascript:;" id="sfb-7719840"><i class="z-icon-follow"></i>关注问题</a>

                                                <a href="${ctx}/topic#" name="addcomment"
                                                   class="meta-item toggle-comment js-toggleCommentBox">
                                                    <i class="z-icon-comment"></i>3 条评论</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-thank" data-thanked="false"><i
                                                        class="z-icon-thank"></i>感谢</a>


                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                                   role="button" aria-expanded="false"
                                                   style="-webkit-user-select: none;" tabindex="0" aria-haspopup="true">
                                                    <div class="goog-inline-block goog-menu-button-outer-box">
                                                        <div class="goog-inline-block goog-menu-button-inner-box">
                                                            <div class="goog-inline-block goog-menu-button-caption"><i
                                                                    class="z-icon-share"></i>分享
                                                            </div>
                                                            <div class="goog-inline-block goog-menu-button-dropdown">
                                                                &nbsp;</div>
                                                        </div>
                                                    </div>
                                                </a>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-collect"><i
                                                        class="z-icon-collect"></i>收藏</a>


                                                <span class="zg-bull zu-autohide">•</span>

                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                                <span class="zg-bull zu-autohide">•</span>
                                                <a href="${ctx}/topic#"
                                                   class="meta-item zu-autohide js-report">举报</a>


                                                <meta name="copyrightStatus" content="1">
                                                <meta name="disableCopyAvatar" content="">

                                                <span class="zg-bull">•</span>

                                                <a href="${ctx}/terms#sec-licence-1" target="_blank"
                                                   class="meta-item copyright">
                                                    作者保留权利
                                                </a>


                                                <button class="meta-item item-collapse js-collapse">
                                                    <i class="z-icon-fold"></i>收起
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                    <a href="javascript:;" id="zh-load-more" data-method="next"
                       class="zg-btn-white zg-r3px zu-button-more" style="display:none">更多</a>
                </div>
            </div>
        </div>
    </div>

    <div class="zu-main-sidebar" data-za-module="RightSideBar">

        <div class="topics-plaza">
            <a target="_blank" href="${ctx}/topics" class="zg-btn-blue">
                进入话题广场
            </a>
            <a target="_blank" href="${ctx}/topics" class="text">
                来这里发现更多有趣话题
            </a>
        </div>
    </div>

</div>

<div id="zh-footer" class="zh-footer">
    <div class="content zg-wrap clearfix">
        <ul>

            <li><a href="https://liukanshan.zhihu.com/" target="_blank">刘看山</a></li>

            <li><a href="${ctx}/question/19581624" target="_blank">知乎指南</a></li>
            <li><a href="javascript:;" id="js-feedback-button">建议反馈</a></li>

            <li><a href="${ctx}/app" target="_blank">移动应用</a></li>
            <li><a href="${ctx}/careers">加入知乎</a></li>
            <li><a href="${ctx}/terms" target="_blank">知乎协议</a></li>
            <li><a href="${ctx}/jubao" target="_blank">举报投诉</a></li>
            <li><a href="${ctx}/contact">联系我们</a></li>

        </ul>

        <span class="copy">© 2017 知乎</span>

    </div>
</div>

</body>
</html>