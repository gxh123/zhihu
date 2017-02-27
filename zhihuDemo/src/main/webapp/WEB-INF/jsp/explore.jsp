<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <title>发现 - 知乎</title>
    <%--<link rel="stylesheet" href="${ctx}/assets/css/z1.css">--%>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
</head>

<body class="zhi page-explore">

<div role="navigation" class="zu-top" data-za-module="TopNavBar">
    <div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
        <a href="${ctx}/" class="zu-top-link-logo" >知乎</a>
        <!--右上角姓名相关-->
        <div class="top-nav-profile">
            <a href="${ctx}/user/${user.id}" class="zu-top-nav-userinfo " id=":0" role="button" aria-haspopup="true" aria-activedescendant="">
                <span class="name">${user.name}</span>
                <%--<img class="Avatar" src="${ctx}/assets/img/s.jpg" alt=${user.name}>--%>
                <img class="Avatar" src="${ctx}/assets/img/my_avatar.jpg" alt=${user.name}>
                <span id="zh-top-nav-new-pm" class="zg-noti-number zu-top-nav-pm-count" style="visibility:hidden" data-count="0"></span>
            </a>
            <!--鼠标放在名字上显示的下拉式菜单-->
            <ul class="top-nav-dropdown" id="top-nav-profile-dropdown" aria-labelledby=":0">
                <li>
                    <a href="${ctx}/user/${user.id}" tabindex="-1" id=":1">
                        <i class="zg-icon zg-icon-dd-home"></i>我的主页
                    </a>
                </li>
                <li>
                    <a href="${ctx}/inbox" tabindex="-1" id=":2">
                        <i class="zg-icon zg-icon-dd-pm"></i>私信
                        <span id="zh-top-nav-pm-count" class="zu-top-nav-pm-count zg-noti-number" style="visibility:hidden" data-count="0">
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

        <!--提问-->
        <%--<button class="zu-top-add-question" id="zu-top-add-question">提问</button>--%>
        <!-- 按钮触发模态框 -->
        <button class="zu-top-add-question" style="" data-toggle="modal" data-target="#questionModal">提问</button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="questionModal" tabindex="-1" role="dialog" aria-labelledby="questionModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="z-index: 1050">
            <%--<div class="modal-dialog">--%>
            <div class="modal-content" style="width: 580px;margin-left: 600px;margin-top: 150px">
                <div class="modal-header" style="height: 50px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h5 class="modal-title" id="questionModalLabel" style="font-weight: bold">
                        提问
                    </h5>
                </div>
                <div class="modal-body">
                    <form id="question_form" method="post">
                        <input type="reset" style="display:none;" />
                        <%--<input name="user_id" type="hidden" value=${user.id}>--%>
                        <input name="anonymous" id="anonymous_hidden" type="hidden">
                        <textarea name="question_title" placeholder="写下你的问题" required="required" style="width: 550px;height: 50px;font-size:14px;resize:none;margin-top: 10px;"></textarea>
                        <div style="margin-top: 20px">问题说明（可选）：</div>
                        <textarea name="question_content" placeholder="问题背景、条件等详细信息" style="font-size:14px;width: 550px;height:110px;resize:none;"></textarea>
                        <div style="margin-top: 20px">选择话题：</div>
                        <input name="question_topic" type="text" required="required" style="font-size:14px;width: 550px;height: 35px">
                        <div style="margin-top: 20px">
                            <input type="checkbox" id="anonymous" value="1" /><label style="font-weight: inherit" for="anonymous" >匿名</label>
                        </div>
                    </form>
                </div>

                <div class="modal-footer" style="border: none;padding-top: 0">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                    <button type="button" class="btn btn-primary">
                        发布
                    </button>
                </div>
            </div><!-- /.modal-content -->
            <%--</div><!-- /.modal -->--%>
        </div>


        <!--搜索-->
        <div role="search" id="zh-top-search" class="zu-top-search">
            <form method="GET" action="${ctx}/search" id="zh-top-search-form" class="zu-top-search-form">
                <input name="type" value="content" type="hidden">
                <label for="q" class="hide-text">知乎搜索</label><input class="zu-top-search-input" id="q" name="q"
                                                                    autocomplete="off" maxlength="100"
                                                                    placeholder="搜索你感兴趣的内容..." role="combobox"
                                                                    aria-autocomplete="list" type="text">
                <button type="submit" class="zu-top-search-button"><span class="hide-text">搜索</span><span
                        class="sprite-global-icon-magnifier-dark"></span></button>
            </form>
        </div>

        <!--首页，话题，发现，消息-->
        <div id="zg-top-nav" class="zu-top-nav">
            <ul class="zu-top-nav-ul zg-clear">
                <li class="zu-top-nav-li current" id="zh-top-nav-home">
                    <a class="zu-top-nav-link" href="${ctx}/" id="zh-top-link-home">首页</a>
                </li>
                <li class="top-nav-topic-selector zu-top-nav-li " id="zh-top-nav-topic">
                    <a class="zu-top-nav-link" href="${ctx}/topic" id="top-nav-dd-topic">话题</a>
                </li>

                <li class="zu-top-nav-li " id="zh-top-nav-explore">
                    <a class="zu-top-nav-link" href="${ctx}/explore">发现</a>
                </li>

                <li class="top-nav-noti zu-top-nav-li ">
                    <a class="zu-top-nav-link" href="javascript:;" id="zh-top-nav-count-wrap" role="button">
                        <span class="mobi-arrow"></span>消息
                        <span id="zh-top-nav-count" class="zu-top-nav-count zg-noti-number" style="display: none;">0</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="zg-wrap zu-main clearfix " role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">
            <div class="explore-tab" id="js-explore-tab">
                <a class="zg-anchor-hidden" name="daily-hot"></a>
                <a class="zg-anchor-hidden" name="monthly-hot"></a>
                <ul class="tab-navs clearfix">
                    <li class="tab-nav active"><a class="anchor" href="${ctx}/explore#daily-hot"
                                                  data-za-c="explore" data-za-a="visit_explore_daily_trendings"
                                                  data-za-l="explore_daily_trendings">今日最热</a></li>
                    <li class="tab-nav"><a class="anchor" href="${ctx}/explore#monthly-hot"
                                           data-za-c="explore" data-za-a="visit_explore_monthly_trendings"
                                           data-za-l="explore_monthly_trendings">本月最热</a></li>
                </ul>
                <div class="tab-panel" style="display: block;">
                    <div data-type="daily">
                        <div class="explore-feed feed-item" data-offset="1" data-za-module="AnswerItem">
                            <h2><a class="question_link" href="${ctx}/question/51160183/answer/142163384"
                                   target="_blank" data-id="12681596" data-za-element-name="Title">
                                珠穆朗玛峰是地球上的最高点，离太阳应该也是最近，可为什么气温却比地面低？
                            </a></h2>
                            <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                                 data-aid="52394452" data-atoken="142163384" data-collapsed="0"
                                 data-created="1485013564" data-deleted="0" data-isowner="0" data-helpful="1"
                                 data-copyable="1">
                                <link itemprop="url" href="${ctx}/question/51160183/answer/142163384">
                                <meta itemprop="answer-id" content="52394452">
                                <meta itemprop="answer-url-token" content="142163384">
                                <a class="zg-anchor-hidden" name="answer-52394452"></a>

                                <div class="zm-item-vote">
                                    <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                       data-bind-votecount="">156</a>
                                </div>

                                <div class="zm-votebar" data-za-module="VoteBar">
                                    <button class="up" aria-pressed="false" title="赞同">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">156</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </div>


                                <div class="answer-head">

                                    <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$mo-bei-79-44" target="_blank"
   href="${ctx}/people/mo-bei-79-44">漠北</a><span class="icon icon-badge-best_answerer icon-badge"
                                                                data-tooltip="s$b$优秀回答者"></span></span><span
        class="badge-summary"><a href="${ctx}/people/mo-bei-79-44#hilightbadge" target="_blank">气象、气象学、大气科学话题优秀回答者</a></span>



<span title="大气科学/强风暴物理学" class="bio">
大气科学/强…
</span>
</span>
                                    </div>

                                    <div class="zm-item-vote-info" data-votecount="156" data-za-module="VoteInfo">


<span class="answer-tag">
<span class="text">收录于 </span>


<span class="text">编辑推荐</span>



</span>


                                        <span class="zg-bull text">•</span><span class="voters text"><a
                                            href="${ctx}/explore#" class="more text"><span
                                            class="js-voteCount">156</span>&nbsp;人赞同</a></span>


                                    </div>
                                </div>
                                <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="12681596"
                                     data-action="/answer/content" data-author-name="漠北"
                                     data-entry-url="/question/51160183/answer/142163384">

                                    <textarea hidden="" class="content">&lt;b&gt;珠穆朗玛峰峰顶离太阳近却比地面温度低，那是因为它还不够高，或者说是由于臭氧层的高度太高。&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;一、&lt;/b&gt;&lt;br&gt;高票答案的主要的关注点都在“几何高度”、“日地距离”等绝对高度，但是我觉得，这是不太合理的。&lt;br&gt;&lt;br&gt;以下是理由：&lt;br&gt;1、高度越高温度越低在&lt;b&gt;对流层&lt;/b&gt;以及&lt;b&gt;中层大气&lt;/b&gt;内是成立的，所以中层大气也有&lt;b&gt;高空对流层&lt;/b&gt;的别称。&lt;br&gt;2、而在&lt;b&gt;平流层&lt;/b&gt;以及&lt;b&gt;热层&lt;/b&gt;中，的确是高度越高温度越高。而热层顶在太阳活动期的温度甚至可以达到2000K（由于&lt;b&gt;热层&lt;/b&gt;的空气稀薄，分子平均自由程极大，这里的&lt;b&gt;温度回归到了热力学的定义&lt;/b&gt;：反应分子平均动能，而不是人体能感觉到的冷热）。&lt;br&gt;3、所以，在&lt;b&gt;平流层&lt;/b&gt;中，不论几何高度如何，不论从平流层底向上升千分之零点零零零零几的天文单位，只要没有超过平流层顶（就像珠穆朗玛峰从对流层底开始算起也没有突破对流层顶），&lt;b&gt;的确是离太阳越近，温度就越高&lt;/b&gt;。&lt;br&gt;所以，从绝对高度入手解释这个现象，是不合理的。&lt;br&gt;附图：大气铅直分层方法与结构&lt;br&gt;&lt;img src="https://pic4.zhimg.com/v2-3e964dcee84d41ea43498845d11de4d3_b.png" alt="preview" class="content_image"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;二、&lt;/b&gt;&lt;br&gt;题主的问题是：&lt;b&gt;珠穆朗玛峰是地球上的最高点，离太阳应该也是最近，可为什么气温却比地面低？&lt;/b&gt;&lt;br&gt;我觉得回答这个问题应该从下面两方面入手，回答这个问题也就是要将下面这两个问题讲清楚。&lt;br&gt;&lt;img src="https://pic1.zhimg.com/v2-1983bec352cfacbb6f82c365d9817cf4_b.png" data-rawwidth="1205" data-rawheight="466" class="origin_image zh-lightbox-thumb" width="1205" data-original="https://pic1.zhimg.com/v2-1983bec352cfacbb6f82c365d9817cf4_r.png"&gt;&lt;br&gt;而我觉得这俩个问题真正可以理解的朋友并不多，所以与其嘲讽题主不如多想想，许多问题的提出与解决都在习以为常的“常识”背后。&lt;br&gt;&lt;br&gt;许多答主都提到了与下面这张图类似的图片（图上数据来源于 IPCC 的2007报告）&lt;br&gt;&lt;img src="https://pic4.zhimg.com/v2-4810b8a28c2bdf101529c7cdc8f71f6f_b.png" data-rawwidth="893" data-rawheight="492" class="origin_image zh-lightbox-thumb" width="893" data-original="https://pic4.zhimg.com/v2-4810b8a28c2bdf101529c7cdc8f71f6f_r.png"&gt;而我觉着，这张图片并不能完整的解释第二个问题，这张图反映了&lt;b&gt;地-气系统的辐射平衡，&lt;/b&gt;从图的最上方可以看出从&lt;b&gt;进入大气上界的太阳的辐射&lt;/b&gt;的值（342），是等于&lt;b&gt;反射太阳辐射（短波部分）&lt;/b&gt;（107）与&lt;b&gt;大气上界出射的长波辐射&lt;/b&gt;（OLR）值（235）的和。可以说这张图是将地-气系统看作了一个整体，反映辐射平衡。退一步来说，这张图里的确有反映大气的情况，但是,也仅仅将大气看做了一个整体，即&lt;b&gt;一层大气&lt;/b&gt;（一层大气辐射相关内容烦请移步&lt;a href="${ctx}/question/39732501/answer/82867737" class="internal"&gt;这个回答&lt;/a&gt;，即一层双面大气+一层单面地面的两层模式）。是没有办法解释大气在不同高度上的温度变化的。&lt;br&gt;所以，这张图片是没有办法回答题主的问题的。&lt;br&gt;&lt;br&gt;以上两点，是我觉得现有答案并不能合理解释问题的原因所在。&lt;br&gt;&lt;br&gt;&lt;b&gt;三、回答&lt;/b&gt;&lt;br&gt;经过以上的分析，我分离出来的两个问题是你中有我，我中有你的关系。所以，我仅需将&lt;b&gt;对流层&lt;/b&gt;和&lt;b&gt;平流层&lt;/b&gt;的温度变化原因解释，就可以说明以上两个问题了。&lt;br&gt;&lt;br&gt;&lt;b&gt;1、基础知识（供参考，关键在黑字）&lt;/b&gt;&lt;br&gt;根据普朗克定律（&lt;a href="//link.zhihu.com/?target=http%3A//baike.baidu.com/link%3Furl%3D9EqC5QvFlzzB8FuUm1pJK9qLd-qOF6pViIxHt9fzXMpQG0ii0LIfOgUkvqFYO3mmkhK0DA8zbzcNUT2KYwxgpK" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;普朗克定律_百度百科&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;）将黑体辐射曲线进行归一化：&lt;br&gt;&lt;img src="//zhihu.com/equation?tex=T%5E%7B-4%7D+%5Cint_%7B-%5Cinfty+%7D%5E%7B%5Cinfty+%7D+%5Clambda+B_%7B%5Clambda%7D%5Cleft%28+T+%5Cright%29+%7B%5Crm+d%7D%5Cleft%28+%7B%5Crm+ln%7D%5Clambda++%5Cright%29+%3D%5Cfrac%7B%5Csigma+%7D%7B%5Cpi+%7D+" alt="T^{-4} \int_{-\infty }^{\infty } \lambda B_{\lambda}\left( T \right) {\rm d}\left( {\rm ln}\lambda  \right) =\frac{\sigma }{\pi } " eeimg="1"&gt;,公式供参考，不影响阅读（从这里也可以看出来曲线下面积与温度无关）。&lt;br&gt;可以求出放出的黑体辐射随&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+ln%7D%5Clambda" alt="{\rm ln}\lambda" eeimg="1"&gt;的变化，根据数值的不同可以得到6000K，300K，250K处的归一化黑体辐射曲线[1]:&lt;br&gt;&lt;img src="https://pic3.zhimg.com/v2-3853749ca6779d054482f4bea288f26a_b.png" data-rawwidth="805" data-rawheight="293" class="origin_image zh-lightbox-thumb" width="805" data-original="https://pic3.zhimg.com/v2-3853749ca6779d054482f4bea288f26a_r.png"&gt;这分别代表着太阳、地表、大气的平均温度。&lt;br&gt;可以看出来约在&lt;b&gt;4 &lt;/b&gt;&lt;b&gt;μm处就可以很好的区分两种辐射&lt;/b&gt;了，根据普朗克定律，温度越高放出的辐射越集中于短波辐射，相应的温度越低，越向长波辐射处偏移。&lt;br&gt;所以，我们常常将&lt;b&gt;太阳发出的辐射称之为短波辐射（能量集中在可见光波段和近红外波段），&lt;/b&gt;而&lt;b&gt;地面和大气放出的辐射称之为长波辐射（能量集中在红外辐射，所以也称热红外辐射）&lt;/b&gt;。&lt;br&gt;&lt;br&gt;而大气中不同的气体成分对长波短波辐射的不同吸收情况以及气体的分布，决定了大气的温度结构。&lt;br&gt;&lt;br&gt;&lt;b&gt;2、吸收辐射的气体&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+H%7D_%7B2%7D+%7B%5Crm+O%7D" alt="{\rm H}_{2} {\rm O}" eeimg="1"&gt;：水汽是105°O-H键张角的三角极性分子。由于转动带和振动带的结合使得水汽的吸收谱十分的复杂。在&lt;b&gt;6.3 μm&lt;/b&gt;处由于&lt;b&gt;扭曲振动&lt;/b&gt;而存在的振动-转动带是&lt;b&gt;最强、最宽的&lt;/b&gt;。其次是由于&lt;b&gt;对称拉伸&lt;/b&gt;和&lt;b&gt;反对称拉伸&lt;/b&gt;在&lt;b&gt;2.7 μm&lt;/b&gt;处也有一个混合吸收区。所以，从上面的分类（4μm为长短分界）可以看出来，水汽既可以吸收太阳短波辐射又可以吸收长波辐射，&lt;b&gt;而且吸收长波辐射区几乎覆盖了整个地-气系统的长波辐射，&lt;/b&gt;这也使得水汽成为了一种&lt;b&gt;重要的温室气体（&lt;/b&gt;然而水汽在大气中的含量短期局地多变，长期全球保持稳定，但如果持续上升可能存在正反馈机制使得水汽含量增加&lt;b&gt;）&lt;/b&gt;。&lt;br&gt;&lt;br&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B2%7D" alt="{\rm O}_{2}" eeimg="1"&gt;:氧气的&lt;b&gt;吸收主要在小于0.26μm的短波辐射&lt;/b&gt;区，&lt;b&gt;0.20-0.26μm&lt;/b&gt;的赫兹堡带，&lt;b&gt;0.175-0.2μm&lt;/b&gt;的舒曼-荣格带，&lt;b&gt;0.13-0.175μm&lt;/b&gt;的舒曼-荣格连续吸收带（最重要的吸收谱）。但由于吸收带主要位于紫外光区，太阳辐射能量很少（上面提到主要在可见光和近红外），所以吸收到的能量并不多。&lt;br&gt;&lt;br&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B3%7D" alt="{\rm O}_{3}" eeimg="1"&gt;的吸收主要在&lt;b&gt;0.2-0.36μm&lt;/b&gt;处的哈金斯带，&lt;b&gt;0.44-1.18μm&lt;/b&gt;有一个微弱的吸收区称为查普斯带。臭氧的吸收&lt;b&gt;主要在短波辐射&lt;/b&gt;，而长波辐射有弱的吸收，所以常说&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B3%7D" alt="{\rm O}_{3}" eeimg="1"&gt;也是一种温室气体。&lt;br&gt;&lt;br&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+C%7D%7B%5Crm+O%7D_%7B2%7D" alt="{\rm C}{\rm O}_{2}" eeimg="1"&gt;：二氧化碳主要的吸收带是在&lt;b&gt;12-18μm&lt;/b&gt;的反对称拉伸振动带，虽然二氧化碳分子还有对称拉伸振动，但由于电荷中心重合，所以没有吸收产生。二氧化碳吸收了长波辐射，使得相关波段的太阳辐射能量在高空就被吸收殆尽，而也会接受大部分的地面短波辐射，所以&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+C%7D%7B%5Crm+O%7D_%7B2%7D" alt="{\rm C}{\rm O}_{2}" eeimg="1"&gt;也是一种重要的温室气体。&lt;br&gt;&lt;br&gt;&lt;b&gt;总结来说：&lt;/b&gt;&lt;br&gt;&lt;b&gt;吸收短波辐射的气体：&lt;/b&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B3%7D" alt="{\rm O}_{3}" eeimg="1"&gt;&lt;b&gt;、&lt;/b&gt;&lt;b&gt;&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+H%7D_%7B2%7D+%7B%5Crm+O%7D" alt="{\rm H}_{2} {\rm O}" eeimg="1"&gt;（比长波吸收弱）、&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B2%7D" alt="{\rm O}_{2}" eeimg="1"&gt;&lt;/b&gt;&lt;b&gt;（吸收能量很少）&lt;/b&gt;&lt;br&gt;&lt;b&gt;吸收长波辐射的气体：&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+H%7D_%7B2%7D+%7B%5Crm+O%7D" alt="{\rm H}_{2} {\rm O}" eeimg="1"&gt;、&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+C%7D%7B%5Crm+O%7D_%7B2%7D" alt="{\rm C}{\rm O}_{2}" eeimg="1"&gt;、&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+O%7D_%7B3%7D" alt="{\rm O}_{3}" eeimg="1"&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;3、对流层大气与平流层大气&lt;br&gt;在对流层大气中，到达地面的短波辐射能量主要被地面吸收，大气吸收仅占一部分（第二张图IPCC那张图，地面吸收168，大气吸收67），所以&lt;b&gt;热源是地面&lt;/b&gt;，地面放出了&lt;b&gt;红外辐射&lt;/b&gt;，而水汽、&lt;img src="//zhihu.com/equation?tex=%7B%5Crm+C%7D%7B%5Crm+O%7D_%7B2%7D" alt="{\rm C}{\rm O}_{2}" eeimg="1"&gt;将红外辐射吸收是上层大气冷却的主因（红外冷却），越向上红外辐射的能量被吸收的越多，剩下的热辐射也就越少，所以越靠近的地面的气层温度越高。&lt;br&gt;&lt;br&gt;在平流层大气中，由于臭氧层与整个平流层相重合（最开始的大气分层图），所以平流层的热源主要是&lt;b&gt;臭氧吸收的太阳短波辐射&lt;/b&gt;。&lt;b&gt;离太阳越近，温度越高&lt;/b&gt;。&lt;br&gt;&lt;br&gt;&lt;b&gt;四、最后&lt;/b&gt;&lt;br&gt;所以，回到题主的问题，从上面的解释来看，我们可以这么说：&lt;b&gt;珠穆朗玛峰峰顶离太阳近却比地面温度低，那是因为它还不够高，或者说是由于臭氧层的高度太高&lt;/b&gt;。&lt;br&gt;换句话来说，&lt;b&gt;由于珠峰在对流层内，对流层内的大气吸收的主要是来自地面的长波辐射，越向高处热辐射能越少&lt;/b&gt;，&lt;b&gt;所以珠峰峰顶比地面温度要低&lt;/b&gt;。&lt;br&gt;如果臭氧层的高度降低，甚至贴近地面，或者氧气可以大量吸收短波辐射。那么对流层和平流层的位置将会倒转，那时候的地球又是另一幅模样了。&lt;br&gt;&lt;br&gt;通常大众听到的原因是 对流层的热源是地面，越靠近地面温度越高。 &lt;br&gt;这也是许多人觉得这是常识的原因，殊不知常识的背后的原因是复杂和深远的，甚至为常识加上一句话，都要耗费很多的纸张去阐明背后的机理。&lt;br&gt;&lt;br&gt;[1] 《大气物理（热力学与辐射部分）》&lt;br&gt;--&lt;br&gt;在折叠区嘲讽题主的朋友：&lt;br&gt;&lt;a href="https://zhuanlan.zhihu.com/p/22230670" class="internal"&gt;这篇文章&lt;/a&gt;&lt;br&gt;共勉</textarea>


                                    <div class="zh-summary summary clearfix">
                                        <img src="https://pic1.zhimg.com/v2-1983bec352cfacbb6f82c365d9817cf4_200x112.png"
                                             data-rawwidth="1205" data-rawheight="466"
                                             class="origin_image inline-img zh-lightbox-thumb"
                                             data-original="https://pic1.zhimg.com/v2-1983bec352cfacbb6f82c365d9817cf4_r.png">
                                        <b>珠穆朗玛峰峰顶离太阳近却比地面温度低，那是因为它还不够高，或者说是由于臭氧层的高度太高。</b> <b>一、</b>
                                        高票答案的主要的关注点都在“几何高度”、“日地距离”等绝对高度，但是我觉得，这是不太合理的。 以下是理由： 1、高度越高温度越低在<b>对流层</b>以及<b>中层大气</b>…

                                        <a href="${ctx}/question/51160183/answer/142163384"
                                           class="toggle-expand">显示全部</a>

                                    </div>


                                    <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                                   data-tooltip="s$t$发布于 昨天 23:46" target="_blank"
                                                                   href="${ctx}/question/51160183/answer/142163384">编辑于
                                        12:41</a></p>

                                </div>
                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                    <div class="zm-meta-panel">

                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                           href="javascript:;" id="sfb-12681596"><i class="z-icon-follow"></i>关注问题</a>

                                        <a href="${ctx}/explore#" name="addcomment"
                                           class="meta-item toggle-comment js-toggleCommentBox">
                                            <i class="z-icon-comment"></i>33 条评论</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-thank"
                                           data-thanked="false"><i class="z-icon-thank"></i>感谢</a>


                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                           role="button" aria-expanded="false" style="-webkit-user-select: none;"
                                           tabindex="0" aria-haspopup="true">
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

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                        <span class="zg-bull zu-autohide">•</span>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                        <span class="zg-bull zu-autohide">•</span>
                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-report">举报</a>


                                        <meta name="copyrightStatus" content="2">
                                        <meta name="disableCopyAvatar"
                                              content="https://pic2.zhimg.com/41df2ab82582eb632b355400b448b975_s.jpg">

                                        <span class="zg-bull">•</span>


                                        <a href="${ctx}/copyright/apply?answer=142163384" target="_blank"
                                           class="meta-item copyright">申请转载</a>


                                        <button class="meta-item item-collapse js-collapse">
                                            <i class="z-icon-fold"></i>收起
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="explore-feed feed-item" data-offset="2" data-za-module="AnswerItem">
                            <h2><a class="question_link" href="${ctx}/question/54897857/answer/142196531"
                                   target="_blank" data-id="14179270" data-za-element-name="Title">
                                你读过最美的告白的句子是什么？
                            </a></h2>
                            <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                                 data-aid="52407779" data-atoken="142196531" data-collapsed="0"
                                 data-created="1485047179" data-deleted="0" data-isowner="0" data-helpful="1"
                                 data-copyable="1">
                                <link itemprop="url" href="${ctx}/question/54897857/answer/142196531">
                                <meta itemprop="answer-id" content="52407779">
                                <meta itemprop="answer-url-token" content="142196531">
                                <a class="zg-anchor-hidden" name="answer-52407779"></a>

                                <div class="zm-item-vote">
                                    <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                       data-bind-votecount="">1385</a>
                                </div>

                                <div class="zm-votebar" data-za-module="VoteBar">
                                    <button class="up" aria-pressed="false" title="赞同">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">1385</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </div>


                                <div class="answer-head">

                                    <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$seasee-youl" target="_blank" href="${ctx}/people/seasee-youl">Seasee Youl</a></span><span
        title="为何中意我我这种无赖 是话你蠢还是很伟大" class="bio">
为何中意我我这种无赖 是话你蠢还是很伟大
</span>
</span>
                                    </div>

                                    <div class="zm-item-vote-info" data-votecount="1385" data-za-module="VoteInfo">


                                        <span class="voters text"><a href="${ctx}/explore#"
                                                                     class="more text"><span
                                                class="js-voteCount">1385</span>&nbsp;人赞同</a></span>


                                    </div>
                                </div>
                                <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="14179270"
                                     data-action="/answer/content" data-author-name="Seasee Youl"
                                     data-entry-url="/question/54897857/answer/142196531">

                                    <textarea hidden="" class="content">&lt;p&gt;&lt;b&gt;“他们觉得爱就是性，是婚姻，是清晨六点的吻和一堆孩子，或许爱就是那样。但你知道我怎么想吗？我觉得爱是想要触碰却又缩回了手”&lt;/b&gt;&lt;/p&gt;&lt;p&gt;五年前，我一无所有，只有对一个姑娘执着的暗恋。&lt;/p&gt;&lt;p&gt;当时她漂亮温柔可爱，家境优越，追求者数之不尽。我却在一个没有正经办公地点的公司上班，一个月拿两千二百块钱工资。&lt;/p&gt;&lt;p&gt;刨去衣食住行，我可用的钱不足三位数。&lt;/p&gt;&lt;p&gt;别说告白了，我连请那姑娘看场电影的钱都拿不出来。我唯一能做的，是每个周五在她公司门口等待，六点十分的时候她会准时出现在门口，带着可爱的笑容慢慢离去。为了这一眼，我要坐一个小时的公交车，在寒风中孤独的等待，忍受着楼下保安的白眼。当她出现的时候，我觉得这一切都很值得。&lt;/p&gt;&lt;p&gt;虽然只是一眼，我觉得就够了。&lt;/p&gt;&lt;p&gt;就这么过去了半年，从寒冬变成了盛夏，她的装扮从羽绒服变成了白裙子，温婉的长发也剪成了清爽的短发。这半年来，也许我对于她来说，只是一个陌生人，但她对于我来说，是陪伴了我很长时间的人，让我每个星期都有所期待。&lt;/p&gt;&lt;p&gt;有一次她抱着一大堆文件从公司出来，那天的风特别大，纸被吹散了一地。她惊叫了一声连忙弯腰捡东西，有几张纸飘到了马路上，我快步跑过去捡了起来，轻轻的递给了她。她冲我笑笑，让我觉得天空明亮。&lt;/p&gt;&lt;p&gt;“谢谢。”&lt;/p&gt;&lt;p&gt;“不用。”&lt;/p&gt;&lt;p&gt;她用大眼睛直直的看着我，然后问：“我好像经常看见你，是在等女朋友吗？”&lt;/p&gt;&lt;p&gt;我压抑住剧烈的心跳，苦笑一声说：“算是吧。”&lt;/p&gt;&lt;p&gt;她吐吐舌头，夸我真是个好男人，然后把东西抱紧慢慢走远。那一天回家时我一路狂奔，感觉整个世界都不一样了，我突然后悔，如果那一刻我开口告白，说不定就成功了。那天晚上我的大脑无比兴奋，像放电影一样闪烁着她的笑容。凌晨三点，我仍然睡意全无，我起床拿起笔想给她写一封信。&lt;/p&gt;&lt;p&gt;我花尽了所有心思，穷尽了所有文采，一次又一次的把纸揉碎，终于在天亮的时候写出一封满意的情书。&lt;/p&gt;&lt;p&gt;我相信每一个看过这封情书的姑娘都会潸然泪下，被我的执着和真情所感动。&lt;/p&gt;&lt;p&gt;但我怎么也没能想到，这封信却没能寄出去。&lt;/p&gt;&lt;p&gt;&lt;b&gt;“喜欢一个人，就要做一些自己不喜欢的事。”&lt;/b&gt;&lt;/p&gt;&lt;p&gt;我天生不爱受约束，向往的都是自由自在和高飞远走，未曾想到有朝一日，只是为了涨几百块钱工资，居然可以不要脸的拍上司马屁，甚至会和竞争者勾心斗角，想方设法的绊别人一跤。我觉得自己变了，变得下作和恶心。&lt;/p&gt;&lt;p&gt;我还是会每个星期去楼下等她，总是在口袋里抓着那封信，我在心里发誓，下一次她和我说话的时候，我就把信交给她。&lt;/p&gt;&lt;p&gt;可是她没有，大部分时间她都是匆匆而过，有时候看到我了冲我点点头，没有交谈的意思。&lt;/p&gt;&lt;p&gt;我经常对着镜子审视自己，长得平淡无常的样子，穿着普通个性一般，放在人堆里基本找不出来。眼睛里还有稚气，眼角却长了细纹，这样的人，有时候资格拥有那么美好的姑娘？&lt;/p&gt;&lt;p&gt;我开始努力工作，加班加点的做项目，同事们都觉得我有毛病，这样一个皮包公司大家都是混日子来的，拼给谁看啊？老板觉得我还不错，承诺只要我卖一个项目出去，就让我当主管，工资涨到四千多。&lt;/p&gt;&lt;p&gt;我到处推销，没事就在同学群里面找人帮忙，逢人就述说自己的“伟大”事业，不知道的人还以为我进了传销组织呢。黄天不负苦心人，我一个高中同学的叔叔刚好有这方面的业务需求，就和我签了合同。&lt;/p&gt;&lt;p&gt;回到公司后，老板激动的开了一个会，表扬我整整十分钟，老板叉着腰像个国家领导人：“你们看看，看看，全公司上下只有小刘一个人在尽心工作。我都不知道每天八个小时你们在忙什么，到现在公司还是入不敷出，我都亏了几十万了，现在我想清楚了，都是我的管理不善。从今天开始，小刘就是公司的主管，大家好好跟他学习学习。”&lt;/p&gt;&lt;p&gt;同事们稀稀落落的鼓了掌，阴阳怪气的看着我。&lt;/p&gt;&lt;p&gt;我站起来鞠了一躬，什么话也没说。&lt;/p&gt;&lt;p&gt;我知道那个时候的自己很恶心，但没办法，喜欢一个人，就要做一些自己不喜欢的事。&lt;/p&gt;&lt;p&gt;那一天下午我第一次没坐公交车，搭上的士去了她楼下，我对自己说，今天一定要和她告白。&lt;/p&gt;&lt;p&gt;六点十分，她从公司出来了，旁边还有两个叽叽喳喳的小姑娘。我怀着剧烈的心跳走上前想和她说话，却怎么也没勇气开口。&lt;/p&gt;&lt;p&gt;擦身而过的时候，她好像对我笑了笑，又好像没有。我只知道，我揣在口袋的信被我手上的汗浸湿透了。&lt;/p&gt;&lt;p&gt;&lt;b&gt;“当你真正爱一个人的时候，第一感觉就是自卑。”&lt;/b&gt;&lt;/p&gt;&lt;p&gt;真正当上了主管，才发现这个小公司是多么的无可救药。老板在的时候还能做到准时上班，只要老板没来，请假的请假翘班的翘班，有几个哥们还在上班时联机打游戏，不知道的人走进来，还以为咱们这是网吧呢。&lt;/p&gt;&lt;p&gt;我觉得风气必须要整，所以召集同事开了一个会，颁布了几条纪律要求和奖惩制度。比如上班迟到扣二十，打游戏被发现一次扣五十，请假必须得到签字批准等，其实这些都是其它公司最基本的制度，在这个公司却引起了众怒。有个胖子站起来说：“知道您新官上任三把火，别拿我们开刀啊”&lt;/p&gt;&lt;p&gt;我笑了笑说：“我对事不对人”&lt;/p&gt;&lt;p&gt;胖子挑衅的说：“我记得你以前也经常早退吧，现在升了官了，就把狐狸尾巴收起来啦？”&lt;/p&gt;&lt;p&gt;我说：“以前的事大家都别追究，反正以后这就是公司的规章制度。如果我做不到，也一样扣工资，请大家多多监督我”&lt;/p&gt;&lt;p&gt;胖子瞪了我一眼，被其它同事拉着走了。&lt;/p&gt;&lt;p&gt;此后我在公司人缘很差，我知道背后他们都在说我的坏话，骂我是老板的走狗。不管怎么样，整顿了纪律之后，公司的业绩开始有了提升，第二个月又开出去几单，老板心情大好发了我五千块，给了我一间独立的办公室。手下的同事却没涨工资，我向老板申请了一次，老板却没给回复。&lt;/p&gt;&lt;p&gt;有一次吃完午饭，我听到他们在小房间里议论我，说话声音最大的就是那个胖子，他非常激动唾沫星子飞溅：“就那傻逼能当主管，还不是天天拍老板的马屁？我们天天累死累活，就好了他一人。”&lt;/p&gt;&lt;p&gt;大家纷纷附和，我面色一红，笑了笑准备走远。&lt;/p&gt;&lt;p&gt;谁知道那胖子接着说：“他还癞蛤蟆想吃天鹅肉，看上了富家女却不敢跟人家说，还学人家写情书呢，我都看见好几次了。上次在他办公室抽屉里，我还看到了一个假戒指，真是个傻逼，还幻想着自己是个情圣呢……”&lt;/p&gt;&lt;p&gt;大家一阵哄笑，我一脚把门踹开，几个女的发出尖叫，我抄起旁边的烟灰缸就往胖子脸上砸，他被砸的满头是血，却大叫着要还手。几个被我发现打游戏后扣了钱的男同事纷纷劝架，我的手和脚都被拉住，胖子一脚踹在我的肚子上，扑上来给了我几拳。&lt;/p&gt;&lt;p&gt;我不知道哪里来的力气，居然突然就挣脱了，迎头撞在那胖子的脑袋上，我满眼金星，胖子翻了个白眼倒在地上抽搐。&lt;/p&gt;&lt;p&gt;本来以为这个月拿工资多可以潇洒点，却赔了三千多块医药费。第二天，我鼻青脸肿的站在她楼下，我一定要告白。&lt;/p&gt;&lt;p&gt;就算她拒绝了我，也没有关系。&lt;/p&gt;&lt;p&gt;六点十分，她从里面出来了，我拦在她身前，她认出我来说：“你脸怎么啦？和别人打架了么？”&lt;/p&gt;&lt;p&gt;怦，怦，怦。&lt;/p&gt;&lt;p&gt;满世界都是我心跳的声音，就像雷声一样轰轰隆隆。&lt;/p&gt;&lt;p&gt;我挤出微笑：“我没事，今天我来这里就是想告诉你，我……”&lt;/p&gt;&lt;p&gt;旁边汽车按了下喇叭，我们的谈话被打断，那姑娘从那边挥了挥手。从车里出来一个男人，穿的一身名牌，带着二十几万的手表，笑着过来问她：“今晚去哪儿吃饭？”&lt;/p&gt;&lt;p&gt;她挽住那男人的手臂：“不知道，要不我们回家做吧，外面的饭菜毕竟没有家里的有营养。”&lt;/p&gt;&lt;p&gt;男人笑笑：“行，我就吃吃你的黑暗料理吧。”&lt;/p&gt;&lt;p&gt;怦，怦，叮。&lt;/p&gt;&lt;p&gt;我的心跳慢下来了，我低下头，她却想起来我们的谈话，瞪大眼睛问我：“你刚刚说什么？你来这儿干什么？”&lt;/p&gt;&lt;p&gt;我笑了笑，说：“没什么”&lt;/p&gt;&lt;p&gt;那一刻，我明白了一个道理，在电影里很唯美的暗恋，在生活里却会变成可笑的自作多情。可是很难过的是，我居然还在祈祷，祈祷我留给她的最后一个笑容，能让她记得我多一些时间。&lt;/p&gt;&lt;p&gt;&lt;b&gt;“想要被人中意，请先变得了不起”&lt;/b&gt;&lt;/p&gt;&lt;p&gt;我辞去了工作，没有理会老板的苦苦挽留。在一个没有希望的公司，不可能做出什么轰动的成绩。&lt;/p&gt;&lt;p&gt;我准备去远方的城市，那里有更多机遇，或许能让我展翅高飞。&lt;/p&gt;&lt;p&gt;临行前一晚，我所有的朋友都来送我，我们喝的大醉，在吐过三次之后，我突然很想倾诉。我从口袋里掏出那封信，展开那张皱巴巴的纸，用沙哑低沉的声音一字一句的念着，刚开始大家还在取消我，到了后来，整个房间无比安静，只听到我一个人孤独的抒情。当我念完最后一个字的时候，他们都站起来为我鼓掌，有两个姑娘满眼含泪，其中一个扑上来亲了我一口，说早知道我这么深情当初就和我好了。&lt;/p&gt;&lt;p&gt;良子给我倒满一杯酒：“真没想到，你还是一个情圣呢”&lt;/p&gt;&lt;p&gt;旁边一个哥们感慨：“就是少了点运气”&lt;/p&gt;&lt;p&gt;是这样的吗？&lt;/p&gt;&lt;p&gt;如果我早点鼓起勇气告白，结果就会有变化吗？&lt;/p&gt;&lt;p&gt;我觉得不是这样，我和她之间的差距太大了，单凭“一往情深”是不可能逆转的。&lt;/p&gt;&lt;p&gt;凌晨三点我坐上了南下的火车，火车启动的时候，我觉得自己好像成长了。&lt;/p&gt;&lt;p&gt;想要被人中意，就先变得了不起。&lt;/p&gt;&lt;p&gt;我做着各式各样的工作，只要有新东西可以学就努力学。业余时间也不荒废，把每一项爱好都变成特长。慢慢的，我有了一份不错的事业，平时去外面玩，弹弹吉他踢踢球，很容易成为人群里的焦点。&lt;/p&gt;&lt;p&gt;我偶尔在镜子里扫一眼自己，眼睛里面失去了稚气，面容变得沉稳而冷静。&lt;/p&gt;&lt;p&gt;有一次回到家乡，又在熟悉的街道看到了她。她还是那么漂亮温婉，走进了一家咖啡店。我默默的跟了进去，坐在她的不远处。&lt;/p&gt;&lt;p&gt;她点了杯卡布奇洛，然后拿出一本书看了几分钟，注意到我一直在看她，脸色有点不自然，拿上包准备要走了。我却坐到了她对面，对她笑了笑。&lt;/p&gt;&lt;p&gt;“我们认识吗？”&lt;/p&gt;&lt;p&gt;“不认识，但你手上拿的书是我写的”&lt;/p&gt;&lt;p&gt;她捂住了嘴巴，满脸的不可思议，可爱的发出赞叹：“天呐，你不会在骗我吧”&lt;/p&gt;&lt;p&gt;她不会想到，能够和她这样轻松的聊一次天，我付出了怎样的努力。&lt;/p&gt;&lt;p&gt;我拿出身份证笑着说假一赔十，她蹦蹦跳跳的拿出笔找我要签名。&lt;/p&gt;&lt;p&gt;不管怎么样，在这个阳光明媚的午后，青春的聚散离合都有了存在的意义。&lt;/p&gt;&lt;p&gt;前几天从公司里出来，我注意到一个戴眼镜的小女孩一直偷偷瞄我，发现我的眼光后连忙扭过头。她右手插在布包里，整个人看起来有点紧张。&lt;/p&gt;&lt;p&gt;我好像经常能看到她，总是沉默的站在转角处。&lt;/p&gt;&lt;p&gt;她局促的样子真的很像一个人，不是吗？&lt;/p&gt;&lt;p&gt;我慢慢的走到她面前，笑着问她：“你在等人吗？”&lt;/p&gt;&lt;p&gt;她的脸红透了，咬了咬嘴唇，然后从包里拿出一个小盒子递给我，轻声说：“你可能不认识我，但是我认识你。我今天来是想告诉你……”&lt;/p&gt;&lt;p&gt;怦，怦，怦。&lt;/p&gt;&lt;p&gt;起风了，我不止一次的幻想，时光带走的东西，到底是什么模样？&lt;/p&gt;</textarea>


                                    <div class="zh-summary summary clearfix">

                                        <b>“他们觉得爱就是性，是婚姻，是清晨六点的吻和一堆孩子，或许爱就是那样。但你知道我怎么想吗？我觉得爱是想要触碰却又缩回了手”</b>五年前，我一无所有，只有对一个姑娘执着的暗恋。当时她漂亮温柔可爱，家境优越，追求者数之不尽。我却在一个没有正经办公地…

                                        <a href="${ctx}/question/54897857/answer/142196531"
                                           class="toggle-expand">显示全部</a>

                                    </div>


                                    <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                                   target="_blank"
                                                                   href="${ctx}/question/54897857/answer/142196531">发布于
                                        09:06</a></p>

                                </div>
                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                    <div class="zm-meta-panel">

                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                           href="javascript:;" id="sfb-14179270"><i class="z-icon-follow"></i>关注问题</a>

                                        <a href="${ctx}/explore#" name="addcomment"
                                           class="meta-item toggle-comment js-toggleCommentBox">
                                            <i class="z-icon-comment"></i>217 条评论</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-thank"
                                           data-thanked="false"><i class="z-icon-thank"></i>感谢</a>


                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                           role="button" aria-expanded="false" style="-webkit-user-select: none;"
                                           tabindex="0" aria-haspopup="true">
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

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                        <span class="zg-bull zu-autohide">•</span>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                        <span class="zg-bull zu-autohide">•</span>
                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-report">举报</a>


                                        <meta name="copyrightStatus" content="2">
                                        <meta name="disableCopyAvatar"
                                              content="https://pic4.zhimg.com/4decd6a9aceae904b438aabb031f282b_s.jpg">

                                        <span class="zg-bull">•</span>


                                        <a href="${ctx}/copyright/apply?answer=142196531" target="_blank"
                                           class="meta-item copyright">申请转载</a>


                                        <button class="meta-item item-collapse js-collapse">
                                            <i class="z-icon-fold"></i>收起
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                </div>
                <div class="tab-panel" style="display: none;">
                    <div data-type="monthly">
                        <div class="explore-feed feed-item" data-offset="1">
                            <h2><a class="question_link" href="${ctx}/question/53907461/answer/137093193"
                                   target="_blank" data-id="13782913" data-za-element-name="Title">
                                如何评价上戏王若芃在拍戏过程中损坏房东房间的行为？
                            </a></h2>
                            <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                                 data-aid="50361399" data-atoken="137093193" data-collapsed="0"
                                 data-created="1482381835" data-deleted="0" data-isowner="0" data-helpful="1"
                                 data-copyable="1">
                                <link itemprop="url" href="${ctx}/question/53907461/answer/137093193">
                                <meta itemprop="answer-id" content="50361399">
                                <meta itemprop="answer-url-token" content="137093193">
                                <a class="zg-anchor-hidden" name="answer-50361399"></a>

                                <div class="zm-item-vote">
                                    <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                       data-bind-votecount="">6278</a>
                                </div>

                                <div class="zm-votebar">
                                    <button class="up ">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">6278</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down ">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对</span>
                                    </button>
                                </div>


                                <div class="answer-head">

                                    <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$wang-yu-yan-79-23" target="_blank"
   href="${ctx}/people/wang-yu-yan-79-23">语嫣Victoria</a></span><span title="水榭听香，指点群豪。" class="bio">
水榭听香，指点群豪。
</span>
</span>
                                    </div>

                                    <div class="zm-item-vote-info" data-votecount="6278">


                                        <span class="voters text"><a href="${ctx}/explore#"
                                                                     class="more text"><span
                                                class="js-voteCount">6278</span>&nbsp;人赞同</a></span>


                                    </div>
                                </div>
                                <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="13782913"
                                     data-action="/answer/content" data-author-name="语嫣Victoria"
                                     data-entry-url="/question/53907461/answer/137093193">

                                    <textarea hidden="" class="content">有的回答里说不要上升到学校，怎么能不上升到学校，不仅要上升到学校，还要上升到教育。&lt;br&gt;租借房屋承诺不使用卧室之后，不仅违约使用，还将整个屋子糟践的一片狼籍。这种行为可见这群学生不仅毫无守约意识，也缺乏对他人起码的尊重。&lt;br&gt;既无知，又无德。&lt;br&gt;为什么说这种无知无德的行为要上升到学校，因为这不是单纯的个人行为，屋主说过，当天她看到的就有30多人，一个人无耻地搞破坏还耍赖是个人问题，一大群人一起搞破坏还耍赖，就是教育出了问题。&lt;br&gt;当然不是30个人就代表了上戏。此事一出，上戏学生也纷纷声援，闹起来是这样的&lt;br&gt;&lt;img data-rawwidth="720" data-rawheight="1280" src="https://pic1.zhimg.com/v2-05dc2651bbec3a6545295bd465948e4c_b.png" class="origin_image zh-lightbox-thumb" width="720" data-original="https://pic1.zhimg.com/v2-05dc2651bbec3a6545295bd465948e4c_r.png"&gt;&lt;br&gt;无知无德之外，是在自私自利中夹带着没有逻辑的愚蠢。&lt;br&gt;别人和你谈伤害，你去大声扯梦想。总结这个逻辑就是：我的梦想高于一切，损害你你必须忍着，我可以糟蹋你的房子，你曝光就是你的不对了。&lt;br&gt;今天你可以为了梦想破坏房屋，明天是不是可以去杀人？&lt;br&gt;再说这位声援者，不但不反思同学的行为，反而将声讨群众的照片挨个挂出来，这种下作事，无法想象是一个女大学生做出的。而事件主角们呢？并未赔偿反思，躲的躲藏的藏，屋主还反映有人买了水军去围攻她。&lt;br&gt;但是做出这些事情的，也不过是群二十出头的学生。洗白的人也反复提及，他们只是孩子。&lt;br&gt;先不说二十多岁算不算孩子，就算一群孩子为什么会变成这样？我也是学生，我的学校教我诚信做人，知错就改，不把自己的梦想建立在损害他人之上，这不是最基本的教育么？&lt;br&gt;再来看上戏校宣的回应。&lt;br&gt;&lt;img data-rawwidth="640" data-rawheight="1136" src="https://pic2.zhimg.com/v2-f6360dbb4b9c84630384b38218464eed_b.jpg" class="origin_image zh-lightbox-thumb" width="640" data-original="https://pic2.zhimg.com/v2-f6360dbb4b9c84630384b38218464eed_r.jpg"&gt;&lt;br&gt;&lt;br&gt;“无辜的孩子”“不予狗同”“诽言止于智者”。你的狗和智者我压根不想谈，只看看无辜的孩子真的无辜吗？&lt;br&gt;&lt;img data-rawwidth="640" data-rawheight="1137" src="https://pic4.zhimg.com/v2-3a057cc48b40cd6b638851079767217b_b.jpg" class="origin_image zh-lightbox-thumb" width="640" data-original="https://pic4.zhimg.com/v2-3a057cc48b40cd6b638851079767217b_r.jpg"&gt;&lt;br&gt;&lt;br&gt;现在你还诧异为什么这群学生会这样吗？现在你还觉得和学校没关系，和教育没关系吗？&lt;br&gt;这些戏剧学院也是明星走出来的地方。教育如此，一些明星被曝出无素质无底线的行为，也不足为奇了。&lt;br&gt;&lt;br&gt;希望即便是艺术院校，也能关注学生的品德而非放任自流，希望每一个称作“学校”的，都能尽到教书育人的义务，先教会学生做人，而不是一味不分是非地袒护。&lt;br&gt;毕竟一个学校走出来的学生，一言一行，都代表着学校本身不是么。</textarea>


                                    <div class="zh-summary summary clearfix">
                                        <img data-rawwidth="720" data-rawheight="1280"
                                             src="https://pic1.zhimg.com/v2-05dc2651bbec3a6545295bd465948e4c_200x112.png"
                                             class="origin_image inline-img zh-lightbox-thumb"
                                             data-original="https://pic1.zhimg.com/v2-05dc2651bbec3a6545295bd465948e4c_r.png">
                                        有的回答里说不要上升到学校，怎么能不上升到学校，不仅要上升到学校，还要上升到教育。
                                        租借房屋承诺不使用卧室之后，不仅违约使用，还将整个屋子糟践的一片狼籍。这种行为可见这群学生不仅毫无守约意识，也缺乏对他人起码的尊重。 既无知，又无德。 为什…

                                        <a href="${ctx}/question/53907461/answer/137093193"
                                           class="toggle-expand">显示全部</a>

                                    </div>


                                    <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                                   data-tooltip="s$t$发布于 2016-12-22" target="_blank"
                                                                   href="${ctx}/question/53907461/answer/137093193">编辑于
                                        2016-12-26</a></p>

                                </div>
                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                    <div class="zm-meta-panel">

                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                           href="javascript:;" id="sfb-13782913"><i class="z-icon-follow"></i>关注问题</a>

                                        <a href="${ctx}/explore#" name="addcomment"
                                           class="meta-item toggle-comment js-toggleCommentBox">
                                            <i class="z-icon-comment"></i>536 条评论</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-thank"
                                           data-thanked="false"><i class="z-icon-thank"></i>感谢</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-share"><i
                                                class="z-icon-share"></i>分享</a>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                        <span class="zg-bull zu-autohide">•</span>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                        <span class="zg-bull zu-autohide">•</span>
                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-report">举报</a>


                                        <meta name="copyrightStatus" content="0">
                                        <meta name="disableCopyAvatar"
                                              content="https://pic2.zhimg.com/acf3b4cedab633e1e325aeff9b4a811d_s.jpg">

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
                        <div class="explore-feed feed-item" data-offset="2">
                            <h2><a class="question_link" href="${ctx}/question/20593205/answer/137070705"
                                   target="_blank" data-id="417704" data-za-element-name="Title">
                                跑步的时候为什么会岔气？
                            </a></h2>
                            <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                                 data-aid="50352346" data-atoken="137070705" data-collapsed="0"
                                 data-created="1482373816" data-deleted="0" data-isowner="0" data-helpful="1"
                                 data-copyable="1">
                                <link itemprop="url" href="${ctx}/question/20593205/answer/137070705">
                                <meta itemprop="answer-id" content="50352346">
                                <meta itemprop="answer-url-token" content="137070705">
                                <a class="zg-anchor-hidden" name="answer-50352346"></a>

                                <div class="zm-item-vote">
                                    <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                       data-bind-votecount="">3826</a>
                                </div>

                                <div class="zm-votebar">
                                    <button class="up ">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">3826</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down ">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对</span>
                                    </button>
                                </div>


                                <div class="answer-head">

                                    <div class="zm-item-answer-author-info">

<span class="summary-wrapper">
<span class="author-link-line">

<a class="author-link" data-hovercard="p$t$ding-xiang-yi-sheng" target="_blank"
   href="${ctx}/org/ding-xiang-yi-sheng">丁香医生</a><span class="OrgIcon sprite-global-icon-org-14"
                                                                      data-tooltip="s$b$已认证的机构"></span></span><span
        title="身体上的问题，来问丁香医生" class="bio">
身体上的问题，来问丁香医生
</span>
</span>
                                    </div>

                                    <div class="zm-item-vote-info" data-votecount="3826">


<span class="answer-tag">
<span class="text">收录于 </span>


<span class="text">编辑推荐</span>



</span>


                                        <span class="zg-bull text">•</span><span class="voters text"><a
                                            href="${ctx}/explore#" class="more text"><span
                                            class="js-voteCount">3826</span>&nbsp;人赞同</a></span>


                                    </div>
                                </div>
                                <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="417704"
                                     data-action="/answer/content" data-author-name="丁香医生"
                                     data-entry-url="/question/20593205/answer/137070705">

                                    <textarea hidden="" class="content">对于跑步岔气的问题，丁香医生来给你打个比喻：&lt;br&gt;&lt;br&gt;周五的晚上，你正在吃着火锅唱着歌准备过周末时，突然老板一个电话，丢给你一堆工作让你周一前做完给他，你第一反应是怎么样？&lt;br&gt;&lt;img src="https://pic4.zhimg.com/v2-daf5275109fa2f0b9eff9f0d44054fb3_b.jpg" data-rawwidth="1204" data-rawheight="708" class="origin_image zh-lightbox-thumb" width="1204" data-original="https://pic4.zhimg.com/v2-daf5275109fa2f0b9eff9f0d44054fb3_r.jpg"&gt;&lt;p&gt;心烦意乱情绪低落浑身不适，因为你完全没有做好应对工作的准备，身体处于极其消极懈怠的状态。&lt;/p&gt;&lt;br&gt;&lt;p&gt;同理，&lt;b&gt;跑步岔气也是内脏器官「&lt;/b&gt;&lt;b&gt;消极懈怠」应对突然剧烈运动的结果。&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;在没有热身的情况下突然进行跑步等高强度运动，身体上和运动相关的脏器会立刻被要求运动起来。&lt;/p&gt;&lt;br&gt;&lt;p&gt;但是有的脏器还处在平静的状态中，没能立刻适应，对这种运动命令：&lt;/p&gt;&lt;img src="https://pic2.zhimg.com/v2-9550c9e11cf6ccdb9cd01f38ce151941_b.jpg" data-rawwidth="506" data-rawheight="298" class="origin_image zh-lightbox-thumb" width="506" data-original="https://pic2.zhimg.com/v2-9550c9e11cf6ccdb9cd01f38ce151941_r.jpg"&gt;&lt;p&gt;于是这些脏器会「偷懒」不跟着身体运动。&lt;/p&gt;&lt;br&gt;&lt;p&gt;然而人在跑步时，往往会伴随呼吸加深加快、肺部舒张的频率和深度加大，心率加快等情况。&lt;/p&gt;&lt;br&gt;&lt;p&gt;正在「偷懒」的呼吸肌在这样突然的刺激下，一时无法适应，出现了缺氧、运动不协调等状况。&lt;/p&gt;&lt;p&gt;这便造成了「呼吸肌痉挛」，进而带来了身体的疼痛。&lt;/p&gt;&lt;br&gt;&lt;p&gt;所以跑步时岔气，不是因为体内的真气冲破任督二脉，也不是因为气沉丹田错了位置，更不是因为跑步时把内脏颠坏。&lt;/p&gt;&lt;br&gt;&lt;p&gt;只是因为脏器在这个时候比较「懒」，没有适应身体的变化。&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;而这种内脏器官暂时「犯懒」的表现，就是跑步中出现岔气疼痛的原因。&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;于是乎，岔气的原因再次证明了一个颠扑不破的真理：&lt;/p&gt;&lt;img src="https://pic4.zhimg.com/v2-15d2bfccb108328ed3b3e26cded7496f_b.jpg" data-rawwidth="860" data-rawheight="506" class="origin_image zh-lightbox-thumb" width="860" data-original="https://pic4.zhimg.com/v2-15d2bfccb108328ed3b3e26cded7496f_r.jpg"&gt;&lt;p&gt;就算身体不懒，内脏也会主动「懒」给你看。&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;那么该如何避免岔气呢？&lt;/b&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;因为跑步岔气的原因大部分和运动前热身不充分有关。&lt;/p&gt;&lt;br&gt;&lt;p&gt;因此，在每次运动前，应做 5～10 分钟的准备活动，充分活动大肌肉群和主要关节，使身体微微发汗为宜，尤其在冬天，准备活动的时间应适当延长。&lt;/p&gt;&lt;br&gt;&lt;p&gt;就像有经验的老司机在冬天开车时都会先热会车一样。&lt;/p&gt;&lt;img src="https://pic3.zhimg.com/v2-600161765e419fc86e5d9dbe5aaacd06_b.jpg" data-rawwidth="600" data-rawheight="352" class="origin_image zh-lightbox-thumb" width="600" data-original="https://pic3.zhimg.com/v2-600161765e419fc86e5d9dbe5aaacd06_r.jpg"&gt;&lt;p&gt;除此之外，在进行运动前，还应注意：&lt;/p&gt;&lt;br&gt;&lt;p&gt;1&lt;b&gt;. 避免高脂肪和高纤维饮食&lt;/b&gt;：进食会增加胃肠道的负担，所以在进食后至少 1.5 小时再进行运动；&lt;/p&gt;&lt;p&gt;2. &lt;b&gt;少喝果汁&lt;/b&gt;：有研究表明，运动前喝果汁可能会导致岔气。可以适当补充运动饮料，但应避免过凉的饮品；&lt;/p&gt;&lt;p&gt;3. &lt;b&gt;注意跑步和呼吸的节奏&lt;/b&gt;：采用正确的跑步姿势，使得呼吸与整个机体的运动相协调。&lt;/p&gt;&lt;br&gt;&lt;br&gt;&lt;p&gt;如果真的在跑步时出现岔气情况，&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;b&gt;不要慌张，按照下面的步骤做&lt;/b&gt;：&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;b&gt;减缓&lt;/b&gt;运动速度和动作幅度；&lt;/li&gt;&lt;li&gt;&lt;b&gt;按住&lt;/b&gt;疼痛部位深呼吸；&lt;/li&gt;&lt;li&gt;&lt;b&gt;调整&lt;/b&gt;呼吸与动作的节奏；&lt;/li&gt;&lt;li&gt;&lt;b&gt;弯腰&lt;/b&gt;慢跑一段距离。&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;一般这样可以缓解疼痛直至好转。&lt;/p&gt;&lt;br&gt;&lt;p&gt;如果上述步骤进行后，疼痛没有消失或者出现加剧的现象，&lt;b&gt;应停止运动求医治疗&lt;/b&gt;，因为持续性的疼痛可能是身体其他病变的表现。&lt;/p&gt;&lt;br&gt;&lt;br&gt;&lt;p&gt;至于题主所问的：&lt;/p&gt;&lt;blockquote&gt;&lt;b&gt;如果岔气时还继续跑步会怎样？&lt;/b&gt;&lt;/blockquote&gt;&lt;p&gt;结果有很多种，不过有一个情况丁香医生是可以百分百确定的。&lt;/p&gt;&lt;br&gt;&lt;p&gt;那就是：&lt;/p&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img src="https://pic2.zhimg.com/v2-82e091772c843b67503cb4afb20fa231_b.jpg" data-rawwidth="860" data-rawheight="506" class="origin_image zh-lightbox-thumb" width="860" data-original="https://pic2.zhimg.com/v2-82e091772c843b67503cb4afb20fa231_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;内容参考丁香医生科普文章：&lt;br&gt;&lt;a href="//link.zhihu.com/?target=http%3A//dxy.com/column/3675%3Ffrom%3Dzh" class=" wrap external" target="_blank" rel="nofollow noreferrer"&gt;运动时，突然一侧肚子疼怎么办？ - 丁香医生&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;br&gt;想加入「丁香医生」团队吗？&lt;br&gt;新媒体运营、程序员、设计师……统统来者不拒，&lt;br&gt;详情可以戳这里：&lt;a href="https://zhuanlan.zhihu.com/p/23744110" class="internal"&gt;知乎专栏&lt;/a&gt;&lt;br&gt;长期有效哦~&lt;br&gt;&lt;img src="https://pic1.zhimg.com/v2-ab621944472791ef16c01ed0f1de8b6c_b.png" data-rawwidth="1152" data-rawheight="598" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic1.zhimg.com/v2-ab621944472791ef16c01ed0f1de8b6c_r.png"&gt;</textarea>


                                    <div class="zh-summary summary clearfix">
                                        <img src="https://pic4.zhimg.com/v2-daf5275109fa2f0b9eff9f0d44054fb3_200x112.jpg"
                                             data-rawwidth="1204" data-rawheight="708"
                                             class="origin_image inline-img zh-lightbox-thumb"
                                             data-original="https://pic4.zhimg.com/v2-daf5275109fa2f0b9eff9f0d44054fb3_r.jpg">
                                        对于跑步岔气的问题，丁香医生来给你打个比喻：
                                        周五的晚上，你正在吃着火锅唱着歌准备过周末时，突然老板一个电话，丢给你一堆工作让你周一前做完给他，你第一反应是怎么样？
                                        心烦意乱情绪低落浑身不适，因为你完全没有做好应对工作的准备，身体处于极其消…

                                        <a href="${ctx}/question/20593205/answer/137070705"
                                           class="toggle-expand">显示全部</a>

                                    </div>


                                    <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                                   data-tooltip="s$t$发布于 2016-12-22" target="_blank"
                                                                   href="${ctx}/question/20593205/answer/137070705">编辑于
                                        2016-12-22</a></p>

                                </div>
                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                    <div class="zm-meta-panel">

                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                           href="javascript:;" id="sfb-417704"><i class="z-icon-follow"></i>关注问题</a>

                                        <a href="${ctx}/explore#" name="addcomment"
                                           class="meta-item toggle-comment js-toggleCommentBox">
                                            <i class="z-icon-comment"></i>412 条评论</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-thank"
                                           data-thanked="false"><i class="z-icon-thank"></i>感谢</a>


                                        <a href="${ctx}/explore#" class="meta-item zu-autohide js-share"><i
                                                class="z-icon-share"></i>分享</a>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                        <span class="zg-bull zu-autohide">•</span>

                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                        <span class="zg-bull zu-autohide">•</span>
                                        <a href="${ctx}/explore#"
                                           class="meta-item zu-autohide js-report">举报</a>


                                        <meta name="copyrightStatus" content="0">
                                        <meta name="disableCopyAvatar"
                                              content="https://pic1.zhimg.com/v2-fc8c90ae998dd9ae303687a19043624c_s.jpg">

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
            </div>
        </div>
    </div>

    <div class="zu-main-sidebar" data-za-module="RightSideBar">

        <div class="zm-side-section explore-side-section">
            <div class="zm-side-section-inner">
                <div class="section-title">
                    <a href="${ctx}/topics" class="zg-link-gray zg-right">更多话题 »</a>
                    <h3>热门话题</h3>
                </div>
            </div>
        </div>
        <div class="zm-side-section explore-side-section">
            <div class="zm-side-section-inner">
                <div class="section-title">
                    <a href="javascript:;" id="js-hot-fav-switch" class="zg-link-gray zg-right" data-za-c="collection"
                       data-za-a="click_trending_collections_change"
                       data-za-l="explore_sidebar_trending_collections_collection_name">换一换</a>
                    <h3>热门收藏</h3>
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
    </div>


</div>
<script>
    $('#questionModal').appendTo("body");
    $("#questionModal").on("hidden.bs.modal", function() {
        $("input[type=reset]").trigger("click");//触发reset按钮
    });
    $('.modal-footer .btn-primary').click(function(e){
        e.preventDefault();
        if ($("input[type='checkbox']").is(':checked')) {
            $('#anonymous_hidden').val(1);
        }
        else {
            $('#anonymous_hidden').val(0);
        }
        $.post(
            '${ctx}/question/add',
            $('#question_form').serialize(),
            function(data){
                $('#questionModal').modal('hide');
                window.location.href = '${ctx}/question/' + data['id'];
            });
    });

    $(".zm-votebar .up").click(function () {
        var id = $(this).closest("div").attr("id");
        if(!$(this).hasClass("pressed")) {
            $(this).addClass("pressed");
//            var id = $(this).closest("div").attr("id");
            $(this).next().removeClass("pressed");
            var star = $(this).find("span:first").text();
            $(this).find("span:first").text(parseInt(star) + 1);

            $.post("${ctx}/answer/agree", {answerId : id, userId : ${user.id}}, function(data){

            });

        }else{
            $(this).removeClass("pressed");
            var star = $(this).find("span:first").text();
            $(this).find("span:first").text(parseInt(star) - 1);
            $.post("${ctx}/answer/cancelAgree", {answerId : id, userId : ${user.id}}, function(data){

            });
        }
    });

    $(".zm-votebar .down").click(function () {
        var id = $(this).prev().closest("div").attr("id");
        if(!$(this).hasClass("pressed")){
            $(this).addClass("pressed");
//            var id = $(this).prev().closest("div").attr("id");
            if($(this).prev().hasClass("pressed")){
                $(this).prev().removeClass("pressed");
                var star = $(this).prev().find("span:first").text();
                if(star != "0") {
                    $(this).prev().find("span:first").text(parseInt(star) - 1);
                }
            }
            $.post("${ctx}/answer/disagree", {answerId : id, userId : ${user.id}}, function(data){

            });
        }else{
            $(this).removeClass("pressed");
            $.post("${ctx}/answer/cancelDisagree", {answerId : id, userId : ${user.id}}, function(data){

            });
        }
    });

    $(function () {
        <%--var feeds = ${feeds};--%>
//        alert(feeds.length);
//        for(var i = 0; i< feeds.length; i++){
//            alert(feeds[i]);
//        }
    });

    function timeStamp2String(time){
        alert(time);
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1;
        var date = datetime.getDate();
        var hour = datetime.getHours();
        var minute = datetime.getMinutes();
        var second = datetime.getSeconds();
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    }
</script>
</body>
</html>