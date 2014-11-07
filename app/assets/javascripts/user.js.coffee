$(document).ready ->
  if $('body').is('[data-page="users-show"]')
    $("#follow").click ->
      if $(@).attr("class")!="unfollow"
        $(@).text "关注中....."
        $(@).addClass("disabled")
      else
        $(".btn-group button").text "取消关注中..."
        $(".btn-group button").addClass("disabled")
      $.ajax({
        type: 'POST',
        url: "/userfollow" ,
        async: true ,
        data: {id:"1"},
        datatype :"text",
        success: (info)->
                   if info =="follow"
                     $(".btn-group button").removeClass("disabled")
                   else
                     $("#follow").removeClass("disabled")
                     
      }); 