<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <title>标题 - 收藏 - 知乎</title>
    <%--<link rel="stylesheet" href="${ctx}/assets/css/z1.css">--%>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
</head>

<body class="zhi">

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

            <div class="zg-section-title">
                <div style="margin-bottom: 5px;">

                    <a href="${ctx}/collections" data-za-c="collection"
                       data-za-l="collection_collections" data-za-a="visit_collections">«&nbsp;去我的收藏</a>

                </div>
                <div style="margin:0 0 8px 0" id="zh-list-title">
                    <h2 class="zm-item-title zm-editable-content" id="zh-fav-head-title">

                        标题
                    </h2>
                </div>
                <div class="zg-section" style="margin-bottom: 5px;" id="zh-list-desc">
                    <div class="zm-editable-content" id="zh-fav-head-description"></div>
                    <div class="zm-editable-content" id="zh-fav-head-description-source" style="display:none;"></div>
                </div>
                <div class="zm-item-meta" id="zh-list-meta-wrap">
                    <div class="zm-item-meta-actions">
                        <a href="${ctx}/collection/60760155#" name="addcomment" class="toggle-comment">
                            <i class="z-icon-comment"></i>添加评论</a>
                        <span class="zg-bull">•</span>
                        <a href="${ctx}/collection/60760155/log">修改记录</a>

                        <span class="zg-bull">•</span>
                        <a href="javascript:;" name="edit">编辑</a>
                        <span class="zg-bull">•</span>
                        <a href="javascript:;" name="remove">删除</a>

                    </div>

                </div>
            </div>

            <div id="zh-list-collection-wrap" style="margin-bottom: 10px;" class="navigable">

                <div class="zm-item" data-type="Answer" data-za-module="AnswerItem">
                    <h2 class="zm-item-title"><a target="_blank" href="${ctx}/question/24978401">如何通过小细节来增强小空间的幸福感？</a>
                    </h2>
                    <div class="zm-item-fav">
                        <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                             data-aid="52339627" data-atoken="142026285" data-collapsed="0" data-created="1484930493"
                             data-deleted="0" data-isowner="0" data-helpful="1" data-copyable="0">
                            <link itemprop="url" href="${ctx}/question/24978401/answer/142026285">
                            <meta itemprop="answer-id" content="52339627">
                            <meta itemprop="answer-url-token" content="142026285">
                            <a class="zg-anchor-hidden" name="answer-52339627"></a>

                            <div class="zm-item-vote">
                                <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                   data-bind-votecount="">2791</a>
                            </div>

                            <div class="zm-votebar" data-za-module="VoteBar">
                                <button class="up" aria-pressed="false" title="赞同">
                                    <i class="icon vote-arrow"></i>
                                    <span class="count">2791</span>
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

    <a class="author-link" data-hovercard="p$t$xiao-lu-88-18" target="_blank"
       href="${ctx}/people/xiao-lu-88-18">小绿</a></span><span title="画渣/虐狗不甜不要钱" class="bio">
    画渣/虐狗不甜不要钱
    </span>
    </span>
                                </div>

                                <div class="zm-item-vote-info" data-votecount="2791" data-async-voters="1"
                                     data-za-module="VoteInfo">


                                        <span class="voters text"><a href="${ctx}/collection/60760155#"
                                                                     class="more text"><span
                                                class="js-voteCount">2791</span>&nbsp;人赞同</a></span>


                                </div>
                            </div>
                            <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="2173312"
                                 data-action="/answer/content" data-author-name="小绿"
                                 data-entry-url="/question/24978401/answer/142026285">

                                <textarea hidden="" class="content">先上图：我的窝，套内面积37.55平，家里住着两个人，其中一只是程序猿，一只画图狗。&lt;br&gt;在此分享一些小户型相关的居住经验&lt;br&gt;希望对大家有用！(///▽///)&lt;br&gt;&lt;br&gt;时常更新，多图预警！&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="720" data-rawheight="1080" src="https://pic3.zhimg.com/v2-67c1b23ae325bf59fe1edf61ee54a4a6_b.jpg" class="origin_image zh-lightbox-thumb" width="720" data-original="https://pic3.zhimg.com/v2-67c1b23ae325bf59fe1edf61ee54a4a6_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="600" src="https://pic4.zhimg.com/v2-aed22c689cb3b0ba53b9de098e4d0c37_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic4.zhimg.com/v2-aed22c689cb3b0ba53b9de098e4d0c37_r.jpg"&gt;&lt;br&gt;两个处女座折腾几个月小套一，终于有个像样的家了。&lt;br&gt;&lt;br&gt;虽然自己是美术狗，但是题主说的是幸福感，就不谈美学啊设计啊那么高深的东西，（主要是因为我也不专业。- -）个人角度来谈谈舒服，特别是小空间里的舒服的细节。&lt;br&gt;&lt;br&gt;特别是小空间里&lt;b&gt;有限的预算下&lt;/b&gt;舒服的细节。&lt;br&gt;想起一出写一出吧～&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;1、请撕掉电器上所有能效说明等不重要的标签啊！撕得越干净越接近“无印良品”（哈哈&lt;/b&gt;&lt;br&gt;&lt;br&gt;小户型的空间很小，最好尽量减少颜色对比度。这样显得东西少。家电上面蓝色的能耗标签真是太扎眼了。可以用电吹风吹热然后一点点撕下，用热毛巾捂一下也可以。&lt;br&gt;&lt;br&gt;如果你和我一样记忆只有七秒，怕忘记能耗信息的话，可以撕之前拍照记下来。也可以完整撕下贴在记事本页上与说明书一起放进文件夹。&lt;br&gt;&lt;br&gt;不过到底啥时候需要记得能耗呢？&lt;br&gt;&lt;br&gt;如果你不小心撕了一半变成了这样&lt;br&gt;&lt;img data-rawwidth="1080" data-rawheight="720" src="https://pic1.zhimg.com/v2-10029679e9f573d890bee0f4d73b5140_b.jpg" class="origin_image zh-lightbox-thumb" width="1080" data-original="https://pic1.zhimg.com/v2-10029679e9f573d890bee0f4d73b5140_r.jpg"&gt;&lt;br&gt;&lt;br&gt;请点击拯救链接_(:3」∠)_：&lt;br&gt;•【日常】标签撕了一半还粘着是多么痛苦啊&lt;br&gt;&lt;a href="//link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s/UJVW-b0Cfc8JWRcq4_X--w" class=" external" target="_blank" rel="nofollow noreferrer"&gt;&lt;span class="invisible"&gt;http://&lt;/span&gt;&lt;span class="visible"&gt;mp.weixin.qq.com/s/UJVW&lt;/span&gt;&lt;span class="invisible"&gt;-b0Cfc8JWRcq4_X--w&lt;/span&gt;&lt;span class="ellipsis"&gt;&lt;/span&gt;&lt;i class="icon-external"&gt;&lt;/i&gt;&lt;/a&gt;&lt;br&gt;&lt;br&gt;全撕完真爽&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1154" src="https://pic2.zhimg.com/v2-a28f174db34f39f17f750fec273091b5_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic2.zhimg.com/v2-a28f174db34f39f17f750fec273091b5_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;2、买家具家电以前一定要量好距离，最好是定制尺寸。刚好合适的家具多么令人幸福啊！&lt;/b&gt;&lt;br&gt;&lt;br&gt;小户型墙与墙之间很近，yy之下买来的家具尺寸不合适的话（一般来说更容易不小心买大了…）会导致整个房间显得很挤。尤其是盲目追求“装的多”而狂买收纳箱或者大柜子，会为了装一些“其实很少拿出来用”的东西而牺牲了“好几平米价值上万的，可以舒服留白的空间” 所以在尺寸问题上一定要细心，偷懒一时爽，以后天天是你对着这些家具看啊！&lt;br&gt;&lt;br&gt;我在买家具之前，都是用尺细心测量，然后记录下来，再画个简单的图纸标注长宽高，然后发给家具厂。其实如果尺寸合适也可以买成品，但是定制更好。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1136" data-rawheight="740" src="https://pic2.zhimg.com/v2-675d3f08f178bb7c4a1e04d162c0f47d_b.jpg" class="origin_image zh-lightbox-thumb" width="1136" data-original="https://pic2.zhimg.com/v2-675d3f08f178bb7c4a1e04d162c0f47d_r.jpg"&gt;这是我给老板画的电视柜和边柜的yy图。这样电视墙这部分就有6个抽屉，5格隔板空间可以装东西。但是高度都在视线以下看起来又不会挤。更重要的是，两个柜子长度是比着墙定制的，刚刚好。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="962" src="https://pic3.zhimg.com/v2-846c1f6fe79fc321819d7080247907a2_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-846c1f6fe79fc321819d7080247907a2_r.jpg"&gt;电视柜做出来了，跟图纸一样。隐形拉手槽存在感很低。清爽的四周对电视画面不会产生视觉干扰。电视柜刚好超过插座，这样以后电视挂起来就不会看到一根线了。&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1152" src="https://pic3.zhimg.com/v2-83249823b7e3f23e1dee2ce1c7b45dda_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic3.zhimg.com/v2-83249823b7e3f23e1dee2ce1c7b45dda_r.jpg"&gt;&lt;br&gt;&lt;br&gt;所以我个人建议买家具之前最好先拿笔在纸上画个图，yy一下放在房间里的样子，你只需要考虑：&lt;br&gt;1、好不好看。&lt;br&gt;2、能装多少东西，装什么东西？&lt;br&gt;3，厚度是否影响过路，打开柜门拿东西是否方便，好不好清洁？&lt;br&gt;&lt;br&gt;（本处女座可是出门随身带着mini卷尺呢）&lt;br&gt;&lt;br&gt;电视柜+边柜+邮费：¥ 5500&lt;br&gt;&lt;br&gt;&lt;b&gt;3、常用的小地方砸重金能天天幸福！---比如买一对自己喜欢的杯子。&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1080" data-rawheight="720" src="https://pic1.zhimg.com/v2-10e9157f926579c5eeef925bf2128f54_b.jpg" class="origin_image zh-lightbox-thumb" width="1080" data-original="https://pic1.zhimg.com/v2-10e9157f926579c5eeef925bf2128f54_r.jpg"&gt;&lt;br&gt;想花200块迅速提升生活质量，绝对不能用来买200的衣服，200的包…我选择花200多买了两个喜欢的日本手工玻璃杯。从此喝水积极性max！&lt;br&gt;&lt;img data-rawwidth="1080" data-rawheight="720" src="https://pic2.zhimg.com/v2-6edd37b011b6dd2362027ee826077005_b.jpg" class="origin_image zh-lightbox-thumb" width="1080" data-original="https://pic2.zhimg.com/v2-6edd37b011b6dd2362027ee826077005_r.jpg"&gt;&lt;br&gt;&lt;br&gt;catachi的玻璃杯，超美有木有～之前去咖啡店啊茶馆啊什么的我都会把玩杯子，然后想买个手感好的无铅玻璃杯，然后老公在家里加班的话能用更好的杯子喝水，舒适度会很高。&lt;br&gt;（杯子买的好，老公回家早！_(:з」∠)_）&lt;br&gt;&lt;br&gt;同理，常用的东西如抱枕、碗筷之类。也是多花一点钱可以每天幸福的。&lt;br&gt;&lt;br&gt;¥ 200&lt;br&gt;&lt;br&gt;&lt;b&gt;4、给客人准备酒店用的一次性棉拖鞋和一次性坐便纸---让朋友感受到尊重和幸福&lt;/b&gt;&lt;br&gt;&lt;br&gt;经常有朋友来访的话就需要准备客人的拖鞋，然而小户型鞋柜寸金寸土，如果我招待五个朋友，就需要留出放10只拖鞋的位置。太占地方了…我为什么要为那些家伙时不时来一趟准备那么大一块空间！(╯‵□′)╯︵┻━┻ 而且拖鞋还得定期洗，买好点的七八双还那么贵。&lt;br&gt;&lt;br&gt;于是我在淘宝上找到给酒店做一次性拖鞋的店，10双25元还包邮，还是厚的棉拖鞋那种。&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1152" src="https://pic4.zhimg.com/v2-b738761d1ca50762a59db9f0b5d49c0f_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-b738761d1ca50762a59db9f0b5d49c0f_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;质量很好也比较卫生，说是一次性其实可以用好多次…脏了就丢了。最重要的是不占位置（才占了我鞋柜的半个抽屉而已～ 而且客人也很舒服&lt;br&gt;&lt;br&gt;&lt;br&gt;邻居来我家参观看到了都纷纷责怪我没早点给他们安利…&lt;br&gt;&lt;img data-rawwidth="600" data-rawheight="600" src="https://pic1.zhimg.com/v2-d642d6bfaf724be911fa6c14dac09a70_b.jpg" class="origin_image zh-lightbox-thumb" width="600" data-original="https://pic1.zhimg.com/v2-d642d6bfaf724be911fa6c14dac09a70_r.jpg"&gt;&lt;br&gt;&lt;br&gt;（你去做客，进门是想穿脏脏的旧拖鞋呢还是想看到主人拆掉包装给你拿一双新的酒店拖鞋？）&lt;br&gt;&lt;br&gt;一次性坐便垫纸就不说了，买水溶性的，用完冲走～很干净，大家都不尴尬～～便宜的0.9元/张，我买的日本好点的差不多1.6元/张&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic2.zhimg.com/v2-f3e2cd776dfd03f2c73880c40e7894c5_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic2.zhimg.com/v2-f3e2cd776dfd03f2c73880c40e7894c5_r.jpg"&gt;&lt;br&gt;&lt;br&gt;拖鞋：¥ 25.00&lt;br&gt;一次性马桶垫纸：¥ 49.00&lt;br&gt;&lt;br&gt;&lt;b&gt;5、定做的门垫，尺寸和内容都是自定义！---专属的幸福感。&lt;/b&gt;&lt;br&gt;每天进门都会看到的门垫，按照家里门框的尺寸定做了。几十块钱，和外面买的价格差不多。不过打上了老公喜欢的内容（他说程序员都能看得懂） 颜色也是我挑的深灰色，比较不怕脏。每次看到这句话都觉得很可爱（zhuangbi）。&lt;br&gt;&lt;img data-rawwidth="960" data-rawheight="720" src="https://pic3.zhimg.com/v2-51e92351c2f923efa4fe12da000215b6_b.jpg" class="origin_image zh-lightbox-thumb" width="960" data-original="https://pic3.zhimg.com/v2-51e92351c2f923efa4fe12da000215b6_r.jpg"&gt;&lt;br&gt;&lt;br&gt;国外还有类似的门垫出售&lt;br&gt;&lt;img data-rawwidth="748" data-rawheight="748" src="https://pic1.zhimg.com/v2-419381eed81cd7098271987e94f6903c_b.jpg" class="origin_image zh-lightbox-thumb" width="748" data-original="https://pic1.zhimg.com/v2-419381eed81cd7098271987e94f6903c_r.jpg"&gt;&lt;br&gt;&lt;br&gt;¥：59.00&lt;br&gt;&lt;br&gt;&lt;b&gt;6:在买家具之前可以先把颜色、形状和位置在家装网站上搭配好，降低买错的风险！&lt;/b&gt;&lt;br&gt;&lt;br&gt;凭着想象去买东西很容易买错，或者买来的东西和实际效果有巨大的落差。落差到心碎...其实现在有很多家装软件和网站都可以自己免费做效果图，我比较懒，就在酷家乐直接摆家具渲染出图，然后照着买。&lt;br&gt;这是我渲出来的图：&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="600" src="https://pic2.zhimg.com/v2-e02cdbd8ea321ef9998a08293b4e6f09_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic2.zhimg.com/v2-e02cdbd8ea321ef9998a08293b4e6f09_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;这是实景&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1154" src="https://pic2.zhimg.com/v2-83093b76345aa1f84761dcc70a91d555_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic2.zhimg.com/v2-83093b76345aa1f84761dcc70a91d555_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1080" data-rawheight="720" src="https://pic2.zhimg.com/v2-8c5b94994c508b34a581c157d3572c99_b.jpg" class="origin_image zh-lightbox-thumb" width="1080" data-original="https://pic2.zhimg.com/v2-8c5b94994c508b34a581c157d3572c99_r.jpg"&gt;&lt;br&gt;&lt;br&gt;因为提前做过效果图心里就有数，在网站上经过比较我发现做白色鞋柜不显堵所以选择了白色。&lt;br&gt;&lt;br&gt;当然柜子我也先画了图，把设计图和效果图都发给厂家。&lt;br&gt;&lt;img data-rawwidth="3508" data-rawheight="2480" src="https://pic2.zhimg.com/v2-57230690fc8b9882728f014026a7edb1_b.jpg" class="origin_image zh-lightbox-thumb" width="3508" data-original="https://pic2.zhimg.com/v2-57230690fc8b9882728f014026a7edb1_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;7、可以有个收纳、展示的地方（玻璃柜显得通透）来存放自己喜欢的东西！如果放不下，格子搁板也行。&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1280" src="https://pic4.zhimg.com/v2-8891b0e3b56b4f4d13b39e08b1b21efb_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/v2-8891b0e3b56b4f4d13b39e08b1b21efb_r.jpg"&gt;&lt;br&gt;&lt;br&gt;可以有个小柜子装收藏/零食/手办/电子产品&lt;br&gt;总之自己喜欢的东西&lt;br&gt;我个人是喜欢买杯子啥的，家里好多杯子，所以就有个小柜子装杯子。&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-c1526e0c39287d86ed66d0dc856eaa79_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-c1526e0c39287d86ed66d0dc856eaa79_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;如果没有地方放柜子，可以买搁板柜，格子的比板子的好擦。&lt;br&gt;&lt;br&gt;比如宜家的瓦里系列：&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic1.zhimg.com/v2-1a87c1b1a683c78a82c4a53975810f98_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-1a87c1b1a683c78a82c4a53975810f98_r.jpg"&gt;&lt;br&gt;&lt;br&gt;宜家瓦里系列：¥99～299&lt;br&gt;&lt;br&gt;&lt;b&gt;8、买个小音响&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1500" data-rawheight="1500" src="https://pic3.zhimg.com/v2-a0e2df2a730c29dd25396e3c530e3b5e_b.jpg" class="origin_image zh-lightbox-thumb" width="1500" data-original="https://pic3.zhimg.com/v2-a0e2df2a730c29dd25396e3c530e3b5e_r.jpg"&gt;&lt;br&gt;不解释啦，小房间有点音乐幸福感upupupupup！&lt;br&gt;BOSE soundlink mini ¥：1700.00&lt;br&gt;&lt;br&gt;&lt;b&gt;9、好用不过百叶窗，切割阳光，通风透气还能调节明暗。&lt;/b&gt;&lt;br&gt;&lt;br&gt;百叶窗价格便宜！风格百搭通透感强。把我的窗台变成了一个发呆很舒服的地方。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic4.zhimg.com/v2-a1b3385629a90e70eae6c59563d0307b_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-a1b3385629a90e70eae6c59563d0307b_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-96232f0b9cfebbefbf960838c2d28cb1_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-96232f0b9cfebbefbf960838c2d28cb1_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1152" src="https://pic3.zhimg.com/v2-2c693669231ec3d1175248115387a7de_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic3.zhimg.com/v2-2c693669231ec3d1175248115387a7de_r.jpg"&gt;&lt;br&gt;&lt;br&gt;¥：200～400&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;10、清爽的洗漱空间让人早晚都感觉很幸福&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;浴室柜台面尽量不要堆过多的东西，如果空间小，可以利用镜柜增加纵向收纳空间&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic1.zhimg.com/v2-3d87e36b0a002a3c33578200ec057d0c_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic1.zhimg.com/v2-3d87e36b0a002a3c33578200ec057d0c_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;我去过很多朋友租的小房子，他们往往因为浴室柜太小在台面上堆满了杯子洗面奶啥的，五颜六色的包装看着很乱不说，还很容易拿东西碰掉到地上。看得我好难受T T&lt;br&gt;&lt;br&gt;我自己的这个小房子浴室柜根本放不进卫生间，索性做在过道上了。把台面做窄了一点，用长度弥补了。（定做的又窄又长的台面，不影响过路又能满足两个人使用）&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1707" data-rawheight="1280" src="https://pic4.zhimg.com/v2-6830aac19147d1e5c5f6886a774b772f_b.jpg" class="origin_image zh-lightbox-thumb" width="1707" data-original="https://pic4.zhimg.com/v2-6830aac19147d1e5c5f6886a774b772f_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;洗面奶牙膏啊什么的都装进宜家那个白色的收纳盒里面，管他红的绿的都在里面排列着。很好找而且看起来清爽。&lt;br&gt;&lt;br&gt;除了这个收纳盒以外，镜柜也是超级好用啊！看起来东西不多，但其实都藏起来了&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-029907f253a4ec9ae75c9a7bcd3027f9_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-029907f253a4ec9ae75c9a7bcd3027f9_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;镜柜要稍微做高一点以免挡住水龙头～&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic3.zhimg.com/v2-f1f3c42c5141e69015176266f8b5b4f6_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-f1f3c42c5141e69015176266f8b5b4f6_r.jpg"&gt;&lt;br&gt;&lt;br&gt;镜柜空间超大连1/4都没装满，更别说台面下面这三个抽屉+一个盆下柜了。&lt;br&gt;当然上面我也够不着了_(:3」∠)_&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1920" src="https://pic4.zhimg.com/v2-fa952953d9d5a08e6f42b42f897d7d57_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/v2-fa952953d9d5a08e6f42b42f897d7d57_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;11、缝隙柜拯救世界！&lt;/b&gt;&lt;br&gt;&lt;br&gt;如果浴室柜很窄，做不了那么长的台面和右边的三个大抽屉，还可以选择网购一个缝隙柜。在我以前的家里由于爸爸买的成品柜，右边空了一截尴尬的空间，然后柜子也装不了多少东西。所以买了缝隙抽屉柜。卡在里面刚刚好！（处女座泪目）&lt;br&gt;&lt;br&gt;柜顶与台面高度齐平，颜色也一致。&lt;br&gt;&lt;img data-rawwidth="720" data-rawheight="960" src="https://pic2.zhimg.com/v2-6325ed5c90c96fa4f9a7e2c74d8620a1_b.jpg" class="origin_image zh-lightbox-thumb" width="720" data-original="https://pic2.zhimg.com/v2-6325ed5c90c96fa4f9a7e2c74d8620a1_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1152" src="https://pic1.zhimg.com/v2-a925fba81750a4659f38dc6c5fd70ab8_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic1.zhimg.com/v2-a925fba81750a4659f38dc6c5fd70ab8_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;可以装瓶瓶罐罐、囤的纸巾、电吹风等杂物。而且有小轮子，推出来就可以清洁&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic3.zhimg.com/v2-8137d16b496b71269a28f3edb70b21ee_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic3.zhimg.com/v2-8137d16b496b71269a28f3edb70b21ee_r.jpg"&gt;&lt;br&gt;¥：145.00&lt;br&gt;&lt;br&gt;&lt;b&gt;12、挂画墙饰能激活家里的氛围～&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1280" src="https://pic4.zhimg.com/v2-44be3621a9f933917bcd3d45117ac2db_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/v2-44be3621a9f933917bcd3d45117ac2db_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;装饰画网上很多，根据家里的风格和色调来选择就好，几十块钱就能买。上千能买收藏级…如果想要最大性价比，那就十几块钱买个框，再打印or买一张电影海报。甚至直接就是打印一段自己喜欢的话在白纸上都行。&lt;br&gt;&lt;br&gt;个人建议买轻的！轻的好挂…而且掉下来也不会砸伤人。换画芯也很方便！&lt;br&gt;&lt;br&gt;顺便说一句这个鹿头才16块包邮…（激动）&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic2.zhimg.com/v2-f92af3de69e6feb92da9e173d36cb1c5_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic2.zhimg.com/v2-f92af3de69e6feb92da9e173d36cb1c5_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;装饰画：39.00/幅&lt;br&gt;鹿头：16.00&lt;br&gt;眼镜框：9.00&lt;br&gt;&lt;br&gt;&lt;b&gt;13、厨房预留电源装净水器可以出直饮水～&lt;/b&gt;&lt;br&gt;&lt;b&gt;热水壶烧水就没有水垢了！&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic2.zhimg.com/v2-722888be7f185d34fc4fd604bba02fad_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic2.zhimg.com/v2-722888be7f185d34fc4fd604bba02fad_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic4.zhimg.com/v2-99f112810f1d714b46dda6a9ef785edb_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-99f112810f1d714b46dda6a9ef785edb_r.jpg"&gt;&lt;br&gt;出水管刚好可以转过来，把杯子或者水壶直接放在台面上接水。&lt;br&gt;&lt;img data-rawwidth="1106" data-rawheight="1106" src="https://pic4.zhimg.com/v2-7b406311cd20a5f25508d8285ab80b57_b.jpg" class="origin_image zh-lightbox-thumb" width="1106" data-original="https://pic4.zhimg.com/v2-7b406311cd20a5f25508d8285ab80b57_r.jpg"&gt;&lt;br&gt;水里面没有什么杂质，所以口感还是有变化的&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;14、鞋柜上面和下面都要考虑放东西，其他柜子也是～&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1152" src="https://pic4.zhimg.com/v2-549cc822c399778421121b0400c6c90b_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-549cc822c399778421121b0400c6c90b_r.jpg"&gt;&lt;br&gt;鞋柜上面可以随手放包或者钥匙啥的&lt;br&gt;&lt;br&gt;鞋柜下面抬高了一截&lt;br&gt;用来放换下的鞋、拖鞋&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic3.zhimg.com/v2-b23617fd708742a387691ad9e5f5062a_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-b23617fd708742a387691ad9e5f5062a_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;后来上面放香薰机和微波炉&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1154" src="https://pic2.zhimg.com/v2-a28f174db34f39f17f750fec273091b5_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic2.zhimg.com/v2-a28f174db34f39f17f750fec273091b5_r.jpg"&gt;&lt;br&gt;&lt;br&gt;同样浴室柜也抬高了下面，留出空间可以放盆子和拖鞋。而且人洗漱的时候靠近浴室柜脚也比较好站。&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic3.zhimg.com/v2-2fe318eb6ec0d99cd9cbb8fa1bf7c08e_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic3.zhimg.com/v2-2fe318eb6ec0d99cd9cbb8fa1bf7c08e_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-232e1b788cb9670116ec184c1fe97981_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-232e1b788cb9670116ec184c1fe97981_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;15、香薰机/加湿器 让房间空气变得很舒服！&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1280" src="https://pic1.zhimg.com/v2-9188603cb6f1685a36f93e05c73c3590_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-9188603cb6f1685a36f93e05c73c3590_r.jpg"&gt;&lt;br&gt;&lt;br&gt;我用的这个是无印良品的，小号，不占地方～&lt;br&gt;而且还能开灯，起小夜灯的作用！&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1154" src="https://pic2.zhimg.com/v2-c6f0a5d8d7b88f94e3f8f14020309dc1_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic2.zhimg.com/v2-c6f0a5d8d7b88f94e3f8f14020309dc1_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;这种无火香薰也很适合放在卫生间&lt;br&gt;后来确实也放卫生间了，，味道太浓郁了（棍儿插多了。。）&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic1.zhimg.com/v2-a4dddf8581efc0ec0c0ee7068824fe04_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-a4dddf8581efc0ec0c0ee7068824fe04_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;16、厨房操作区加个感应灯，切菜洗碗什么的都会很亮。小厨房水槽不大，可以买个小的滤水篮&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1920" src="https://pic3.zhimg.com/v2-caa4a2e92973ac589503352267cd657a_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-caa4a2e92973ac589503352267cd657a_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic1.zhimg.com/v2-ea814b0058dfe5b5bd53f8303dd301b8_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic1.zhimg.com/v2-ea814b0058dfe5b5bd53f8303dd301b8_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;如果要洗很大的锅，可以把滤水篮移开。因为很轻所以很方便！&lt;br&gt;&lt;br&gt;滤干的碗盘可以放进碗架&lt;br&gt;&lt;img data-rawwidth="1001" data-rawheight="1334" src="https://pic1.zhimg.com/v2-eda891880e38bed9ec00fe07dfa164f4_b.jpg" class="origin_image zh-lightbox-thumb" width="1001" data-original="https://pic1.zhimg.com/v2-eda891880e38bed9ec00fe07dfa164f4_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;17、蜜汁好用的冰箱磁铁挂钩！&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic1.zhimg.com/v2-d2caf52e4e91530f2a6c1da1f2b56f24_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic1.zhimg.com/v2-d2caf52e4e91530f2a6c1da1f2b56f24_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;三块钱一个…解决大问题！挂得稳稳的～&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1154" data-rawheight="1536" src="https://pic2.zhimg.com/v2-9c15d05522361a394fec087998d0409d_b.jpg" class="origin_image zh-lightbox-thumb" width="1154" data-original="https://pic2.zhimg.com/v2-9c15d05522361a394fec087998d0409d_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;还可以用在金属的防盗门上&lt;br&gt;&lt;img data-rawwidth="1154" data-rawheight="1536" src="https://pic2.zhimg.com/v2-1df90c2accfcd4a01c1705a456e696f1_b.jpg" class="origin_image zh-lightbox-thumb" width="1154" data-original="https://pic2.zhimg.com/v2-1df90c2accfcd4a01c1705a456e696f1_r.jpg"&gt;&lt;br&gt;¥ 3.00/个&lt;br&gt;&lt;br&gt;&lt;b&gt;18、代替马桶刷的高压水喷枪～&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic1.zhimg.com/v2-9d0d91ddc919cecfdc1d4ce7b970b9bc_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic1.zhimg.com/v2-9d0d91ddc919cecfdc1d4ce7b970b9bc_r.jpg"&gt;&lt;br&gt;&lt;br&gt;几十块钱一个，可以在马桶后面的水管加个三通，就可以愉快地冲水了。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-cb7ecdcddce81157df4b50d93a6f3741_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-cb7ecdcddce81157df4b50d93a6f3741_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;不管是冲洗马桶还是浴室地面，都超级方便…&lt;br&gt;&lt;br&gt;泰国的很多公共卫生间都有这个～&lt;br&gt;评论有很多同学说这是他们冲屁股的&lt;br&gt;但是这冲击力(⊙_⊙)b………&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-d0e9e2fc4e8a069f1b84a9e90a0d4981_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-d0e9e2fc4e8a069f1b84a9e90a0d4981_r.jpg"&gt;&lt;br&gt;&lt;br&gt;¥ 49.00&lt;br&gt;&lt;br&gt;&lt;b&gt;19、床、床头柜、沙发、茶几 最好下面留够高度，然后就可以淡定躺着看扫地机器人钻来钻去了！&lt;/b&gt;&lt;br&gt;&lt;br&gt;留够高度会更方便打扫卫生，另外也不会受潮。我家扫地机器人高度7cm，所以家居下面都留了10cm左右的高度&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic3.zhimg.com/v2-9d1a1c1e01f8285b7182b19bf1fdce1a_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic3.zhimg.com/v2-9d1a1c1e01f8285b7182b19bf1fdce1a_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;我家扫地机器人的专属角落：&lt;br&gt;&lt;img data-rawwidth="1707" data-rawheight="1280" src="https://pic1.zhimg.com/v2-59620b9bcf21d4a88d4ab60fc48df420_b.jpg" class="origin_image zh-lightbox-thumb" width="1707" data-original="https://pic1.zhimg.com/v2-59620b9bcf21d4a88d4ab60fc48df420_r.jpg"&gt;&lt;br&gt;辛苦了，要到处扫到哦～&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;20、实用到爆的挂式储物框！！&lt;/b&gt;&lt;br&gt;&lt;br&gt;钉在茶几下面：&lt;br&gt;&lt;img data-rawwidth="1707" data-rawheight="1280" src="https://pic2.zhimg.com/v2-542ba5b35bd684ea9ff160cce463ef8d_b.jpg" class="origin_image zh-lightbox-thumb" width="1707" data-original="https://pic2.zhimg.com/v2-542ba5b35bd684ea9ff160cce463ef8d_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;卡在书桌下面：&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1152" src="https://pic1.zhimg.com/v2-fe52e35c8d5dcf380e4c2ee78bc55d14_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic1.zhimg.com/v2-fe52e35c8d5dcf380e4c2ee78bc55d14_r.jpg"&gt;&lt;br&gt;&lt;br&gt;可以装电源线、手柄、遥控器啥的！&lt;br&gt;而且存在感超低！价格也很便宜。我买的两个一共28块还包邮…抱着要啥自行车的心态就买了………&lt;br&gt;&lt;br&gt;&lt;b&gt;21、乳胶床垫+羽绒被 真的很爽…虽然预算不高，大头还是该花在床上～&lt;/b&gt;&lt;br&gt;&lt;img data-rawwidth="1711" data-rawheight="1280" src="https://pic2.zhimg.com/v2-b9e7d28625d860f0c6793fcdc8669535_b.jpg" class="origin_image zh-lightbox-thumb" width="1711" data-original="https://pic2.zhimg.com/v2-b9e7d28625d860f0c6793fcdc8669535_r.jpg"&gt;&lt;br&gt;每天在家呆最久的地方一定要最舒服啊！&lt;br&gt;&lt;img data-rawwidth="1536" data-rawheight="1152" src="https://pic2.zhimg.com/v2-86cfcba46bf945ba890f6a7e8a962d39_b.jpg" class="origin_image zh-lightbox-thumb" width="1536" data-original="https://pic2.zhimg.com/v2-86cfcba46bf945ba890f6a7e8a962d39_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;至于枕头，每个人颈椎情况不同喜好不同，可以选择适合自己的。我觉得我的乳胶枕有点高了～&lt;br&gt;&lt;br&gt;&lt;b&gt;22、东西多的地方尽量用同色系的家居更清爽！&lt;/b&gt;&lt;br&gt;&lt;br&gt;买这种按压的瓶子/泡沫瓶，再买洗手液、洗衣液or洗洁精就可以买补充装，直接倒进去。既清爽又省钱。按压瓶无印良品有卖，淘宝上也有很多。我买的都是白色的，也有不锈钢的和透明的～&lt;br&gt;&lt;br&gt;白色的起泡的洗手液瓶和直接按出来的洗衣液瓶子&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic1.zhimg.com/v2-18827bc94a6feeb4dc5662bb916d5a0c_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-18827bc94a6feeb4dc5662bb916d5a0c_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;白色的洗洁精瓶子&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic3.zhimg.com/v2-f0c6688b6e237e5c7cb8deeace99826e_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-f0c6688b6e237e5c7cb8deeace99826e_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;白色的洗衣粉罐子和晾晒架小挂桶&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic4.zhimg.com/v2-11a827cbd77d85289165f4f50eec2ed7_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic4.zhimg.com/v2-11a827cbd77d85289165f4f50eec2ed7_r.jpg"&gt;&lt;br&gt;&lt;br&gt;白色的厨房纸巾，白色的饭瓢&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic4.zhimg.com/v2-a871c3509cf1090c9f87827d905ef35b_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-a871c3509cf1090c9f87827d905ef35b_r.jpg"&gt;&lt;br&gt;&lt;br&gt;白色的框，白色的碗盘和椅子&lt;br&gt;&lt;img data-rawwidth="1154" data-rawheight="1536" src="https://pic4.zhimg.com/v2-76f1a38686b0e0e4ff80d8dc2b963203_b.jpg" class="origin_image zh-lightbox-thumb" width="1154" data-original="https://pic4.zhimg.com/v2-76f1a38686b0e0e4ff80d8dc2b963203_r.jpg"&gt;&lt;br&gt;&lt;br&gt;白色的浴巾、浴球和百叶窗&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic4.zhimg.com/v2-d44efe7a3866865fc0c01c8cd8a7c4b7_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic4.zhimg.com/v2-d44efe7a3866865fc0c01c8cd8a7c4b7_r.jpg"&gt;&lt;br&gt;&lt;br&gt;选择白色是因为我的柜子台面和电器都是浅色，所以选择了和表面接近的颜色，这样看起来就不会有东西堆满的紧迫感了～（白色最安全）&lt;br&gt;&lt;br&gt;按压瓶：¥ 13～18&lt;br&gt;厨房纸巾架：¥ 39&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;23、便宜好用的节日氛围：小旗子和串灯&lt;/b&gt;&lt;br&gt;&lt;br&gt;找彩色的纸剪成三角形，然后用绳子穿过就可以贴在墙上、家具上了～&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic2.zhimg.com/v2-f2ee33a68a896d22c06a98c70ff25ef9_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic2.zhimg.com/v2-f2ee33a68a896d22c06a98c70ff25ef9_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1707" src="https://pic1.zhimg.com/v2-33354703b89d23623ddf6c8c83dbaad8_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-33354703b89d23623ddf6c8c83dbaad8_r.jpg"&gt;&lt;br&gt;&lt;br&gt;串灯淘宝上一根二十多块吧～晚上星星点点的很可爱&lt;br&gt;&lt;img data-rawwidth="1440" data-rawheight="1080" src="https://pic1.zhimg.com/v2-bded19bd8ea7a3dd09f04422fe2df9ec_b.jpg" class="origin_image zh-lightbox-thumb" width="1440" data-original="https://pic1.zhimg.com/v2-bded19bd8ea7a3dd09f04422fe2df9ec_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;24、小小的衣柜要想轻松保持整齐好拿，里面少不了各种收纳箱！&lt;/b&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;早上急急忙忙起床，在一叠衣服里面费力地抽出今天要穿的衣服，即使其他的衣服全部坍塌也顾不上了！袜子经常找不到另一只，要不就是被裹成一个团导致袜口变形，而且经常滚下衣柜…&lt;br&gt;&lt;br&gt;这是很多人的生活常态，这样的常态在小户型极度有限的衣柜里变得更严重～&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1280" src="https://pic3.zhimg.com/v2-ebec726e42b9c26936cfb8b5f0277546_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic3.zhimg.com/v2-ebec726e42b9c26936cfb8b5f0277546_r.jpg"&gt;&lt;br&gt;&lt;br&gt;受不了我家直男一只脚一只袜子也能出门，终于好好的给他做了一次整理。像这样的收纳箱有硬地有软的，我自己的是带盖子的，他的是可以直接放进抽屉的。这种带格子的好处就是拿取不影响其它袜子～而且整个收纳盒方便移动，不用在衣柜里面刨袜子了。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="960" src="https://pic2.zhimg.com/v2-225c94ac624988a9404ea841bb62ef29_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic2.zhimg.com/v2-225c94ac624988a9404ea841bb62ef29_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;内衣也是哦！（就不上图了）&lt;br&gt;&lt;br&gt;另外强烈推荐的是收纳届的网红：天马抽屉盒！&lt;br&gt;强烈推荐！&lt;br&gt;强烈！&lt;br&gt;&lt;br&gt;先上一张广告图吧！&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="800" src="https://pic1.zhimg.com/v2-e97094e447c3fafc539be4f53a94d30c_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic1.zhimg.com/v2-e97094e447c3fafc539be4f53a94d30c_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;因为是抽屉的，拿去特别方便，不会因为拿件衣服就把整个柜子都弄乱。另外宽窄都有，非常方便组合。自从我买了以后感觉衣柜变大了50%！而且能够长时间地保持整洁感。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1280" data-rawheight="1280" src="https://pic1.zhimg.com/v2-1a98dd7f789d9cfbf076eb3d926ec180_b.jpg" class="origin_image zh-lightbox-thumb" width="1280" data-original="https://pic1.zhimg.com/v2-1a98dd7f789d9cfbf076eb3d926ec180_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;还有那种组合式收纳格&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="800" src="https://pic1.zhimg.com/v2-721eb5d4f5dd58e816b122dd08377758_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic1.zhimg.com/v2-721eb5d4f5dd58e816b122dd08377758_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;这种宜家也有，可以灵活地放进抽屉里，而且可以装围巾、皮带，毛巾，打底裤什么的小件。&lt;br&gt;&lt;br&gt;翻找起来也更方便！&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;25、一千块买两米长的实木书桌不现实？那就买一千块的实木板子，加上腿就是桌子了！&lt;/b&gt;&lt;br&gt;&lt;br&gt;话说我们的书房肯定是要二连坐的，两个人都用电脑，需要双人书桌，而且是很长的双人书桌。我老公还要求60cm的宽度，最好是60cmx200cm这个尺寸。最好是胡桃木的实木桌。最好是上木蜡油的…&lt;br&gt;&lt;br&gt;然后最好是1000左右搞定…&lt;br&gt;&lt;br&gt;我怒了！这需求，简直了！&lt;br&gt;于是我花1000网上买了个酷炫的板子，叫老板加工成60x200寄过来，钻个洞穿电源线。再花15/根的价格在宜家买了5根腿儿。&lt;br&gt;&lt;br&gt;有一天我老公收到个巨大的包裹…&lt;br&gt;&lt;img data-rawwidth="614" data-rawheight="986" src="https://pic3.zhimg.com/v2-935a7a722e32b239ee6d50cfe2d5cdd2_b.jpg" class="origin_image zh-lightbox-thumb" width="614" data-original="https://pic3.zhimg.com/v2-935a7a722e32b239ee6d50cfe2d5cdd2_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;“老婆我们买了门？”&lt;br&gt;“不，这是桌子”&lt;br&gt;“腿呢？”&lt;br&gt;“在宜家(´-ω-`)”&lt;br&gt;&lt;br&gt;后来组装上以后简直了&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic3.zhimg.com/v2-f7abede3c3535e5d5e6685d265d034d2_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic3.zhimg.com/v2-f7abede3c3535e5d5e6685d265d034d2_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;本来老公担心宜家的腿会晃，&lt;br&gt;结果因为书桌是靠着墙的，所以完全不晃，稳稳的。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1920" data-rawheight="1280" src="https://pic2.zhimg.com/v2-e38ab123338faa7e18f4ca2411132d45_b.jpg" class="origin_image zh-lightbox-thumb" width="1920" data-original="https://pic2.zhimg.com/v2-e38ab123338faa7e18f4ca2411132d45_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;桌腿是这款，宜家的良心之作：&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="750" data-rawheight="1334" src="https://pic1.zhimg.com/v2-ee9b56a3cefe8ea9657f3699f0696774_b.png" class="origin_image zh-lightbox-thumb" width="750" data-original="https://pic1.zhimg.com/v2-ee9b56a3cefe8ea9657f3699f0696774_r.png"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;----关于小孩问题，不在意的跳过往下拉---&lt;br&gt;&lt;br&gt;关于很多人说到小孩的问题，这套房子主要是我们两个住，要以我们的感受为主。有小孩和房子的风格没有什么冲突。&lt;br&gt;&lt;br&gt;在这里解释一下我们的家庭计划。&lt;br&gt;&lt;br&gt;我们很幸运，婚姻得到了双方父母的支持。两家都尽自己可能给了我们一笔钱作为首付款让我们买一套大房子。这笔钱在当时的成都足以让我们买下一套120平的房子。但！&lt;br&gt;&lt;br&gt;我家里有一句家训：&lt;br&gt;&lt;b&gt;“吃不穷，穿不穷，不会计划就受穷。”&lt;/b&gt;&lt;br&gt;&lt;br&gt;考虑到他父母以后会过来成都，我把这笔能买120平的首付款分成了两套房子，大概一套四十多平，一套八十平。&lt;br&gt;&lt;br&gt;四十多（建筑面积）的房子就是这套，买在了他的公司对面。&lt;br&gt;&lt;br&gt;八十平的房子是一套学区房，和这套小房子隔一条街。&lt;br&gt;&lt;br&gt;也就是说，把买一个套三房子的钱分成了一个套一和一个套二。套一用来上班过渡（我老公中午下班还能回家睡午觉，也是没谁了） 套二以后小孩大了可以住。然后老人可以过来住套一，两个房子都很近，来往方便。但是又分别独立。&lt;br&gt;&lt;br&gt;现在这套小的，立刻就能派上用场，解决我们上班的大问题，从此每天节约两个小时堵车时间，用来看电影不好吗？（当然，因此我们也暂时没钱装修下一套了_(:з」∠)_&lt;br&gt;&lt;br&gt;&lt;b&gt;这并不代表我们在装修这套房子的时候，完全没有考虑小孩。&lt;br&gt;&lt;/b&gt;&lt;br&gt;家里的家具、把手，都是圆角的，温润的。&lt;br&gt;并且是可以组合，方便移动的。&lt;br&gt;&lt;br&gt;事实上，各个小朋友特别喜欢我家。我已经接待了好几个小朋友啦！&lt;br&gt;&lt;img data-rawwidth="960" data-rawheight="1280" src="https://pic2.zhimg.com/v2-e774123c72d4e3b142130d7f2c61d8dd_b.jpg" class="origin_image zh-lightbox-thumb" width="960" data-original="https://pic2.zhimg.com/v2-e774123c72d4e3b142130d7f2c61d8dd_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;指使小朋友A帮我擦桌子&lt;br&gt;&lt;img data-rawwidth="750" data-rawheight="1334" src="https://pic1.zhimg.com/v2-cbdf161aa4222e7e2a45556179ced434_b.png" class="origin_image zh-lightbox-thumb" width="750" data-original="https://pic1.zhimg.com/v2-cbdf161aa4222e7e2a45556179ced434_r.png"&gt;&lt;br&gt;&lt;br&gt;指使小朋友B帮我擦地板&lt;br&gt;&lt;img data-rawwidth="1000" data-rawheight="813" src="https://pic3.zhimg.com/v2-84030daf6051e7406527788f8ef651b6_b.jpg" class="origin_image zh-lightbox-thumb" width="1000" data-original="https://pic3.zhimg.com/v2-84030daf6051e7406527788f8ef651b6_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;哈哈哈哈，不要挑战一个强势的处女座阿姨！&lt;br&gt;&lt;br&gt;小朋友们最喜欢的变形灯：&lt;br&gt;&lt;img data-rawwidth="748" data-rawheight="556" src="https://pic1.zhimg.com/v2-ce292f1c55849a04fa71743bddbf3428_b.jpg" class="origin_image zh-lightbox-thumb" width="748" data-original="https://pic1.zhimg.com/v2-ce292f1c55849a04fa71743bddbf3428_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;每次一拉开，他们就惊呆了。@_@&lt;br&gt;&lt;br&gt;&lt;br&gt;-------&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;b&gt;参考文献&lt;/b&gt;：&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="800" src="https://pic2.zhimg.com/v2-eb4e9830abea44d039d0d457c44d5f49_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic2.zhimg.com/v2-eb4e9830abea44d039d0d457c44d5f49_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;《小家越住越大》---万科精装总设计师逯薇总结的家居经验，图文并茂，针对中国人的居住习惯而写。小户型必备！&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="800" data-rawheight="800" src="https://pic3.zhimg.com/v2-cf3d8d22fbf8f30cecf437c04c6e263e_b.jpg" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic3.zhimg.com/v2-cf3d8d22fbf8f30cecf437c04c6e263e_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;《照明设计》--国际环境设计精品教程&lt;br&gt;&lt;br&gt;这本书主要讲了灯光的布置，&lt;br&gt;什么是色温什么是流明什么是能耗&lt;br&gt;为什么卧室要用暖光厨房要用冷光之类的。&lt;br&gt;太复杂的理论部分可以不看，直接杀重点。&lt;br&gt;水电改造、买灯前必看！&lt;br&gt;&lt;br&gt;&lt;b&gt;参考App：&lt;/b&gt;&lt;br&gt;&lt;br&gt;好好住：很实用的家居类app，上面全是琢磨着让家变得更好的大神。在这个app我学到了很多实实在在的姿势。_(:з」∠)_每天都是跪着看大神们的家。我的好好住ID是 绿宅宅&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="750" data-rawheight="1334" src="https://pic3.zhimg.com/v2-78e9258fe33cca04e4029c92c30418f2_b.png" class="origin_image zh-lightbox-thumb" width="750" data-original="https://pic3.zhimg.com/v2-78e9258fe33cca04e4029c92c30418f2_r.png"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;花瓣：美图app，各分类都有。其实就是国内的pinterest. 然后家居类的图很多可以作为参考。我的花瓣ID是 每日一家  &lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="750" data-rawheight="1334" src="https://pic1.zhimg.com/v2-4f6d3e4eaace19b2f76ea2108f420428_b.png" class="origin_image zh-lightbox-thumb" width="750" data-original="https://pic1.zhimg.com/v2-4f6d3e4eaace19b2f76ea2108f420428_r.png"&gt;&lt;br&gt;&lt;br&gt;-------&lt;br&gt;好啦先写这么些～以后有空继续更！&lt;br&gt;这些都是一些个人的生活方式,仅供参考吧～&lt;br&gt;总之只要用心，家里一定能变得更棒，&lt;br&gt;只要自己觉得舒服就好啦。&lt;br&gt;&lt;br&gt;还有你的爱人。&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic4.zhimg.com/v2-e6ce42ba8fb3f2d1653f77728abedf2f_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic4.zhimg.com/v2-e6ce42ba8fb3f2d1653f77728abedf2f_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img data-rawwidth="1707" data-rawheight="1280" src="https://pic3.zhimg.com/v2-535d89dcb72b1f4c46ac72d2c8ede87a_b.jpg" class="origin_image zh-lightbox-thumb" width="1707" data-original="https://pic3.zhimg.com/v2-535d89dcb72b1f4c46ac72d2c8ede87a_r.jpg"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;特别鸣谢：装灯装家具我老公辛苦啦！（果然还是我设计你实现）&lt;br&gt;&lt;img data-rawwidth="1152" data-rawheight="1536" src="https://pic3.zhimg.com/v2-04c4230b63d027e86053c6344ea1f7ce_b.jpg" class="origin_image zh-lightbox-thumb" width="1152" data-original="https://pic3.zhimg.com/v2-04c4230b63d027e86053c6344ea1f7ce_r.jpg"&gt;</textarea>


                                <div class="zh-summary summary clearfix">
                                    <img data-rawwidth="720" data-rawheight="1080"
                                         src="https://pic3.zhimg.com/v2-67c1b23ae325bf59fe1edf61ee54a4a6_200x112.jpg"
                                         class="origin_image inline-img zh-lightbox-thumb"
                                         data-original="https://pic3.zhimg.com/v2-67c1b23ae325bf59fe1edf61ee54a4a6_r.jpg">
                                    先上图：我的窝，套内面积37.55平，家里住着两个人，其中一只是程序猿，一只画图狗。 在此分享一些小户型相关的居住经验 希望对大家有用！(///▽///)
                                    时常更新，多图预警！ 两个处女座折腾几个月小套一，终于有个像样的家了。 虽然自己是美术狗，但是题主说…

                                    <a href="${ctx}/question/24978401/answer/142026285"
                                       class="toggle-expand">显示全部</a>

                                </div>


                                <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                               data-tooltip="s$t$发布于 昨天 00:41" target="_blank"
                                                               href="${ctx}/question/24978401/answer/142026285">编辑于
                                    19:38</a></p>

                            </div>
                            <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                <div class="zm-meta-panel">

                                    <a data-follow="q:link" class="follow-link zg-follow meta-item" href="javascript:;"
                                       id="sfb-2173312"><i class="z-icon-follow"></i>关注问题</a>

                                    <a href="${ctx}/collection/60760155#" name="addcomment"
                                       class="meta-item toggle-comment js-toggleCommentBox">
                                        <i class="z-icon-comment"></i>346 条评论</a>


                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-thank" data-thanked="false"><i
                                            class="z-icon-thank"></i>感谢</a>


                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                       role="button" aria-expanded="false" style="-webkit-user-select: none;"
                                       tabindex="0" aria-haspopup="true">
                                        <div class="goog-inline-block goog-menu-button-outer-box">
                                            <div class="goog-inline-block goog-menu-button-inner-box">
                                                <div class="goog-inline-block goog-menu-button-caption"><i
                                                        class="z-icon-share"></i>分享
                                                </div>
                                                <div class="goog-inline-block goog-menu-button-dropdown">&nbsp;</div>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                    <span class="zg-bull zu-autohide">•</span>

                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                    <span class="zg-bull zu-autohide">•</span>
                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-report">举报</a>


                                    <meta name="copyrightStatus" content="0">
                                    <meta name="disableCopyAvatar"
                                          content="https://pic4.zhimg.com/f245c22011e949c1df9392937e440a1f_s.jpg">

                                    <span class="zg-bull">•</span>

                                    <a href="${ctx}/terms#sec-licence-6" target="_blank"
                                       class="meta-item copyright">禁止转载</a>


                                    <button class="meta-item item-collapse js-collapse">
                                        <i class="z-icon-fold"></i>收起
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="zm-item-meta-extra">
                            <a href="javascript:;" class="zg-unfollow" data-type="a" id="f-52339627-17095045"
                               name="unfavo">取消收藏</a>
                        </div>

                    </div>
                </div>

                <div class="zm-item" data-type="Answer" data-za-module="AnswerItem">
                    <h2 class="zm-item-title"><a target="_blank" href="${ctx}/question/31637529">有什么道理是开始注重外表几年后才能悟出来的？</a>
                    </h2>
                    <div class="zm-item-fav">
                        <div tabindex="-1" class="zm-item-answer " itemscope="" itemtype="http://schema.org/Answer"
                             data-aid="17075710" data-atoken="54173168" data-collapsed="0" data-created="1436269452"
                             data-deleted="0" data-isowner="0" data-helpful="1" data-copyable="0">
                            <link itemprop="url" href="${ctx}/question/31637529/answer/54173168">
                            <meta itemprop="answer-id" content="17075710">
                            <meta itemprop="answer-url-token" content="54173168">
                            <a class="zg-anchor-hidden" name="answer-17075710"></a>

                            <div class="zm-item-vote">
                                <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;"
                                   data-bind-votecount="">20K</a>
                            </div>

                            <div class="zm-votebar" data-za-module="VoteBar">
                                <button class="up" aria-pressed="false" title="赞同">
                                    <i class="icon vote-arrow"></i>
                                    <span class="count">20K</span>
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

    <a class="author-link" data-hovercard="p$t$sophiasophia" target="_blank"
       href="${ctx}/people/sophiasophia">Sophia</a></span><span title="公众号搜 : Sophia爱美补习社，不定期唠嗑爱美这件小事～"
                                                                               class="bio">
    公众号搜 : Sophia爱美补习社，不定期唠…
    </span>
    </span>
                                </div>

                                <div class="zm-item-vote-info" data-votecount="20443" data-async-voters="1"
                                     data-za-module="VoteInfo">


                                        <span class="voters text"><a href="${ctx}/collection/60760155#"
                                                                     class="more text"><span
                                                class="js-voteCount">20443</span>&nbsp;人赞同</a></span>


                                </div>
                            </div>
                            <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="4854228"
                                 data-action="/answer/content" data-author-name="Sophia"
                                 data-entry-url="/question/31637529/answer/54173168">

                                <textarea hidden="" class="content">&lt;b&gt;自控力和执行力，永远都是变美路上最大的秘诀。&lt;/b&gt;&lt;br&gt;&lt;br&gt;刚开始注重外表时，你可能会费尽心思地关注各种美妆达人只为找到一款护肤品能神奇地拯救自己油腻暗黄的皮肤；你可能在电脑硬盘里塞满郑多燕和形体训练视频，只为有朝一日能练出维密模特一样的身材；你可能会苦心研究各种养颜食谱，ctrl c+ctrl v保存下来，渴望撰写青春不老的传说。&lt;br&gt;&lt;br&gt;可事实呢？&lt;br&gt;&lt;br&gt;你宁愿熬夜看帖对其他菇凉姣好的脸蛋羡慕嫉妒恨也不愿关手机关电脑去睡个美容觉；你宁愿盯着Miranda Kerr妖娆的身段发呆也不愿行动起来练一段insanity或plank；你宁愿毁掉自己要减肥的誓言大快朵颐也不愿翻开自己搜集的食谱做一份营养餐。&lt;br&gt;&lt;br&gt;&lt;b&gt;你以为人与人之间颜值的区别就真的只是颜值的区别？你错了，只不过是自控力和执行力的差别，反映到了颜值上。&lt;/b&gt;&lt;br&gt;&lt;br&gt;所以，永远不要好奇为什么这世上永远都会有那么一拨人，既能保持美好的容貌，又能将事业经营得红红火火。他们的自控力，不仅让他们下定决心远离垃圾食品，而且还消灭掉各种试图干活偷懒的小心思；他们的执行力，不仅激励他们在健身房拼命挥汗，而且鞭策他们为一份完美的季度报表竭尽全力。令人羡慕的外表和事业，都是他们自控力和执行力的成果。&lt;br&gt;&lt;br&gt;还在刷知乎呢？啥都别说了，赶紧出门去健身房吧！&amp;lt;(￣︶￣)↗</textarea>


                                <div class="zh-summary summary clearfix">

                                    <b>自控力和执行力，永远都是变美路上最大的秘诀。</b>
                                    刚开始注重外表时，你可能会费尽心思地关注各种美妆达人只为找到一款护肤品能神奇地拯救自己油腻暗黄的皮肤；你可能在电脑硬盘里塞满郑多燕和形体训练视频，只为有朝一日能练出维密模特一样的身材；你可能会…

                                    <a href="${ctx}/question/31637529/answer/54173168"
                                       class="toggle-expand">显示全部</a>

                                </div>


                                <p class="visible-expanded"><a itemprop="url" class="answer-date-link meta-item"
                                                               data-tooltip="s$t$发布于 2015-07-07" target="_blank"
                                                               href="${ctx}/question/31637529/answer/54173168">编辑于
                                    2016-03-05</a></p>

                            </div>
                            <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                <div class="zm-meta-panel">

                                    <a data-follow="q:link" class="follow-link zg-follow meta-item" href="javascript:;"
                                       id="sfb-4854228"><i class="z-icon-follow"></i>关注问题</a>

                                    <a href="${ctx}/collection/60760155#" name="addcomment"
                                       class="meta-item toggle-comment js-toggleCommentBox">
                                        <i class="z-icon-comment"></i>450 条评论</a>


                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-thank" data-thanked="false"><i
                                            class="z-icon-thank"></i>感谢</a>


                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-share goog-inline-block goog-menu-button"
                                       role="button" aria-expanded="false" style="-webkit-user-select: none;"
                                       tabindex="0" aria-haspopup="true">
                                        <div class="goog-inline-block goog-menu-button-outer-box">
                                            <div class="goog-inline-block goog-menu-button-inner-box">
                                                <div class="goog-inline-block goog-menu-button-caption"><i
                                                        class="z-icon-share"></i>分享
                                                </div>
                                                <div class="goog-inline-block goog-menu-button-dropdown">&nbsp;</div>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>


                                    <span class="zg-bull zu-autohide">•</span>

                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-noHelp">没有帮助</a>

                                    <span class="zg-bull zu-autohide">•</span>
                                    <a href="${ctx}/collection/60760155#"
                                       class="meta-item zu-autohide js-report">举报</a>


                                    <meta name="copyrightStatus" content="0">
                                    <meta name="disableCopyAvatar"
                                          content="https://pic3.zhimg.com/9fe221e0ff08ff86bdefb883fd0d7806_s.png">

                                    <span class="zg-bull">•</span>

                                    <a href="${ctx}/terms#sec-licence-6" target="_blank"
                                       class="meta-item copyright">禁止转载</a>


                                    <button class="meta-item item-collapse js-collapse">
                                        <i class="z-icon-fold"></i>收起
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="zm-item-meta-extra">
                            <a href="javascript:;" class="zg-unfollow" data-type="a" id="f-17075710-17095045"
                               name="unfavo">取消收藏</a>
                        </div>

                    </div>
                </div>

            </div>

            <div class="border-pager">
                <div class="zm-invite-pager">
                    <span class="zg-gray-normal">上一页</span>
                    <span class="zg-gray-normal">1</span>
                    <span><a href="${ctx}/collection/60760155?page=2">2</a></span>
                    <span><a href="${ctx}/collection/60760155?page=3">3</a></span>
                    <span>...</span>
                    <span><a href="${ctx}/collection/60760155?page=12">12</a></span>
                    <span><a href="${ctx}/collection/60760155?page=2">下一页</a></span>
                </div>
            </div>
        </div>
    </div>

    <div class="zu-main-sidebar" data-za-module="RightSideBar">
        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <h3>关于创建者</h3>
                <a class="zm-list-avatar-link" href="${ctx}/people/guo-xiao-hu-47">
                    <img class="zm-list-avatar-medium"
                         src="https://pic3.zhimg.com/5e9fbaf3314270ae46eea42f99577e3e_m.jpg">
                </a>
                <div class="zm-list-content-medium" id="zh-single-answer-author-info">
                    <span class="zg-right"></span>
                    <h2 class="zm-list-content-title">
                        <a href="${ctx}/people/guo-xiao-hu-47" class="author-link">郭小虎</a>
                    </h2>
                    <div class="summary-wrapper summary-wrapper--short">
                        <span class="zg-gray-normal bio"></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <h3>收藏夹状态</h3>
                <div class="zg-gray-normal">
                    最近活动于 <span class="time">11:02</span>
                    <span class="zg-bull">•</span>
                    <a href="${ctx}/collection/60760155/log">查看收藏夹日志</a>
                </div>
                <div class="zg-gray-normal">
                    <a href="${ctx}/collection/60760155/followers">0</a> 人关注了该收藏夹
                </div>
            </div>
        </div>
        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <a href="${ctx}/collection/60760155#" id="zh-fav-list-side-bar-report"
                   name="report-favlist" class="zg-link-gray-normal" data-za-module="CollectionItem">举报收藏夹</a>
            </div>
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
