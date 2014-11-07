$(document).ready ->
  if $('body').is('[data-page="users-show"]')
    $("#follow").click ->
      $.ajax({
        type: 'POST',
        url: "/userfollow" ,
        async: true ,
        data: {id:"1"},
        datatype :"text",
        success: (info)->
                   if info=="follow"
                     $("#follow").text "关注中....." 
                   if info=="unfollow"
                     $(".btn-group button").text "取消关注中..."
      }); 