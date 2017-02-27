/**
 * Created by gxh on 2017/2/6.
 */


$(".zm-votebar .up").click(function () {
    var id = $(this).closest("div").attr("id");
    if(!$(this).hasClass("pressed")) {
        $(this).addClass("pressed");
//            var id = $(this).closest("div").attr("id");
        $(this).next().removeClass("pressed");
        var star = $(this).find("span:first").text();
        $(this).find("span:first").text(parseInt(star) + 1);

        // $.post("${ctx}/answer/agree", {answerId : id, userId : ${user.id}}, function(data){

        // });

    }else{
        $(this).removeClass("pressed");
        var star = $(this).find("span:first").text();
        $(this).find("span:first").text(parseInt(star) - 1);
        // $.post("${ctx}/answer/cancelAgree", {answerId : id, userId : ${user.id}}, function(data){
        //
        // });
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
        // $.post("${ctx}/answer/disagree", {answerId : id, userId : ${user.id}}, function(data){

        // });
    }else{
        $(this).removeClass("pressed");
        // $.post("${ctx}/answer/cancelDisagree", {answerId : id, userId : ${user.id}}, function(data){

        // });
    }
});
