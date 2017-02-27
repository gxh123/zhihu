<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <title>我关注的收藏夹 - 知乎</title>
    <%--<link rel="stylesheet" href="${ctx}/assets/css/z1.css">--%>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
</head>

<body class="zhi ">

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
            <ul class="tab-navs">
                <li class="tab-nav active">
                    <a href="">我关注的收藏夹</a>
                </li>
                <li class="tab-nav ">
                    <a href="${ctx}/collections/mine">我创建的收藏夹</a>
                </li>
            </ul>

            <div id="zh-favlist-following-wrap">

                <div class="zm-item" id="mi-1484395062">
                    <h2 class="zm-item-title">
                        <a href="${ctx}/collection/28952031">汉纸菇凉の研究</a>
                        <span class="zg-num">124</span>
                    </h2>
                    <div class="zm-item-meta">
                        <div class="zm-item-meta-actions">
                            由
                            <a href="${ctx}/people/honghu" target="_blank" class="zg-link author-link" title="鸿鹄君">鸿鹄君
                            </a> 创建
                            <span class="zg-bull">•</span>
                            <span href="javavscript:;">532 条内容</span>
                            <span class="zg-bull">•</span>
                            <a class="zg-unfollow" href="${ctx}/collection/28952031/followers">3386人关注</a>
                            <span class="zg-bull">•</span>
                            <a href="javascript:;" name="focus" class="zg-unfollow" id="pq-3827428">取消关注</a>
                        </div>
                    </div>
                </div>

                <div class="zm-item" id="mi-1484010585">
                    <h2 class="zm-item-title">

                        <a href="${ctx}/collection/40941884">脑洞即是正义</a>


                        <span class="zg-num">52</span>


                    </h2>
                    <div class="zm-item-meta">
                        <div class="zm-item-meta-actions">
                            由 <a data-hovercard="p$t$zhang-jian-jian-8"
                                 href="${ctx}/people/zhang-jian-jian-8" target="_blank"
                                 class="zg-link author-link" title="张贱贱">张贱贱</a> 创建<span class="zg-bull">•</span>
                            <span href="javavscript:;">192 条内容</span>

                            <span class="zg-bull">•</span>
                            <a class="zg-unfollow" href="${ctx}/collection/40941884/followers">4243
                                人关注</a>


                            <span class="zg-bull">•</span>

                            <a href="javascript:;" name="focus" class="zg-unfollow" id="pq-9169299">取消关注</a>


                        </div>
                    </div>
                </div>

            </div>
            <a href="javascript:;" id="zh-load-more" class="zg-btn-white zg-r3px zu-button-more" style="display: none;">更多</a>

        </div>
    </div>

    <div class="zu-main-sidebar" data-za-module="RightSideBar">
        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <div class="zm-side-nav-group">
                    <ul class="zm-side-nav" id="zg-sidebar-nav">
                        <li class="zm-side-nav-li">
                            <a class="zm-side-nav-link active" href=""
                               data-za-c="collection" data-za-l="sidebar_collections" data-za-a="visit_collections">
                                <i class="zg-icon zg-icon-sidenav-fav"></i>
                                我的收藏
                                <%--<span class="zg-num">299</span>--%>
                            </a>
                        </li>
                        <li class="zm-side-nav-li">
                            <a class="zm-side-nav-link" href="${ctx}/question/following">
                                <i class="zg-icon zg-icon-sidenav-follow"></i>
                                我关注的问题
                            </a>
                        </li>
                        <%--<li class="zm-side-nav-li">--%>
                            <%--<a class="zm-side-nav-link" href="${ctx}/question/invited">--%>
                                <%--<i class="zg-icon zg-icon-sidenav-invite"></i>--%>
                                <%--邀请我回答的问题--%>
                                <%--<span class="zg-num">2</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <a href="${ctx}/collections#" id="zh-list-create-new-list">+ 创建收藏夹</a>
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
