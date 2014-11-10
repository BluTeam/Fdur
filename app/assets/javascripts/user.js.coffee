$(document).ready ->
  if $('body').is('[data-page="users-show"]')
    $(".follow").click ->
      if $(@).attr("id")!="unfollow"
        $(@).text "关注中....."
        $(@).addClass("disabled")
      else
        $(".btn-group button").text "取消关注中..."
        $(".btn-group button").addClass("disabled")
      $.ajax({
        type: 'POST',
        url: "/userfollow" ,
        async: false ,
        data: {id:"1"},
        datatype :"text",
        success: (info)->
                   if info =="follow"
                     $("#follow").css "display","none"
                     $(".btn-group").css "display","table"
                     $(".btn-group").css "margin-top","30px"
                     $(".btn-group").css "width","100px"
                     $("#follow").removeClass("disabled")
                     $("#follow").text "＋ 关注"
                   else
                     $(".btn-group").css "display","none"
                     $("#follow").css "display","table"
                     $("#follow").css "margin-top","30px"
                     $("#follow").css "width","100px"
                     $(".btn-group button").removeClass("disabled")
                     $(".btn-group button").html "已关注 <span class='caret'></span>"            
      }); 