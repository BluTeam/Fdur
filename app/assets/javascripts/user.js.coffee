$(document).ready ->
  tmp_max= $("#max_exp").text()
  tmp_now= $("#exp").text()
  per = ((tmp_now/tmp_max)*100).toString()+"%"
  $(".progress-bar").attr "aria-valuemax", tmp_max
  $(".progress-bar").attr "aria-valuenow", tmp_now
  $(".progress-bar").css "width",per
  $(".progress-bar").text tmp_now + "/" + tmp_max
  $("#report_btn").click ->
    $(@).attr "disabled", "disabled"
    $(@).text "签到中..."
    $.ajax({
      type: 'get',
      url: "/users/report" ,
      async: false ,
      datatype :"text",
      success: (info)->
        tmp = info.split("&")
        tmp_per = (tmp[0]/tmp[2])*100.toString()+"%"
        $("#level_num").text tmp[3]
        $("#level_name").text tmp[1]
        $(".progress-bar").attr "aria-valuemax", tmp[2]
        $(".progress-bar").attr "aria-valuenow", tmp[0]
        $(".progress-bar").css "width",tmp_per
        $(".progress-bar").text tmp[0] + "/" + tmp[2]
        $("#report_btn").text "已签到"
    });
  if $('body').is('[data-page="users-show"]')
    $(".follow").click ->
      if $(@).attr("id")!="unfollow"
        $(@).text "关注中....."
        $(@).addClass("disabled")
      else
        $(".btn-group button").text "取消关注中..."
        $(".btn-group button").addClass("disabled")
      tmp = $("#user_id").text()
      $.ajax({
        type: 'POST',
        url: "/users/follow" ,
        async: false ,
        data: "id="+tmp,
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