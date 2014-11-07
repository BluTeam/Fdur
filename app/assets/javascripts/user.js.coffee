$(document).ready ->
  if $('body').is('[data-page="users-show"]')
    $("#follow").click ->
      $.ajax({
        type: 'POST',
        url: "/userfollow" ,
        data: {id:"1"},
        datatype :"text",
        success:(info)->
                  if info=="follow"
                    $("#follow").removeClass("btn-success")
                    $("#follow").addClass("btn-danger")
                    $("#follow").text "取消关注"
                    $("#follow").blur()
                  if info=="unfollow"
                    $("#follow").removeClass("btn-danger")
                    $("#follow").addClass("btn-success")
                    $("#follow").text "＋关注"
                    $("#follow").blur()
      });