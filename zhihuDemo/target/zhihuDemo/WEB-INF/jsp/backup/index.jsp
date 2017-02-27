<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!--顶部导航栏-->
    <div role="navigation" class="zu-top" data-za-module="TopNavBar">
        <div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
            <a href="https://www.zhihu.com/" class="zu-top-link-logo" id="zh-top-link-logo" data-za-c="view_home"
               data-za-a="visit_home" data-za-l="top_navigation_zhihu_logo">知乎</a>

            <!--右上角姓名相关-->
            <div class="top-nav-profile">
                <a href="https://www.zhihu.com/people/guo-xiao-hu-47" class="zu-top-nav-userinfo " id=":0" role="button" aria-haspopup="true" aria-activedescendant="">
                    <span class="name">郭小虎</span>
                    <img class="Avatar" src="%E9%A6%96%E9%A1%B5%20-%20%E7%9F%A5%E4%B9%8E_files/5e9fbaf3314270ae46eea42f99577e3e_s.jpg"
                         srcset="https://pic3.zhimg.com/5e9fbaf3314270ae46eea42f99577e3e_xs.jpg 2x" alt="郭小虎">
                    <span id="zh-top-nav-new-pm" class="zg-noti-number zu-top-nav-pm-count" style="visibility:hidden" data-count="0"></span>
                </a>
                <!--鼠标放在名字上显示的下拉式菜单-->
                <ul class="top-nav-dropdown" id="top-nav-profile-dropdown" aria-labelledby=":0">
                    <li>
                        <a href="https://www.zhihu.com/people/guo-xiao-hu-47" tabindex="-1" id=":1">
                            <i class="zg-icon zg-icon-dd-home"></i>我的主页
                        </a>
                    </li>
                    <li>
                        <a href="https://www.zhihu.com/inbox" tabindex="-1" id=":2">
                            <i class="zg-icon zg-icon-dd-pm"></i>私信
                                <span id="zh-top-nav-pm-count" class="zu-top-nav-pm-count zg-noti-number" style="visibility:hidden" data-count="0">
                                </span>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.zhihu.com/settings" tabindex="-1" id=":3">
                            <i class="zg-icon zg-icon-dd-settings"></i>设置
                        </a>
                    </li>
                    <li>
                        <a href="https://www.zhihu.com/logout" tabindex="-1" id=":4">
                            <i class="zg-icon zg-icon-dd-logout"></i>退出
                        </a>
                    </li>
                </ul>
            </div>

            <!--提问-->
            <button class="zu-top-add-question" id="zu-top-add-question">提问</button>

            <!--搜索-->
            <div role="search" id="zh-top-search" class="zu-top-search">
                <form method="GET" action="/search" id="zh-top-search-form" class="zu-top-search-form">
                    <input name="type" value="content" type="hidden">
                    <label for="q" class="hide-text">知乎搜索</label><input class="zu-top-search-input" id="q" name="q"
                                                                        autocomplete="off" maxlength="100"
                                                                        placeholder="搜索你感兴趣的内容..." role="combobox"
                                                                        aria-autocomplete="list" type="text">
                    <button type="submit" class="zu-top-search-button"><span class="hide-text">搜索</span><span
                            class="sprite-global-icon-magnifier-dark"></span></button>
                </form>
            </div>


            <div id="zg-top-nav" class="zu-top-nav">
                <ul class="zu-top-nav-ul zg-clear">
                    <li class="zu-top-nav-li current" id="zh-top-nav-home">
                        <a class="zu-top-nav-link" href="https://www.zhihu.com/" id="zh-top-link-home" data-za-c="view_home"
                           data-za-a="visit_home" data-za-l="top_navigation_home">首页</a>
                    </li>
                    <li class="top-nav-topic-selector zu-top-nav-li " id="zh-top-nav-topic">
                        <a class="zu-top-nav-link" href="https://www.zhihu.com/topic" id="top-nav-dd-topic">话题</a>
                    </li>

                    <li class="zu-top-nav-li " id="zh-top-nav-explore">
                        <a class="zu-top-nav-link" href="https://www.zhihu.com/explore">发现</a>
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
</body>
</html>
