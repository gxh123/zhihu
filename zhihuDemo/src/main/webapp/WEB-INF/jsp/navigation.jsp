<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script src="${ctx}/assets/js/sockjs/sockjs.min.js"></script>
</head>
<body>
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
                                                                    aria-autocomplete="list" data-prev="" type="text">
                <button type="submit" class="zu-top-search-button"><span class="hide-text">搜索</span><span
                        class="sprite-global-icon-magnifier-dark"></span></button>
                <div style="-moz-user-select: none; display: none;" class="ac-renderer" role="listbox" id=":2h" aria-expanded="false" data-za-module="SearchResultList">

                    <div class="zu-autocomplete-row-label ac-row" id="search-users" style="display: none">用户</div>

                    <div class="zu-autocomplete-row-label ac-row" id="search-questions" style="display: none">内容</div>
                    <%--<div class="ac-row" id=":7x" role="option" data-za-module="QuestionItem" data-za-index="" style="-moz-user-select: none;">--%>
                        <%--<a class="zm-ac-link" href="/question/47735306" style="-moz-user-select: none;">如何评价“武大炮王”？--%>
                            <%--<span class="zm-ac-gray" style="-moz-user-select: none;">379 个回答</span>--%>
                        <%--</a>--%>
                    <%--</div>--%>

                    <div class="ac-row zu-autocomplete-row-search-link" id=":85" role="option" style="-moz-user-select: none;">
                        <a href="/search?q=王&amp;type=question" data-za-element-name="ViewAll" style="-moz-user-select: none;">查看全部搜索结果
                            <i class="zg-icon arrow" style="-moz-user-select: none;"></i>
                        </a>
                    </div>
                </div>
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

<template id="search_result_user">
    <div class="ac-row searchItem" role="option" data-za-module="UserItem" data-za-index="" style="-moz-user-select: none;">
        <a href="" class="zm-ac-link zm-ac-link-people" style="-moz-user-select: none;">
            <img class="zm-item-img-avatar zg-left" src="" style="-moz-user-select: none;">
            <div class="zu-autocomplete-row-name" style="-moz-user-select: none;">
                <span class="icon icon-badge icon-badge-id-an" style="-moz-user-select: none;"></span>
            </div>
            <div class="zu-autocomplete-row-description" style="-moz-user-select: none;">
                <%--<span class="badge-summary" style="-moz-user-select: none;">昆士兰大学 心理学博士</span>--%>
                <span class="zg-gray-normal bio" style="-moz-user-select: none;">一句话介绍</span>
            </div>
        </a>
    </div>
</template>

<template id="search_result_question">
    <div class="ac-row searchItem" role="option" data-za-module="QuestionItem" data-za-index="" style="-moz-user-select: none;">
        <a class="zm-ac-link" href="" style="-moz-user-select: none;">
            <span class="zm-ac-gray" style="-moz-user-select: none;">241 个回答</span>
        </a>
    </div>
</template>

<script>
    $('.zu-top-search-input').bind('input propertychange', function() {
//        alert($(this).val().length + ' characters');
        var params = $.trim($(this).val());
        if(params == ""){
            $('.ac-renderer').css("display","none");
        }else{
            $('.ac-renderer').css("display","block");
        }
        if(params != $(this).attr("data-prev") && params != ""){
            $('.searchItem').remove();   //删除原来的
            $(this)[0].setAttribute("data-prev",params);
            $.get("${ctx}/search?params=" + params, function(data){
                var users = data.user;
                if(users.length > 0){
                    $('#search-users').css("display","block");
                    for(var i = 0; i<users.length;i++){
                        var add_user = document.querySelector('#search_result_user');
                        add_user.content.querySelector('img').setAttribute("src", users[i].avatar);   //2
                        add_user.content.querySelector('a').setAttribute( "href",'${ctx}/user/'+users[i].id);  //1
                        add_user.content.querySelector('.zu-autocomplete-row-name').innerHTML = users[i].name;  //3
                        add_user.content.querySelector('.zg-gray-normal').innerHTML = "一句话介绍";
                        document.querySelector('.ac-renderer').insertBefore(add_user.content.cloneNode(true),document.querySelector('#search-questions'));
                    }
                }else{
                    $('#search-users').css("display","none");
                }
                var questions = data.question;
                if(questions.length>0){
                    $('#search-questions').css("display","block");
                    for(var i = 0; i<questions.length;i++){
                        var add_question = document.querySelector('#search_result_question');
                        add_question.content.querySelector('a').setAttribute( "href",'${ctx}/question/'+questions[i].id);  //1
                        add_question.content.querySelector('.zm-ac-link').innerHTML = questions[i].title;
                        document.querySelector('.ac-renderer').insertBefore(add_question.content.cloneNode(true),document.querySelector('.zu-autocomplete-row-search-link'));
                    }
                }else{
                    $('#search-questions').css("display","none");
                }

            });
        }
    });

    $('.zu-top-nav-userinfo').hover(
            function() {
                $('.zu-top-nav-userinfo').addClass("selected");
                $('.top-nav-dropdown').css("display","block");
            },function() {
                $('.zu-top-nav-userinfo').removeClass("selected");
                $('.top-nav-dropdown').css("display","none");
            });

    $('.top-nav-dropdown').hover(
            function() {
                $('.zu-top-nav-userinfo').addClass("selected");
                $('.top-nav-dropdown').css("display","block");
            },function() {
                $('.zu-top-nav-userinfo').removeClass("selected");
                $('.top-nav-dropdown').css("display","none");
            });
    $('.top-nav-dropdown a').hover(function() {
        $(this).css("background-color","#0267cc");
    },function() {
        $(this).css("background-color","#095fb3");
    });


    <%--var sock = new SockJS('${ctx}/sockjs/webSocketServer');--%>
    <%--sock.onopen = function() {--%>
    <%--};--%>
    <%--sock.onmessage = function(e) {--%>
        <%--if (e.data > 0) {--%>
            <%--$('#zh-top-nav-new-pm').text(e.data);--%>
            <%--$('#zh-top-nav-new-pm').css("visibility", "visible");--%>
            <%--$('#zh-top-nav-pm-count').text(e.data);--%>
            <%--$('#zh-top-nav-pm-count').css("visibility", "visible");--%>
        <%--}else{--%>
            <%--$('#zh-top-nav-new-pm').css("visibility", "hidden");--%>
            <%--$('#zh-top-nav-pm-count').css("visibility", "hidden");--%>
        <%--}--%>
    <%--};--%>
    <%--sock.onclose = function() {--%>
    <%--};--%>
</script>
</body>
</html>
