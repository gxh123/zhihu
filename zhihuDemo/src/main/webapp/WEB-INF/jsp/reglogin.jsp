<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>知乎</title>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">--%>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <c:set var="msg" value="${msg}"/>
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/assets/css/main.css" rel="stylesheet" />
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/md5.js"></script>
    <script src="${ctx}/assets/js/login.js"></script>

</head>
<body>

<!-- particles.js container -->
<div id="particles-js"></div>

<!-- scripts -->

<div class="index-main">
    <div class="index-main-body">
        <div class="index-header">
            <h1 class="logo hide-text">知乎</h1>
            <h2 class="subtitle">与世界分享你的知识、经验和见解</h2>
        </div>
        <div class="desk-front sign-flow">
            <div class="index-tab-navs">
                <%--<div class="navs-slider" data-active-index="0">--%>
                    <div class="navs-slider" data-active-index="${index}">
                    <a href="#register" id="register">注册</a>
                    <a href="#login" id="login">登录</a>
                    <span class="navs-slider-bar"></span>
                </div>
            </div>

            <%--<div class="view view-signin" data-za-module="SignInForm" style="display: none;">--%>
            <div class="view view-login" style="display: none;">
                <form  class="login-form" method="POST" action="${ctx}/login">
                    <div class="group-inputs">
                        <%--隐藏域--%>
                        <input class="password-hidden" type="hidden" name="password" type="text">

                        <div class="account input-wrapper">
                            <input name="account" placeholder="手机号或邮箱" required="required" type="text" value='${account}'>
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 5;top: 10;display: none">${msg}</div>
                        </div>
                        <div class="verification input-wrapper">
                            <input placeholder="密码" required="required" type="password">
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 5;top: 10;display: none">${msg}</div>
                            <%--<button type="button" class="send-code-button">获取验证码</button>--%>
                        </div>
                        <%--验证码--%>
                        <div class="input-wrapper captcha-module" data-type="en" style="display: block;">
                            <input id="captcha" name="captcha" placeholder="验证码" required="required" data-rule-required="true" data-msg-required="请填写验证码">
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 110;top: 10;display: none">${msg}</div>
                            <div class="captcha-container">
                                <img class="js-refreshCaptcha captcha" width="120" height="30" data-tooltip="s$t$看不清楚？换一张"
                                     alt="验证码" data-toggle="tooltip" title="看不清楚？换一张" style="display: block;"
                                     src="${ctx}/getCaptcha" onclick="getCaptcha()">
                            </div>
                        </div>
                    </div>
                    <div class="button-wrapper command">
                        <button class="sign-button submit" id="login-btn" type="button">登录</button>
                    </div>
                    <div class="signin-misc-wrapper clearfix">
                        <button type="button" class="signin-switch-button">手机验证码登录</button>
                        <a class="unable-login" href="#">无法登录？</a>
                    </div>
                </form>
            </div>
            <%--<div class="view view-signup selected" data-za-module="SignUpForm" style="display: block;">--%>
            <div  class="view view-register" style="display: block;">
                <%--<form class="zu-side-login-box" action="${ctx}/register" id="sign-form-1" method="POST">--%>
                <form class="register-form" action="${ctx}/register" id="sign-form-1" method="POST">
                    <div class="group-inputs">
                        <%--隐藏域--%>
                        <input class="password-hidden" type="hidden" name="password" type="text">

                        <div class="name input-wrapper" style="position:relative;">
                            <input name="name" required="required" placeholder="姓名" type="text" value='${name}'>
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 5;top: 10;display: none">${msg}</div>
                        </div>
                        <div class="email input-wrapper" style="position:relative;">
                            <input name="phone" required="required" class="account" placeholder="手机号（仅支持中国大陆）" type="text" value='${phone}'>
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 5;top: 10;display: none">${msg}</div>
                        </div>
                        <div class="password input-wrapper" style="position:relative;">
                            <input required="required" placeholder="密码（不少于 6 位）" type="password" value="">  <!--password加密传输，无法回显在输入框-->
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 5;top: 10;display: none">${msg}</div>
                        </div>
                        <%--验证码--%>
                        <div class="input-wrapper captcha-module" style="position:relative;">
                            <input name="captcha" id="captcha" placeholder="验证码" required="required" data-rule-required="true" value =''>
                            <div class="msg" style="color: red; position:absolute;z-index: 8;right: 110;top: 10;display: none">${msg}</div>
                            <div class="captcha-container">
                                <img class="js-refreshCaptcha captcha" width="120" height="30"
                                     alt="验证码" data-toggle="tooltip" title="看不清楚？换一张"
                                     src="${ctx}/getCaptcha" onclick="getCaptcha()">
                            </div>
                        </div>
                    </div>
                    <div class="button-wrapper command">
                        <%--<button class="sign-button submit" id="register-btn" type="submit">注册知乎</button>--%>
                            <button class="sign-button submit" id="register-btn" type="button">注册知乎</button>
                    </div>
                </form>
                <p class="agreement-tip">点击「注册」按钮，即代表你同意<a href="https://www.zhihu.com/terms" target="_blank">《知乎协议》</a>
                </p>
            </div>
        </div>
    </div>
</div>
</div>
<script src="${ctx}/assets/js/particles/particles.js"></script>
<script src="${ctx}/assets/js/particles/particles-app.js"></script>
<script>
    function getCaptcha() {
        var source = '${ctx}/getCaptcha?d=' + Math.random();
        $('.register-form .captcha').attr("src", source);
        $('.login-form .captcha').attr("src", source);
    }
//    $(function () { $("[data-toggle='tooltip']").tooltip(); });
    $('#register').click(function(){
        $('.view-register').css('display','block');
        $('.view-login').css('display','none');
        $('.navs-slider').attr("data-active-index", 0);
    });
    $('#login').click(function(){
        $('.view-login').css('display','block');
        $('.view-register').css('display','none');
        $('.navs-slider').attr("data-active-index", 1);
    });
    //注册
    $('#register-btn').click(function() {
        //简单判断
        var phone = $('.register-form .email input').val();       //获取输入的手机号
        var phoneReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!phoneReg.test(phone))
        {
            $('.register-form .group-inputs .email .msg').html("请输入有效的手机号码");
            $('.register-form .group-inputs .email .msg').css('display', 'block');
            return;
        }
        var password = $('.register-form .password input').val();       //获取输入的password
        if(password.length < 6){
            $('.register-form .group-inputs .password .msg').html("密码少于6位");
            $('.register-form .group-inputs .password .msg').css('display', 'block');
            return;
        }
        $('.register-form .password-hidden').val(md5(password));        //md5后放入隐藏域
        $('.register-form').submit();
    });
    //登录
    $('#login-btn').click(function() {
        var password = $('.login-form .verification input').val();
        $('.login-form .password-hidden').val(md5(password));
        $('.login-form').submit();
    });
    $('.register-form .name').click(function () {
        if($('.register-form .group-inputs .name .msg').css('display') == 'block'){
            $('.register-form .group-inputs .name .msg').css('display', 'none');
        }
    });
    $('.register-form .password').click(function () {
        if($('.register-form .group-inputs .password .msg').css('display') == 'block'){
            $('.register-form .group-inputs .password .msg').css('display', 'none');
        }
    });
    $('.register-form .email').click(function () {
        if($('.register-form .group-inputs .email .msg').css('display') == 'block'){
            $('.register-form .group-inputs .email .msg').css('display', 'none');
        }
    });
    $('.register-form .captcha-module').click(function () {
        if($('.register-form .group-inputs .captcha-module .msg').css('display') == 'block'){
            $('.register-form .group-inputs .captcha-module .msg').css('display', 'none');
        }
    });
    $(function(){
        var index = '${index}';
        var msg = '${msg}';
        if(index == 0) {
            $('.view-register').css('display','block');
            $('.view-login').css('display','none');
            $('.navs-slider').attr("data-active-index", 0);
            if (msg.indexOf('用户名') > -1) {
                $('.register-form .group-inputs .name .msg').css('display', 'block');
            } else if (msg.indexOf('密码') > -1) {
                $('.register-form .group-inputs .password .msg').css('display', 'block');
            } else if (msg.indexOf('电话') > -1) {
                $('.register-form .group-inputs .email .msg').css('display', 'block');
            } else if (msg.indexOf('验证码') > -1) {
                $('.register-form .group-inputs .captcha-module .msg').css('display', 'block');
            } else if (msg.indexOf('服务器') > -1) {
                $('.register-form .group-inputs .name .msg').css('display', 'block');
            }
        }else if(index == 1) {
            $('.view-login').css('display','block');
            $('.view-register').css('display','none');
            $('.navs-slider').attr("data-active-index", 1);
            if (msg.indexOf('账号') > -1) {
                $('.login-form .group-inputs .account .msg').css('display', 'block');
            } else if (msg.indexOf('密码') > -1) {
                $('.login-form .group-inputs .verification .msg').css('display', 'block');
            } else if (msg.indexOf('验证码') > -1) {
                $('.login-form .group-inputs .captcha-module .msg').css('display', 'block');
            } else if (msg.indexOf('服务器') > -1) {
                $('.login-form .group-inputs .account .msg').css('display', 'block');
            }
        }
    });

</script>
</body>
</html>
