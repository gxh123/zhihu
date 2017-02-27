/**
 * Created by gxh on 2017/2/6.
 */
$(document).ready(function(){

    url_user = "http://user.com/i=";
    url_img = "http://127.0.0.1/pages/";
    url_dianzan = "http://dianzan.com";
    url_dn_detail = "http://dt.com/i=";

    layout_list = $(".list_layout");
    t_dn = $("#t_dn");
    t_dn_comm = $("#t_dn_comm");

    maxnum = 2;  // 最大加载次数
    num = 1;
    load_flag = $(".load_flag");

    function render_dn_list(arr_dn){
        for(var i=0; i<arr_dn.length;i++){
            var node_dn =  t_dn.clone();

            node_dn.find(".dn_id").attr("content",arr_dn[i]["ID"]); //动态ID
            node_dn.find(".user_id").attr("content",arr_dn[i]["userid"]);  //用户ID
            node_dn.find(".dn_left .dn_user_avatar a").attr("href",url_user+arr_dn[i]["userid"]);  // 用户名链接
            node_dn.find(".dn_left .dn_user_avatar a img").attr("src",url_img+arr_dn[i]["avatar"]);  // 用户头像
            node_dn.find(".dn_zannum span").text(arr_dn[i]["zan"]);  //  点赞数
            //node_dn.find(".dn_dianzan a").attr("href",arr_dn[i]["avatar"]);  //  点赞链接
            node_dn.find(".dn_title a").attr("href",url_dn_detail+arr_dn[i]["fid"]+"#"+arr_dn[i]["ID"]);  //跳转动态所在页锚点
            node_dn.find(".dn_title a span").text(arr_dn[i]["from"]);  // 所属标题
            node_dn.find(".dn_username a").attr("src",url_user+arr_dn[i]["userid"]); //用户名链接
            node_dn.find(".dn_username_name").text(arr_dn[i]["username"]); //用户名
            node_dn.find(".dn_username_signature").text(arr_dn[i]["signature"]);  //用户签名

            var digest = "";
            var content = arr_dn[i]["content"];
            if(content.length > 150){
                digest=content.substring(0,150)+"... ";
            }
            else{
                digest=content;
            }
            node_dn.find(".dn_content_digest").text(digest);  //摘要
            node_dn.find(".dn_content_digest").append("<a href='#'> 显示全部</a>");
            node_dn.find(".dn_content_text").text(content);  // 正文
            node_dn.find(".dn_action_time").text(arr_dn[i]["posttime"]);  //  发布时间


            //  添加点击摘要事件
            node_dn.find(".dn_content_digest").click(
                function(){
                    var dn_right = $(this).parent().parent().parent();
                    dn_right.find(".dn_content_text").toggle();
                    dn_right.find(".dn_content_digest").toggle();
                    dn_right.parent().find(".dn_content_close1").toggle();
                    dn_right.parent().find(".dn_content_close2").toggle();
                    dn_right.parent().find(".dn_action").toggle();
                    var comm= dn_right.find(".dn_comm");
                    if(comm.css("display") == "block"){
                        comm.css("display","none");
                    }
                    return false;  // !!
                }
            );

            // 添加点击折叠事件
            node_dn.find(".dn_content_close2,.dn_content_close1").click(
                function(){
                    var dn_right = $(this).parent().parent();
                    dn_right.find(".dn_content_text").toggle();
                    dn_right.find(".dn_content_digest").toggle();
                    dn_right.parent().find(".dn_content_close1").toggle();
                    dn_right.parent().find(".dn_content_close2").toggle();
                    dn_right.parent().find(".dn_action").toggle();
                    var comm= dn_right.find(".dn_comm");
                    if(comm.css("display") == "block"){
                        comm.css("display","none");
                    }
                    return false;  // !!
                }
            );


            // 为评论、分享、举报按钮添加hover下划线效果
            node_dn.find(".dn_action_comm,.dn_action_share,.dn_action_report").hover(
                function(){
                    $(this).css("text-decoration","underline");
                    return false;  // !!
                }
                ,
                function(){
                    $(this).css("text-decoration","none");
                    return false;  // !!
                }
            );

            // 为列表项添加点赞事件
            node_dn.find(".dn_dianzan").click(
                function(){
                    //alert('zan');
                    var dn_left = $(this).parent();
                    var zan_num = dn_left.find(".dn_zannum span");
                    var currzan = zan_num.text();
                    zan_num.text(parseInt(currzan)+1);
                    zan_num.animate({fontSize:"1.2em"},"fast");
                    $(this).animate({fontSize:"1.2em"},"fast");
                    zan_num.animate({fontSize:"1em"},"fast");

                    $(this).animate({fontSize:"1em"},"fast");
                    return false;  // !!
                }
            );


            //  加载评论，并处理评论项事件
            function load_comm(dn_id,dn_comm_items,flag){
                var load_url = "mockdata/commdata_";
                if(flag == 1){
                    load_url = "mockdata/commdata_";
                }
                else{
                    load_url = "mockdata/commdata_";
                }
                $.ajax({
                    // url:"mockdata/commdata_"+dn_id,
                    url:"mockdata/commdata",
                    type: "get",//使用get方法访问后台
                    dataType: "json",//返回json格式的数据
                    async:false,
                    //data: "pageIndex=" + pageIndex,//要发送的数据
                    complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
                    success: function(msg){//msg为返回的数据，在这里做数据绑定
                        var encoded = $.toJSON(msg);
                        ret_code =$.evalJSON(encoded).code;
                        arr_dn =$.evalJSON(encoded).data;
                        if(ret_code == "200"){
                            for(var i=0;i<arr_dn.length;i++){
                                var n_comm = t_dn_comm.clone();
                                n_comm.find(".dn_comm_id").attr("content",arr_dn[i]["ID"]);
                                n_comm.find(".dn_comm_item_left a").attr("href",url_user+arr_dn[i]["userid"]);
                                n_comm.find(".dn_comm_item_left img").attr("content",url_img+arr_dn[i]["avatar"]);
                                n_comm.find(".dn_comm_item_middle_username a").attr("href",url_user+arr_dn[i]["userid"]);
                                n_comm.find(".dn_comm_item_middle_username a span").text(arr_dn[i]["username"]);
                                n_comm.find(".dn_comm_item_mid_content span").text(arr_dn[i]["content"]);
                                n_comm.find(".dn_comm_foot_left span").text(arr_dn[i]["posttime"]);
                                n_comm.find(".dn_comm_zannum span").text(arr_dn[i]["zan"]);


                                // 为评论项添加hover效果
                                n_comm.hover(function(){
                                    $(this).find(".dn_comm_item_mid_action").toggle();
                                });

                                //  为评论项添加点赞动画效果
                                var zan = n_comm.find(".dn_comm_dianzan");
                                zan.click(
                                    function(){
                                        var zan_num = $(this).parent().find(".dn_comm_zannum");
                                        var currzan = zan_num.text();
                                        zan_num.text(parseInt(currzan)+1);
                                        zan_num.animate({fontSize:"1.2em"},"fast");
                                        $(this).animate({fontSize:"1.2em"},"fast");
                                        zan_num.animate({fontSize:"1em"},"fast");

                                        $(this).animate({fontSize:"1em"},"fast");
                                        return false;
                                    }
                                );
                                dn_comm_items.append(n_comm);
                            }
                        }
                        else{
                            alert(ret_code);
                        }
                    }
                });


            };


            // 加载某一项的热门评论
            node_dn.find(".dn_action_comm").click(
                function(){
                    var dn = $(this).parent().parent().parent().parent();
                    dn.find(".dn_comm").toggle();
                    var dn_comm_items = dn.find(".dn_comm_items");
                    dn_comm_items.empty();
                    var dn_id = dn.find(".dn_id").attr("content");
                    load_comm(dn_id,dn_comm_items,0);
                    return false;  // !!
                }
            );

            // 加载某一项的全部评论
            node_dn.find(".dn_comm_showall_button").click(
                function(){
                    var dn = $(this).parent().parent().parent().parent();
                    var dn_comm_items = dn.find(".dn_comm_items");
                    dn_comm_items.empty();
                    var dn_id = dn.find(".dn_id").attr("content");
                    load_comm(dn_id,dn_comm_items,1);
                    return false;  // !!
                }
            );

            //


            layout_list.append(node_dn);
        }
    }


    function fill_list(){
        $.ajax({
            url:"mockdata/listdata",
            type: "get",//使用get方法访问后台
            dataType: "json",//返回json格式的数据
            async:false,
            //data: "pageIndex=" + pageIndex,//要发送的数据
            complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
            success: function(msg){//msg为返回的数据，在这里做数据绑定  
                var encoded = $.toJSON(msg);
                ret_code =$.evalJSON(encoded).code;
                arr_dn =$.evalJSON(encoded).data;
                if(ret_code == "200"){
                    render_dn_list(arr_dn);
                }
                else{
                    alert(ret_code);
                }
            }
        });
    }

// 为加载数据按钮注册事件
    $(".load_flag").click(function(){
        if(num <= maxnum){
            fill_list();
            num++;
        }
        else{
            load_flag.find("#load_flag_info").css("display","block");
            load_flag.find("#load_flag_button").css("display","none");
        }
    });




    fill_list();



});