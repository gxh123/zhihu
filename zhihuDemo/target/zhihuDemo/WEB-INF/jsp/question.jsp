<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <meta name="referrer" content="never">
    <title>问题 - 知乎</title>

    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/wangEditor/wangEditor.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
    <link rel="stylesheet" href="${ctx}/assets/css/wangEditor/wangEditor.css">
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

<div class="zg-wrap zu-main clearfix with-indention-votebar" id="zh-single-question-page"  role="main">
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <%--所属话题--%>
                <div class="zm-tag-editor zg-section">
                    <div class="zm-tag-editor-labels zg-clear">
                        <a class="zm-item-tag"
                           <%--href="/topic/${question.topic.id}">--%>
                            <%--question.topic.name--%>
                           href="${ctx}/topic/111">
                            这是一个topic
                        </a>
                    </div>
                </div>
                <%--问题title--%>
                <div id="zh-question-title">
                    <h2 class="zm-item-title">
                        <span class="zm-editable-content">${question.title}</span>
                    </h2>
                </div>
                <%--问题content--%>
                <div id="zh-question-detail" class="zm-item-rich-text">
                    <div class="zm-editable-content">${question.content}</div>
                </div>
                <%--评论，分享，邀请回答等操作--%>
                <div class="zm-item-meta zm-item-comment-el clearfix" id="zh-question-meta-wrap">
                    <div class="zm-meta-panel">
                        <a href="#" name="report-question" class="report zg-right">
                            <i class="z-icon-report-o"></i>举报</a>
                        <a href="#" name="addcomment" class="toggle-comment meta-item">
                            <i class="z-icon-comment"></i>添加评论
                        </a>
                        <a href="#" name="share" class="share meta-item">
                            <i class="z-icon-share"></i>分享
                        </a>
                        <span class="zg-bull">&bull;</span>
                        <a href="#" name="invite" class="meta-item">邀请回答</a>
                    </div>
                    <div class="panel-container">
                    </div>
                </div>

                <div class="zh-answers-title clearfix">
                    <div id="zh-answers-filter" class="Sorter">
                        <span class="lbl">默认排序</span>
                        <a class="lbl" href="${ctx}/question/29092821?sort=created">按时间排序</a>
                        <i class="zg-icon zg-icon-double-arrow"></i>
                    </div>
                    <h3 data-num="9" id="zh-question-answer-num">9 个回答</h3>
                </div>

                <div id="zh-question-answer-wrap">

                    <c:forEach items="${question.answers}" var="answer" varStatus="varStatus">
                        <!--答案1-->
                        <div tabindex="-1" class="zm-item-answer  zm-item-expanded">
                            <a class="zg-anchor-hidden" name="answer-12835789"></a>
                            <%--<div class="zm-votebar" id="${answer.id}">--%>
                                <%--<button class="up">--%>
                                    <%--<i class="icon vote-arrow"></i>--%>
                                    <%--<span class="count">${answer.agreements}</span>--%>
                                    <%--<span class="label sr-only">赞同</span>--%>
                                <%--</button>--%>
                                <%--<button class="down ">--%>
                                    <%--<i class="icon vote-arrow"></i>--%>
                                    <%--<span class="label sr-only">反对</span>--%>
                                <%--</button>--%>
                            <%--</div>--%>

                            <div class="zm-votebar goog-scrollfloater"  id="${answer.id}">
                                <c:if test="${answer.isAgreed == true}">
                                    <button class="up pressed" aria-pressed="false"  title="已赞同">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">${answer.agreements}</span>
                                        <span class="label sr-only">已赞同</span>
                                    </button>
                                </c:if>
                                <c:if test="${answer.isAgreed == false}">
                                    <button class="up" aria-pressed="false" title="赞同">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count">${answer.agreements}</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                </c:if>
                                <c:if test="${answer.isDisagreed == true}">
                                    <button class="down pressed" aria-pressed="false" title="已反对">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">已反对</span>
                                    </button>
                                </c:if>
                                <c:if test="${answer.isDisagreed == false}">
                                    <button class="down" aria-pressed="false" title="反对，不会显示你的姓名">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </c:if>
                                    <%--<button class="down" aria-pressed="false" title="反对，不会显示你的姓名">--%>
                                    <%--<i class="icon vote-arrow"></i>--%>
                                    <%--<span class="label sr-only">反对，不会显示你的姓名</span>--%>
                                    <%--</button>--%>
                            </div>

                            <div class="answer-head">
                                <div class="zm-item-answer-author-info">
                                    <a class="zm-item-link-avatar avatar-link" href="${ctx}/user/${answer.answerer.id}" target="_blank">
                                        <img src="${answer.answerer.avatar}" class="zm-list-avatar avatar">
                                    </a>
                                    <span class="summary-wrapper">
                                        <span class="author-link-line">
                                            <a class="author-link" target="_blank" href="${ctx}/user/${answer.answerer.id}">${answer.answerer.name}</a>
                                        </span>
                                    </span>
                                </div>
                                <div class="zm-item-vote-info">
                                    <span class="voters text"><a href="#" class="more text"><span class="js-voteCount">${answer.agreements}</span>&nbsp;人赞同</a></span>
                                </div>
                            </div>
                            <div class="zm-item-rich-text expandable js-collapse-body" >
                                <div class="zh-summary summary clearfix" style="display:none;">
                                    ${answer.content}
                                    <a href="${ctx}/question/${question.id}/answer/${answer.id}" class="toggle-expand">显示全部</a>
                                </div>
                                <div class="zm-editable-content clearfix">
                                    ${answer.content}
                                </div>
                            </div>
                            <a class="zg-anchor-hidden ac" name="12835789-comment"></a>
                            <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                <div class="zm-meta-panel">
                                    <a itemprop="url" class="answer-date-link meta-item" target="_blank" href="${ctx}/question/${question.id}/answer/${answer.id}">编辑于
                                        <script type="text/javascript">timeStamp2String(${answer.createDate})</script></a>
                                    <a href="#" name="addcomment" class="meta-item toggle-comment js-toggleCommentBox"><i class="z-icon-comment"></i>7 条评论</a>
                                    <a href="#" class="meta-item zu-autohide js-thank" data-thanked="false"><i class="z-icon-thank"></i>感谢</a>
                                    <a href="#" class="meta-item zu-autohide js-share"><i class="z-icon-share"></i>分享</a>
                                    <a href="#" class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>
                                    <span class="zg-bull zu-autohide">&bull;</span>
                                    <a href="#" class="meta-item zu-autohide js-noHelp">没有帮助</a>
                                    <span class="zg-bull zu-autohide">&bull;</span>
                                    <a href="#" class="meta-item zu-autohide js-report">举报</a>
                                    <%--<meta name="copyrightStatus" content="2">--%>
                                    <%--<meta name="disableCopyAvatar" content="https://pic4.zhimg.com/22d970137c9739e644ac79c75dca965f_s.jpg">--%>
                                    <span class="zg-bull">&bull;</span>
                                    <a href="${ctx}/copyright/apply?answer=43603899" target="_blank" class="meta-item copyright">申请转载</a>
                                </div>
                            </div>
                        </div>
                        <!--答案1结束-->
                    </c:forEach>

                </div>

                <%--写答案--%>
                    <div class="zm-editable-editor-wrap" style="">
                        <div class="zh-answer-form clearfix">
                            <a href="${ctx}/user/${user.id}" class="zm-item-link-avatar">
                                <img src="${user.avatar}" class="zm-list-avatar">
                            </a>
                            <div>
                                <div class="zu-answer-form-title">
                                    <a href="${ctx}/user/${user.id}">${user.name}</a>
                            <span style="font-weight: normal">，学生
                                <a name="edit_bio" class="zu-edit-button" href="#"></a>
                            </span>
                                </div>
                            </div>
                        </div>
                        <!--此处放入编辑器-->
                        <div id="editor-container" class="container" style="width: 100%;margin: 0 auto;position: relative;padding-left: 0;padding-right: 0;">
                            <div id="editor-trigger" style="height: 250px;"></div>
                        </div>
                        <%---------------%>
                        <div class="zm-command clearfix">
                            <label class="zg-left anno-box" style="-moz-user-select: none;font-weight: normal">
                                <input name="anno-checkbox" style="-moz-user-select: none;" type="checkbox"> 匿名
                                <span style="-moz-user-select: none;">&nbsp;</span>
                            </label>
                            <label class="zg-left copyright-box" style="font-weight: normal">
                                <select name="copyright">
                                    <option value="1">允许规范转载</option>
                                    <option value="2">允许付费转载</option>
                                    <option value="0">禁止转载</option>
                                </select>
                                <a href="/terms#sec-licence-6" class="demo-trigger" target="_blank" hidden="hidden">
                                    <i class="zg-icon zg-icon-question-mark" style="margin-left: 5px;" id="copyright_question_mark" data-copyright-demo="true">
                                    </i>
                                </a>
                            </label>
                            <span class=" zg-right"><a class="submit-button zg-btn-blue" name="save" href="javascript:">发布回答</a></span>
                            <!--<div class="draft-controls zg-right ">-->
                            <!--<span class="draft-saved-info" style="display: none;">-->
                            <!--<a class="draft-clear-button goog-inline-block" href="#" data-tooltip="s$b$删除草稿">-->
                            <!--<i class="zg-icon zg-icon-bin"></i>-->
                            <!--<span class="hide-text">清除草稿</span>-->
                            <!--</a>-->
                            <!--<span class="draft-saved-time">保存中…</span>-->
                            <!--</span>-->
                            <!--</div>-->
                        </div>

                    </div>
            </div>
        </div>


        <div class="zu-main-sidebar" data-za-module="RightSideBar">

            <div class="zm-side-section">
                <div class="zm-side-section-inner" id="zh-question-side-header-wrap">

                    <c:if test="${question.isFollowed == true}">
                        <button  class="follow-button zg-follow zg-btn-white" id="follow-button">已关注</button>
                    </c:if>
                    <c:if test="${question.isFollowed == false}">
                        <button  class="follow-button zg-follow zg-btn-green" id="follow-button">关注问题</button>
                    </c:if>

                    <div class="zh-question-followers-sidebar">
                        <div class="zg-gray-normal">
                            <a href="${ctx}/question/29092821/followers"><strong>33</strong></a>人关注该问题
                        </div>

                        <div class="list zu-small-avatar-list zg-clear">
                            <a title="潭子"
                               data-hovercard="p$t$tan-zi-36-59"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/tan-zi-36-59">
                                <img src="https://pic2.zhimg.com/53c3e02c9_s.jpg" class="zm-item-img-avatar">
                            </a>

                            <a title="陈昱光"
                               data-hovercard="p$t$chen-yu-guang-53"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/chen-yu-guang-53">
                                <img src="https://pic1.zhimg.com/292e4ab639f77c5594ed02adb974b6e8_s.jpg"
                                     class="zm-item-img-avatar">
                            </a>

                            <a title="兮伯青德"
                               data-hovercard="p$t$qqyin"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/qqyin">
                                <img src="https://pic1.zhimg.com/v2-d0cbe32d32eacde39eefca4b33210ae0_s.jpg"
                                     class="zm-item-img-avatar">
                            </a>

                            <a title="穷一"
                               data-hovercard="p$t$qiong-yi"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/qiong-yi">
                                <img src="https://pic1.zhimg.com/da8e974dc_s.jpg" class="zm-item-img-avatar">
                            </a>

                            <a title="刘博洋"
                               data-hovercard="p$t$spto"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/spto">
                                <img src="https://pic4.zhimg.com/22d970137c9739e644ac79c75dca965f_s.jpg"
                                     class="zm-item-img-avatar">
                            </a>

                            <a title="一菱智魂酱"
                               data-hovercard="p$t$tu-hun-tu-hun-di-yong-shi"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/tu-hun-tu-hun-di-yong-shi">
                                <img src="https://pic3.zhimg.com/v2-1a1fb9f30898ebe8f1172b5a4545b212_s.jpg"
                                     class="zm-item-img-avatar">
                            </a>

                            <a title="李雨珊"
                               data-hovercard="p$t$qia-rong-56"
                               class="zm-item-link-avatar"
                               href="${ctx}/user/qia-rong-56">
                                <img src="https://pic1.zhimg.com/d4bdb45168af5b554cb75072ea284aa4_s.jpg"
                                     class="zm-item-img-avatar">
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<template id="add_answer">
    <div tabindex="-1" class="zm-item-answer  zm-item-expanded">
        <a class="zg-anchor-hidden" name="answer-12835789"></a>
        <div class="zm-votebar">
            <button class="up ">
                <i class="icon vote-arrow"></i>
                <span class="count"></span>
                <span class="label sr-only">赞同</span>
            </button>
            <button class="down ">
                <i class="icon vote-arrow"></i>
                <span class="label sr-only">反对</span>
            </button>
        </div>

        <div class="answer-head">
            <div class="zm-item-answer-author-info">
                <a class="zm-item-link-avatar avatar-link" href="" target="_blank">
                    <img src="" class="zm-list-avatar avatar">
                </a>
                <span class="summary-wrapper">
                    <span class="author-link-line">
                        <a class="author-link" target="_blank" href=""></a>
                    </span>
                </span>
            </div>
            <div class="zm-item-vote-info">
                <span class="voters text"><a href="#" class="more text"><span class="js-voteCount"></span>&nbsp;人赞同</a></span>
            </div>
        </div>
        <div class="zm-item-rich-text expandable js-collapse-body" >
            <%--<div class="zh-summary summary clearfix" style="display:none;">--%>
                <%--${answer.content}--%>
                <%--<a href="/question/${question.id}/answer/${answer.id}" class="toggle-expand">显示全部</a>--%>
            <%--</div>--%>
            <div class="zm-editable-content clearfix"></div>
        </div>
        <a class="zg-anchor-hidden ac" name="12835789-comment"></a>
        <div class="zm-item-meta answer-actions clearfix js-contentActions">
            <div class="zm-meta-panel">
                <a itemprop="url" class="answer-date-link meta-item" target="_blank" href="#"></a>
                <a href="#" name="addcomment" class="meta-item toggle-comment js-toggleCommentBox"><i class="z-icon-comment"></i>7 条评论</a>
                <a href="#" class="meta-item zu-autohide js-thank" data-thanked="false"><i class="z-icon-thank"></i>感谢</a>
                <a href="#" class="meta-item zu-autohide js-share"><i class="z-icon-share"></i>分享</a>
                <a href="#" class="meta-item zu-autohide js-collect"><i class="z-icon-collect"></i>收藏</a>
                <span class="zg-bull zu-autohide">&bull;</span>
                <a href="#" class="meta-item zu-autohide js-noHelp">没有帮助</a>
                <span class="zg-bull zu-autohide">&bull;</span>
                <a href="#" class="meta-item zu-autohide js-report">举报</a>
                <span class="zg-bull">&bull;</span>
                <a href="/copyright/apply?answer=43603899" target="_blank" class="meta-item copyright">申请转载</a>
            </div>
        </div>
    </div>
</template>

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

    $(".follow-button").click(function () {
        if($("#follow-button").text() == '关注问题'){
            $("#follow-button").removeClass("zg-btn-green");
            $("#follow-button").addClass("zg-btn-white");
            $("#follow-button").text('已关注');
            $.post("${ctx}/followQuestion", {objectId : ${question.id}}, function(data){

            });
        }else{
            $("#follow-button").removeClass("zg-btn-white");
            $("#follow-button").addClass("zg-btn-green");
            $("#follow-button").text('关注问题');
            $.post("${ctx}/unfollowQuestion", {objectId : ${question.id}}, function(data){

            });
        }
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

    $(".submit-button").click(function () {
        var content = $("#editor-trigger").html();
        $.post(
                '${ctx}/answer/add',
                {
                    question_id: ${question.id},
                    answer_content: content,
                    answer_time:getNowFormatDate()
                },
                function(data){
                    var add_answer = document.querySelector('#add_answer');
                    add_answer.content.querySelector('.zm-votebar .up .count').innerHTML = 0;
                    add_answer.content.querySelector('.zm-item-link-avatar').setAttribute( "href",'${ctx}/user/${user.id}');
                    add_answer.content.querySelector('img').setAttribute("src", data['answerer'].avatar);
                    add_answer.content.querySelector('.author-link').setAttribute( "href", '${ctx}/user/${user.id}');
                    add_answer.content.querySelector('.author-link').innerHTML = data['answerer'].name;
                    add_answer.content.querySelector('.js-voteCount').innerHTML = 0;
                    add_answer.content.querySelector('.zm-editable-content').innerHTML = data['content'];
                    add_answer.content.querySelector('.answer-date-link').innerHTML = '编辑于' + timeStamp2String(data['createDate']);
                    document.querySelector('#zh-question-answer-wrap').appendChild(add_answer.content.cloneNode(true));
                });
    });

    function timeStamp2String (time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1;
        var date = datetime.getDate();
        var hour = datetime.getHours();
        var minute = datetime.getMinutes();
        var second = datetime.getSeconds();
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    };

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + date.getHours() + seperator2 + date.getMinutes()
                + seperator2 + date.getSeconds();
        return currentdate;
    }

    function changeImgSrc() {
        var img = document.getElementsByTagName('img');
        for(i = 0; i<img.length; i++){
            if(img[i].getAttribute("src").indexOf("whitedot.jpg")!= -1)
            img[i].setAttribute("src",img[i].getAttribute("data-actualsrc"));
        }
    }


    $(function () {
//        $("#follow-button").text('关注问题');   //不知道为什么text()判断的不对
        changeImgSrc();

        var editor = new wangEditor('editor-trigger');

        // 自定义菜单
        editor.config.menus = [
            'bold', 'underline', 'italic', 'strikethrough', 'eraser', 'forecolor', 'bgcolor', '|', 'quote', 'fontfamily', 'fontsize', 'head', 'unorderlist',
            'orderlist', '|', 'link', 'unlink', '|', 'table', 'emotion', '|', 'img', 'video', 'location', 'insertcode', '|', 'undo', 'redo', 'fullscreen'
        ];

        // 上传图片
        editor.config.uploadImgUrl = '${ctx}/upload';
        editor.config.uploadImgFns.onload = function (resultText, xhr) {
            var originalName = editor.uploadImgOriginalName || '';
            editor.command(null, 'insertHtml', '<img src="' + resultText + '" alt="' + originalName + '" style="max-width:100%;"/>');
        };

        // 表情显示项
        editor.config.emotionsShow = 'value';
        editor.config.emotions = {
            'default': {
                title: '默认',
                data: '${ctx}/assets/emotions.data'
            }
        };
        editor.create();
    });

</script>
</body>
</html>
