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
    <title>首页 - 知乎</title>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
    <script>
        function timeStamp2String(time){
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
</head>

<body class="zhi">
<jsp:include page="navigation.jsp"></jsp:include>
<div class="zg-wrap zu-main clearfix " role="main">
    <!--网页中间主要内容-->
    <div class="zu-main-content">
        <div class="zu-main-content-inner">

            <!--最新动态-->
            <div class="zg-section" id="zh-home-list-title">
                <i class="zg-icon zg-icon-feedlist"></i>
                最新动态 <input id="is-topstory" type="hidden">
            </div>
            <div class="zu-main-feed-con navigable" id="zh-question-list">
                <div id="js-home-feed-list" class="zh-general-list topstory clearfix" >
                    <!------------------------------------------------------------------------------------------------------------------------------------------->
                    <!--feed list-->
                    <c:forEach items="${feeds}" var="feed">
                    <div class="feed-item folding feed-item-hook">
                        <div class="feed-item-inner">
                            <!--回答者头像-->
                            <div class="avatar">
                                <a  class="zm-item-link-avatar" target="_blank" href="${ctx}/user/${feed.creator.id}">
                                    <img src="${feed.creator.avatar}" class="zm-item-img-avatar">
                                </a>
                            </div>
                            <div class="feed-main">
                                <div class="feed-source" >
                                    <a href="${ctx}/user/${feed.creator.id}" target="_blank">${feed.creator.name}</a> ${feed.action}了
                                    <c:choose>
                                        <c:when test="${feed.objectType == '答案'}">答案</c:when>
                                        <c:when test="${feed.objectType == '问题'}">问题</c:when>
                                    </c:choose>
                                    <span class="zg-bull">•</span>
                                    <span class="time"><script>document.write(timeStamp2String(${feed.createTime}));</script></span>
                                </div>

                                <div class="feed-content zm-item-expanded">
                                    <!--问题标题-->
                                    <h2 class="feed-title">
                                        <c:choose>
                                            <c:when test="${feed.objectType == '问题'}">
                                                <a class="question_link" href="${ctx}/question/${feed.object.id}" target="_blank">
                                                ${feed.object.title}
                                                </a>
                                            </c:when>
                                            <c:when test="${feed.objectType == '答案'}">
                                                <a class="question_link" href="${ctx}/question/${feed.object.question.id}" target="_blank">
                                                ${feed.object.question.title}
                                                </a>
                                            </c:when>
                                        </c:choose>
                                    </h2>

                                    <c:if test="${feed.objectType == '答案'}">
                                    <div class="expandable entry-body">
                                        <div class="zm-votebar goog-scrollfloater"  id="${feed.object.id}">
                                            <c:if test="${feed.object.isAgreed == true}">
                                                <button class="up pressed" aria-pressed="false"  title="已赞同">
                                                    <i class="icon vote-arrow"></i>
                                                    <span class="count">${feed.object.agreements}</span>
                                                    <span class="label sr-only">已赞同</span>
                                                </button>
                                            </c:if>
                                            <c:if test="${feed.object.isAgreed == false}">
                                                <button class="up" aria-pressed="false" title="赞同">
                                                    <i class="icon vote-arrow"></i>
                                                    <span class="count">${feed.object.agreements}</span>
                                                    <span class="label sr-only">赞同</span>
                                                </button>
                                            </c:if>
                                            <c:if test="${feed.object.isDisagreed == true}">
                                                <button class="down pressed" aria-pressed="false" title="已反对">
                                                    <i class="icon vote-arrow"></i>
                                                    <span class="label sr-only">已反对</span>
                                                </button>
                                            </c:if>
                                            <c:if test="${feed.object.isDisagreed == false}">
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
                                        <div class="zm-item-answer-author-info">
                                                <span class="summary-wrapper">
                                                    <span class="author-link-line">
                                                        <a class="author-link" target="_blank" href="${ctx}/user/${feed.object.answerer.id}">${feed.object.answerer.name}</a>
                                                    </span>
                                                    <span title="一句话简介" class="bio">
                                                        一句话简介
                                                    </span>
                                                </span>
                                        </div>

                                        <div class="zm-item-vote-info">
                                                <span class="voters text">
                                                    <a href="#" class="more text">
                                                        <span class="js-voteCount">${feed.object.agreements}</span>&nbsp;人赞同
                                                    </a>
                                                </span>
                                        </div>
                                        <div class="zm-item-rich-text expandable js-collapse-body"
                                             data-resourceid="12737099" data-action="/answer/content"
                                             data-author-name="念念" data-entry-url="/question/51299107/answer/127707462">

                                            <div>${feed.object.content}
                                            </div>
                                                <textarea class="content" hidden="">${feed.object.content}
                                                </textarea>

                                            <%--<div class="zh-summary summary clearfix" style="display: none;">--%>
                                                <%--大概是十年前，第一次见到现实中的单挑。--%>
                                                <%--当时初中毕业到澳洲上高中，语言学校的时候有一群韩国人总是特别张扬，领头的一个总喜欢没事找事。华人学生大多比较乖孩子，就算被他们招惹也都默默忍让了。--%>
                                                <%--我们班上有个新来的中国男生气场不太一样，感觉上应该是…--%>
                                                <%--<a href="${ctx}/question/51299107/answer/127707462" class="toggle-expand">显示全部</a>--%>
                                            <%--</div>--%>

                                            <p class="visible-expanded">
                                                <a itemprop="url" class="answer-date-link meta-item"  target="_blank"
                                                   href="${ctx}/answer/${feed.object.id}">编辑于<script>document.write(timeStamp2String(${feed.object.modifyDate.getTime()}));</script>
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                    </c:if>

                                    <div class="feed-meta">
                                        <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                            <div class="zm-meta-panel">
                                                <c:choose>
                                                    <c:when test="${feed.objectType == '问题'}">
                                                        <a class="follow-link zg-follow meta-item" href="javascript:;" id="${feed.object.id}">
                                                            <c:if test="${feed.object.isFollowed == true}">取消关注</c:if>
                                                            <c:if test="${feed.object.isFollowed == false}"><i class="z-icon-follow"></i>关注问题</c:if>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${feed.objectType == '答案'}">
                                                        <a class="follow-link zg-follow meta-item" href="javascript:;" id="${feed.object.question.id}">
                                                            <c:if test="${feed.object.question.isFollowed == true}">取消关注</c:if>
                                                            <c:if test="${feed.object.question.isFollowed == false}"><i class="z-icon-follow"></i>关注问题</c:if>
                                                        </a>
                                                    </c:when>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${feed.objectType == '问题'}">
                                                        <a href="###" name="addcomment" class="meta-item toggle-comment js-toggleCommentBox" id="question_${feed.object.id}">
                                                            <i class="z-icon-comment"></i>442 条评论
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${feed.objectType == '答案'}">
                                                        <a href="###" name="addcomment" class="meta-item toggle-comment js-toggleCommentBox" id="answer_${feed.object.id}">
                                                            <i class="z-icon-comment"></i>442 条评论
                                                        </a>
                                                    </c:when>
                                                </c:choose>


                                                <a href="javascript:void(0)" class="meta-item zu-autohide js-thank" data-thanked="false">
                                                    <i class="z-icon-thank"></i>感谢
                                                </a>

                                                <a href="#" class="meta-item zu-autohide js-collect">
                                                    <i class="z-icon-collect"></i>收藏
                                                </a>

                                                <div style="display: block; position: static; top: auto; right: auto; bottom: auto; left: auto; float: right; visibility: hidden;width: 57px; height: 25px;">

                                                </div>
                                                <button class="meta-item item-collapse js-collapse is-sticky"
                                                        style="left: 1046.5px; top: auto; bottom: 12px;">
                                                    <i class="sprite-global-icon-fold-white"></i>收起
                                                </button>
                                            </div>
                                            <div class="comment-app-holder" style="display: none">
                                                <div class="CommentBox_root CommentBox_bordered">
                                                    <!--<i class="icon icon-spike" style="left: 144px;"></i>-->
                                                    <div class="CommentBox_list">
                                                        <div class="CommentItem_root" tabindex="-1" aria-label="Stan的评论">
                                                            <a href="http://www.zhihu.com/people/stan-45-90"
                                                               target="_blank" tabindex="-1" class="CommentItem_avatarLink hidden-phone">
                                                                <img tabindex="-1" class="Avatar Avatar-s" src="http://localhost:8080/zhihuDemo/assets/img/avatars/7.jpg">
                                                            </a>
                                                            <div class="CommentItem_body">
                                                                <div class="CommentItem_header">
                                                                    <a href="http://www.zhihu.com/people/stan-45-90" target="_blank">Stan</a>
                                                                </div>
                                                                <div class="CommentItem_content">
                                                                    哈哈哈哈
                                                                </div>
                                                                <div class="CommentItem_footer clearfix">
                                                                    <span class="_CommentItem_likes_2hey" data-tooltip="s$r$0 人觉得这个很赞" hidden="">
                                                                        <span>0</span><span> 赞</span>
                                                                    </span>
                                                                    <time title="2017-01-20 11:35:19">
                                                                        17 天前
                                                                    </time>
                                                                    <button class="CommentItem_action CommentBox_textButton">
                                                                        <i class="zg-icon zg-icon-comment-reply"></i>
                                                                        <span>回复</span></button>
                                                                    <button class="CommentItem_action CommentBox_textButton">
                                                                        <i class="zg-icon zg-icon-comment-like"></i>
                                                                        <span>赞</span>
                                                                    </button>
                                                                    <button class="CommentItem_action CommentBox_textButton CommentItem-dislikeButton">
                                                                        <i class="CommentItem_flipV zg-icon zg-icon-comment-like"></i>
                                                                        <span>踩</span>
                                                                    </button>
                                                                    <button label="举报" icon="zg-icon zg-icon-comment-report" class="CommentItem_action CommentBox_textButton">
                                                                        <i class="zg-icon zg-icon-comment-report"></i>
                                                                        <span>举报</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--<div class="_Pager_root_2GoR _CommentBox_pagerBorder_yuO1" hidden=""></div>-->
                                                    <div class="CommentForm_root CommentForm_bordered">
                                                        <form role="form">
                                                            <div class="form-group">
                                                                <textarea class="form-control" rows="2" required placeholder="写下你的评论…"></textarea>
                                                            </div>
                                                            <div class="CommentForm_actions clearfix" >
                                                                <button class="CommentForm_submitButton zg-btn-blue">评论</button>
                                                                <button class="CommentForm_cancelButton CommentBox_textButton" data-key="cancel">取消</button>
                                                            </div>
                                                        </form>
                                                        <%--<div required="" value="" placeholder="写下你的评论…"--%>
                                                             <%--class="InputBox_root _InputBox_empty_3_ur _InputBox_blur_3JWV"--%>
                                                             <%--data-input-box="true" aria-label="写下你的评论…"--%>
                                                             <%--contenteditable="true"></div>--%>
                                                        <%--<div class="CommentForm_actions clearfix" >--%>
                                                            <%--<button class="CommentForm_submitButton zg-btn-blue">评论</button>--%>
                                                            <%--<button class="CommentForm_cancelButton CommentBox_textButton" data-key="cancel">取消</button>--%>
                                                        <%--</div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<a href="#" class="ignore zu-autohide" name="dislike" data-tooltip="s$b$不感兴趣"></a>--%>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
                </div>
                <a href="javascript:;" id="zh-load-more" data-method="next" class="zg-btn-white zg-r3px zu-button-more" style="">更多</a>
            </div>
        </div>
    </div>

    <!--右边栏-->
    <div class="zu-main-sidebar" data-za-module="RightSideBar">
        <div class="zm-side-section">
            <div class="zm-side-section-inner">
                <div class="zm-side-nav-group">
                    <ul class="zm-side-nav" id="zg-sidebar-nav">
                        <li class="zm-side-nav-li">
                            <a class="zm-side-nav-link" href="${ctx}/collections" data-za-c="collection"
                               data-za-l="sidebar_collections" data-za-a="visit_collections">
                                <i class="zg-icon zg-icon-sidenav-fav"></i>
                                我的收藏
                                <%--<span class="zg-num">989</span>--%>
                            </a>
                        </li>
                        <li class="zm-side-nav-li">
                            <a class="zm-side-nav-link" href="${ctx}/question/following">
                                <i class="zg-icon zg-icon-sidenav-follow"></i>
                                我关注的问题
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<template id="addComment">
    <div class="CommentItem_root" tabindex="-1">
        <a href="" target="_blank" tabindex="-1" class="CommentItem_avatarLink hidden-phone">
            <img tabindex="-1" class="Avatar Avatar-s" src="">
        </a>
        <div class="CommentItem_body">
            <div class="CommentItem_header">
                <a href="" target="_blank" class="Commenter"></a>
            </div>
            <div class="CommentItem_content">
            </div>
            <div class="CommentItem_footer clearfix">
                <span class="_CommentItem_likes_2hey" data-tooltip="s$r$0 人觉得这个很赞" hidden="">
                    <span>0</span><span> 赞</span>
                </span>
                <time title="2017-01-20 11:35:19">
                    17 天前
                </time>
                <button class="CommentItem_action CommentBox_textButton">
                    <i class="zg-icon zg-icon-comment-reply"></i>
                    <span>回复</span></button>
                <button class="CommentItem_action CommentBox_textButton">
                    <i class="zg-icon zg-icon-comment-like"></i>
                    <span>赞</span>
                </button>
                <button class="CommentItem_action CommentBox_textButton CommentItem-dislikeButton">
                    <i class="CommentItem_flipV zg-icon zg-icon-comment-like"></i>
                    <span>踩</span>
                </button>
                <button label="举报" icon="zg-icon zg-icon-comment-report" class="CommentItem_action CommentBox_textButton">
                    <i class="zg-icon zg-icon-comment-report"></i>
                    <span>举报</span>
                </button>
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

    $(".follow-link").click(function () {
        var questionId = $(this).attr("id");
        if($(this).text().indexOf("关注问题")!=-1){
            $(this).text("取消关注");
            $.post("${ctx}/followQuestion", {objectId : questionId}, function(data){

            });
        }else {
            $(this).html('<i class="z-icon-follow"></i>关注问题');
            $.post("${ctx}/unfollowQuestion", {objectId : questionId}, function(data){

            });
        }
    });

    $(".js-toggleCommentBox").click(function (){
        var id = $(this).attr("id");
        var _this = $(this);
        if($(this).text().indexOf("收起评论")==-1){
            if(id.indexOf("question")!=-1){
                var questionId = id.substring(id.indexOf("_")+1);
                $.post("${ctx}/question/" + questionId + "/comments", function(data){
                    _this.html('<i class="z-icon-comment"></i>收起评论');
                    _this.parent().next().css("display","block");
                });
            }else{
                var answerId = id.substring(id.indexOf("_")+1);
                $.post("${ctx}/answer/" + answerId + "/comments", function(data){
                    for(var i=0; i<data.length; i++){
                        var add_comment = document.querySelector('#addComment');
                        add_comment.content.querySelector('.CommentItem_avatarLink').setAttribute( "href",'${ctx}/user/'+data[i].commenter.id);
                        add_comment.content.querySelector('img').setAttribute("src", data[i].commenter.avatar);
                        add_comment.content.querySelector('.Commenter').setAttribute( "href",'${ctx}/user/'+data[i].commenter.id);
                        add_comment.content.querySelector('.Commenter').innerHTML = data[i].commenter.name;
                        add_comment.content.querySelector('.CommentItem_content').innerHTML = data[i].content;
                        _this.parent().next().children().children()[0].appendChild(add_comment.content.cloneNode(true));
                    }
                    _this.html('<i class="z-icon-comment"></i>收起评论');
                    var scrollPos = window.pageYOffset;
                    _this.parent().next().css("display","block");
                    document.documentElement.scrollTop = scrollPos;
                    document.body.scrollTop = scrollPos;
                });
            }
        }else{
            $(this).html('<i class="z-icon-comment"></i>2 条评论');
            var scrollPos = window.pageYOffset;
            _this.parent().next().css("display","none");
            document.documentElement.scrollTop = scrollPos;
            document.body.scrollTop = scrollPos;
        }
    });

    function changeImgSrc() {
        var img = document.getElementsByTagName('img');
        for(i = 0; i<img.length; i++){
            if(img[i].getAttribute("src").indexOf("whitedot.jpg")!= -1)
                img[i].setAttribute("src",img[i].getAttribute("data-actualsrc"));
        }
    }

    $(function () {
        changeImgSrc();
    });

    $('textarea').each(function () {
        this.setAttribute('style', 'overflow-y:hidden;');
    }).on('input', function () {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });

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

    $(".CommentForm_submitButton").click(function () {
        var _this = $(this);
        var id = $(this).closest(".zm-item-meta").find(".js-toggleCommentBox").attr("id");
        var objectType;
        if(id.indexOf("question")!=-1){
            objectType = 0;  //question
        }else {
            objectType = 1;  //answer
        }
        var objectId = id.substring(id.indexOf("_")+1);
        var content = $(this).parent().prev().children().val();
        $.post(
                '${ctx}/comment/add',
                {
                    commenter_id: ${user.id},
                    object_type: objectType,
                    object_id: objectId,
                    content: content,
                    comment_time:getNowFormatDate()
                },
                function(data){
                    var add_comment = document.querySelector('#addComment');
                    add_comment.content.querySelector('.CommentItem_avatarLink').setAttribute( "href",'${ctx}/user/'+data.commenter.id);
                    add_comment.content.querySelector('img').setAttribute("src", data.commenter.avatar);
                    add_comment.content.querySelector('.Commenter').setAttribute( "href",'${ctx}/user/'+data.commenter.id);
                    add_comment.content.querySelector('.Commenter').innerHTML = data.commenter.name;
                    add_comment.content.querySelector('.CommentItem_content').innerHTML = data.content;
                    _this.closest(".comment-app-holder").find(".CommentBox_list")[0].appendChild(add_comment.content.cloneNode(true));
                });
    });1

</script>
</body>
</html>
