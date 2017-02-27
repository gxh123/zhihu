<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js page-inbox">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <meta name="referrer" content="never">
    <title>私信 - 知乎</title>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/sockjs/sockjs.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
</head>

<body class="zhi ">

<jsp:include page="navigation.jsp"></jsp:include>

<div class="zg-wrap zu-main clearfix " role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">
            <div class="zg-section">
                <a href="${ctx}/inbox">« 返回</a>
            </div>
            <div class="zg-section zg-14px">
                <span class="zg-gray-normal">发私信给 </span>
                <span class="zg-gray-darker">${another.name}</span>：
            </div>
            <div class="zg-section" id="zh-pm-editor-form">
                <div class="zg-editor-simple-wrap zg-form-text-input">
                    <div class="zg-user-name" style="display:none"></div>
                    <textarea class="zg-editor-input" style="font-weight:normal"></textarea>
                </div>
                <div class="zh-pm-warnmsg" style="display:none;text-align:right;color:#C3412F;"></div>
                <div class="zm-command">
                    <a name="send" href="javascript:;" class="zg-btn-blue zg-r3px">发送</a>
                </div>
            </div>
            <div id="zh-pm-detail-item-wrap">
                <c:forEach items="${conversation}" var="message">
                    <div class="zm-pm-item">
                        <a class="zm-item-link-avatar50" href="${ctx}/user/${message.fromId}">
                            <c:if test="${message.fromId == user.id}">
                                <img class="zm-item-img-avatar50" src="${user.avatar}"/>
                            </c:if>
                            <c:if test="${message.fromId != user.id}">
                                <img class="zm-item-img-avatar50" src="${another.avatar}"/>
                            </c:if>

                        </a>
                        <div class="zm-pm-item-main">
                            <div class="pm-touser" style="display:none"></div>
                            <c:if test="${message.fromId == user.id}">我</c:if>
                            <c:if test="${message.fromId != user.id}">${another.name}</c:if>
                            ：${message.content}
                        </div>
                        <div class="zg-gray zu-pm-item-meta clearfix">
                            <span class="zg-gray zg-left">${message.createDate}</span>
                            <a class="zg-link-litblue" href="javascript:;" name="delete">删除</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="zu-main-sidebar" data-za-module="RightSideBar">
    </div>
</div>

<div id="zh-footer" class="zh-footer">
    <div class="content zg-wrap clearfix">
        <ul>

            <li><a href="https://liukanshan.zhihu.com" target="_blank">刘看山</a></li>

            <li><a href="/question/19581624" target="_blank">知乎指南</a></li>
            <li><a href="javascript:;" id="js-feedback-button">建议反馈</a></li>

            <li><a href="/app" target="_blank">移动应用</a></li>
            <li><a href="/careers">加入知乎</a></li>
            <li><a href="/terms" target="_blank">知乎协议</a></li>
            <li><a href="/jubao" target="_blank">举报投诉</a></li>
            <li><a href="/contact">联系我们</a></li>

        </ul>

        <span class="copy">&copy; 2017 知乎</span>

    </div>
</div>

<template id="message">
    <div class="zm-pm-item">
        <a class="zm-item-link-avatar50" href="${ctx}/user/${user.avatar}">
                <img class="zm-item-img-avatar50" src="${user.avatar}"/>
        </a>
        <div class="zm-pm-item-main">
            <%--<div class="pm-touser" style="display:none"></div>--%>
        </div>
        <div class="zg-gray zu-pm-item-meta clearfix">
            <span class="zg-gray zg-left"></span>
            <a class="zg-link-litblue" href="javascript:;" name="delete">删除</a>
        </div>
    </div>
</template>

<script>

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

    <%--var sock = new SockJS('${ctx}/sockjs/webSocketServer');--%>

    var sock = new SockJS('${ctx}/sockjs/webSocketServer');
    sock.onopen = function() {
    };
    sock.onmessage = function(e) {
        if (e.data > 0) {
            $('#zh-top-nav-new-pm').text(e.data);
            $('#zh-top-nav-new-pm').css("visibility", "visible");
            $('#zh-top-nav-pm-count').text(e.data);
            $('#zh-top-nav-pm-count').css("visibility", "visible");
        }else{
            $('#zh-top-nav-new-pm').css("visibility", "hidden");
            $('#zh-top-nav-pm-count').css("visibility", "hidden");
        }
    };
    sock.onclose = function() {
    };

    $('.zm-command').click(function () {
        var content = $(".zg-editor-input").val();
        if(content =="") return false;
        $.post(
                '${ctx}/message/add',
                {
                    to_id: ${another.id},
                    conversation_id: '${conversationId}',    //字符串要加引号
                    message_content: content,
                    create_date:getNowFormatDate()
                },
                function(data){
                    $(".zg-editor-input").val('');     //单引号
                    var add_message = document.querySelector('#message');
                    add_message.content.querySelector('.zm-pm-item-main').innerHTML = '我：'+ data['content'];  //1
                    add_message.content.querySelector('span').innerHTML = timeStamp2String(data['createDate']);
                    document.querySelector('#zh-pm-detail-item-wrap').insertBefore(add_message.content.cloneNode(true),document.querySelector('.zm-pm-item'));
                    sock.send(data['toId'] + "");
                });
    });
</script>
</body>
</html>