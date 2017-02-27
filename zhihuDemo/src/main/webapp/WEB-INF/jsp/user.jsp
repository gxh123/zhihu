<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <title>${visitedUser.name} - 知乎</title>
    <%--<link href="test.css" rel="stylesheet"/>--%>
    <%--<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">--%>
    <script src="${ctx}/assets/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/home.css">
</head>
<body class="Entry-body">
<div id="root">
    <header role="banner" class="Sticky AppHeader">
        <div class="AppHeader-inner">
            <a href="/" aria-label="知乎"></a>
            <nav role="navigation" class="AppHeader-nav">
                <a class="AppHeader-navItem" href="${ctx}/">首页</a>
                <a class="AppHeader-navItem" href="${ctx}/explore">发现</a>
                <a class="AppHeader-navItem" href="${ctx}/topic">话题</a>
            </nav>
            <div class="SearchBar" role="search">
                <div class="SearchBar-toolWrapper">
                    <form class="SearchBar-tool">
                        <div class="Popover">
                            <div class="SearchBar-input Input-wrapper Input-wrapper--grey">
                                <input type="text" maxlength="100" value="" class="Input" placeholder="搜索你感兴趣的内容…"/>
                            </div>
                        </div>
                        <button class="Button SearchBar-searchIcon Button--plain" aria-label="搜索" type="button" style="border: solid">
                        </button>
                        <div class="SearchBar-iconDecorator"></div>
                    </form>
                </div>
                <button class="Button SearchBar-askButton Button--primary Button--blue" type="button">提问</button>
            </div>
            <div class="AppHeader-userInfo">
                <div class="AppHeader-profile">
                    <button class="Button AppHeader-profileEntry Button--plain" type="button">
                        <img class="Avatar" style="width:30px;height:30px;" src="${user.avatar}"/>
                    </button>
                </div>
            </div>
        </div>
    </header>
    <main role="main" class="App-main">
        <div id="ProfileHeader" class="ProfileHeader">
            <div class="Card">
                <!--封面-->
                <div class="ProfileHeader-userCover">
                    <div class="UserCoverEditor">
                        <%--<div class="UserCoverGuide">--%>
                            <%--<div class="UserCoverGuide-inner">--%>
                                <%--<div class="UserCoverGuide-buttonContainer">--%>
                                    <%--<button class="Button DynamicColorButton" type="button">--%>
                                        <%--上传封面图片--%>
                                    <%--</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="UserCover UserCover--colorBlock"></div>
                        <input type="file" accept="image/png,image/jpeg" style="display:none;"/></div>
                </div>
                <div class="ProfileHeader-wrapper">
                    <div class="ProfileHeader-main">
                        <div class="UserAvatarEditor ProfileHeader-avatar" style="top:-74px;">
                            <div class="UserAvatar"><img class="Avatar Avatar--large UserAvatar-inner"
                                                         style="width:160px;height:160px;" src="${visitedUser.avatar}"/></div>
                            <%--<div class="Mask UserAvatarEditor-mask Mask-hidden">--%>
                                <%--<div class="Mask-mask Mask-mask--black UserAvatarEditor-maskInner"></div>--%>
                                <%--<div class="Mask-content">--%>
                                    <%--<div class="UserAvatarEditor-maskInnerText">修改我的头像</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <input type="file" accept="image/png,image/jpeg" style="display:none;"/></div>
                        <div class="ProfileHeader-content">
                            <div class="ProfileHeader-contentHead"><h1 class="ProfileHeader-title"><span
                                    class="ProfileHeader-name">${visitedUser.name}</span><span
                                    class="RichText ProfileHeader-headline">学生</span></h1>
                            </div>
                            <div class="ProfileHeader-contentBody" style="height:52px;">
                                <div class="ProfileHeader-info">
                                    <div class="ProfileHeader-infoItem">
                                        计算机软件
                                    </div>
                                    <div class="ProfileHeader-infoItem">
                                        同济大学
                                        <div class="ProfileHeader-divider"></div>
                                    </div>
                                </div>
                            </div>
                            
                            <c:if test="${user.id != visitedUser.id}">
                                <div class="ProfileHeader-contentFooter">
                                    <div class="MemberButtonGroup ProfileButtonGroup ProfileHeader-buttons">
                                        <button class="Button FollowButton Button--primary Button--blue" id="FollowButton"
                                                icon="plus" type="button"><span>关注</span></button>
                                        <button class="Button" type="button">
                                            <span>发私信</span></button>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="Profile-main">
            <div class="Profile-mainColumn">
                <div class="Card ProfileMain" id="ProfileMain">
                    <div class="ProfileMain-header">
                        <ul role="tablist" class="Tabs ProfileMain-tabs">
                            <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                <a class="Tabs-link is-active" href="${ctx}/user/${visitedUser.id}/activities">动态</a>
                            </li>
                            <li role="tab" class="Tabs-item" >
                                <a class="Tabs-link" href="${ctx}/user/${visitedUser.id}/answers">回答
                                    <span class="Tabs-meta">0</span>
                                </a>
                            </li>
                            <li role="tab" class="Tabs-item">
                                <a class="Tabs-link" href="${ctx}/user/${visitedUser.id}/pins">分享
                                    <span class="Tabs-meta">0</span>
                                </a>
                            </li>
                            <li role="tab" class="Tabs-item">
                                <a class="Tabs-link" href="${ctx}/user/${visitedUser.id}/asks">提问
                                    <span class="Tabs-meta">0</span></a>
                            </li>
                            <li role="tab" class="Tabs-item">
                                <a class="Tabs-link" href="${ctx}/user/${visitedUser.id}/collections">收藏
                                    <span class="Tabs-meta">0</span>
                                </a>
                            </li>
                            <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                <a class="Tabs-link" href="${ctx}/user/${visitedUser.id}/following">关注
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="List" id="Profile-activities">
                        <div class="List-header"><h4 class="List-headerText"><span>我的动态</span></h4>
                            <div class="List-headerOptions"></div>
                        </div>
                        <!--具体的动态-->
                        <div class="">
                            <div class="List-item">
                                <div class="List-itemMeta">
                                    <div class="ActivityItem-meta">
                                        <span class="ActivityItem-metaTitle">关注了收藏夹</span>
                                        <span>6 天前</span>
                                    </div>
                                </div>
                                <div class="ContentItem">
                                    <h2 class="ContentItem-title">
                                        <a href="/collection/19928423" target="_blank">赞同超过1000的回答</a>
                                    </h2>
                                </div>
                            </div>
                            <div class="List-item">
                                <div class="List-itemMeta">
                                    <div class="ActivityItem-meta">
                                        <span class="ActivityItem-metaTitle">关注了话题</span>
                                        <span>8 天前</span>
                                    </div>
                                </div>
                                <div class="PortraitItem">
                                    <a class="TopicLink PortraitItem-image" href="/topic/19551147" target="_blank">
                                        <div class="Popover">
                                            <div id="Popover-46721-77643-toggle" aria-haspopup="true"
                                                 aria-expanded="false" aria-owns="Popover-46721-77643-content">
                                                <img class="Avatar Avatar--large TopicLink-avatar" style="width:60px;height:60px;" src="https://pic4.zhimg.com/50/d5aed1527_im.jpg"
                                                     srcset="https://pic4.zhimg.com/50/d5aed1527_xl.jpg 2x"
                                                     alt="生活"/>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="ContentItem PortraitItem-content">
                                        <h2 class="ContentItem-title">
                                            <a class="TopicLink" href="/topic/19551147" target="_blank">
                                                <div class="Popover">
                                                    <div id="Popover-46722-46397-toggle" aria-haspopup="true"
                                                         aria-expanded="false"
                                                         aria-owns="Popover-46722-46397-content">生活
                                                    </div>
                                                </div>
                                            </a>
                                        </h2>
                                        <div class="ContentItem-meta">
                                            <div class="TopicItem-meta">生活是物质生活和精神生活的总称。
                                                物质生活是人生活上的基本需要，精神生活则是人们在得到了物质生活后，所追求的另一种精神寄托。
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Profile-sideColumn" data-za-module="RightSideBar">
                <div class="Card FollowshipCard">
                    <div class="NumberBoard FollowshipCard-counts">
                        <a class="Button NumberBoard-item Button--plain" type="button" href="${ctx}/user/${visitedUser.id}/following">
                            <div class="NumberBoard-name">关注了</div>
                            <div class="NumberBoard-value">0</div>
                        </a>
                        <div class="NumberBoard-divider"></div>
                        <a class="Button NumberBoard-item Button--plain" type="button" href="${ctx}/user/${visitedUser.id}/followers">
                            <div class="NumberBoard-name">关注者</div>
                            <div class="NumberBoard-value">0</div>
                        </a>
                    </div>
                </div>
                <div class="Profile-lightList">
                    <a class="Profile-lightItem" href="${ctx}/user/${visitedUser.id}/following/topics">
                        <span class="Profile-lightItemName">关注的话题</span>
                        <span class="Profile-lightItemValue">6</span>
                    </a>
                    <a class="Profile-lightItem" href="${ctx}/user/${visitedUser.id}/following/questions">
                        <span class="Profile-lightItemName">关注的问题</span>
                        <span class="Profile-lightItemValue">1</span>
                    </a>
                    <a class="Profile-lightItem" href="${ctx}/user/${visitedUser.id}/following/collections">
                        <span class="Profile-lightItemName">关注的收藏夹</span>
                        <span class="Profile-lightItemValue">1</span>
                    </a>
                </div>
                <div class="Profile-footerOperations">个人主页被浏览 38 次</div>
            </div>
        </div>
    </main>
</div>

<script>
    $("#FollowButton").click(function () {
        if($("#FollowButton span").text() == "关注"){
            $("#FollowButton").removeClass("Button--blue");
            $("#FollowButton").addClass("Button--grey");
            $("#FollowButton span").text("已关注");
            $.post("${ctx}/followUser", {objectId : ${visitedUser.id}}, function(data){

            });
        }else{
            $("#FollowButton").removeClass("Button--grey");
            $("#FollowButton").addClass("Button--blue");
            $("#FollowButton span").text("关注");
            $.post("${ctx}/unfollowUser", {objectId : ${visitedUser.id}}, function(data){

            });
        }
    });

    $(function () {
        if(${visitedUser.isFollowed}){
            $("#FollowButton").removeClass("Button--blue");
            $("#FollowButton").addClass("Button--grey");
            $("#FollowButton span").text("已关注");
        }
    });

</script>
</body>
</html>