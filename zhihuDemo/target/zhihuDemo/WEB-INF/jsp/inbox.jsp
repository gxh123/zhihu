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
    <link rel="stylesheet" href="${ctx}/assets/css/z.css">
</head>

<body class="zhi ">

<jsp:include page="navigation.jsp"></jsp:include>

<div class="zg-wrap zu-main clearfix "  role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">
            <div class="PageInbox-nav">
                <div class="PageInbox-nav-inner">
                    <ul class="PageInbox-nav-tabs">
                        <li class="ww">最近联系</li>
                    </ul>
                    <button id="zh-create-pm" class="zg-btn-justify zg-btn-blue">写私信</button>
                </div>

            </div>
            <div id="zh-pm-item-wrap">

                <c:forEach items="${conversations}" var="conversation">
                    <div class="zm-pm-item">
                        <a class="zm-item-link-avatar50" href="${ctx}/user/${conversation.user.id}">
                            <img class="zm-item-img-avatar50" src="${conversation.user.avatar}" />
                        </a>
                        <div class="zm-pm-item-main">
                            <a class="pm-touser author-link" href="${ctx}/user/${conversation.user.id}"
                            >${conversation.user.name}</a>：${conversation.message.content}
                        </div>
                        <div class="zg-gray zu-pm-item-meta">
                            <span class="zg-gray zg-left">${conversation.message.createDate}</span>
                            <c:if test="${conversation.unread == 0}">
                                <a class="zg-link-litblue" href="${ctx}/inbox/conversation/${conversation.message.conversationId}">查看对话</a>
                            </c:if>

                            <c:if test="${conversation.unread != 0}">
                                <a class="zg-link-litblue" href="${ctx}/inbox/conversation/${conversation.message.conversationId}">有${conversation.unread}条新私信</a>
                            </c:if>

                            <span class="zg-bull">|</span>
                            <a class="zg-link-litblue" href="javascript:;" name="reply">回复</a>

                            <span class="zg-bull">|</span>
                            <a class="zg-link-litblue" href="javascript:;" name="delete">删除</a>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <a style="display:none" class="zg-btn-white zg-r3px zu-button-more" id="zh-load-more" href="javascript:;">更多</a>
        </div>
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
</body>
</html>