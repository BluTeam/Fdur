$(document).ready ->
  if $('body').is('[data-page="users-detail"]') || $('body').is('[data-page="registrations-update"]')
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
        datatype: "JSON",
        success: (info)->
          tmp1 = parseInt(info.user_exp)
          tmp2 = parseInt(info.level_exp)
          tmp_per = (tmp1/tmp2)*100.toString()+"%"
          $("#level_num").text info.level_num
          $("#level_name").text info.level_name
          $(".progress-bar").attr "aria-valuemax", info.level_exp
          $(".progress-bar").attr "aria-valuenow", info.user_exp
          $(".progress-bar").css "width",tmp_per
          $(".progress-bar").text info.user_exp + "/" + info.level_exp
          $("#report_btn").text "已签到"
      });

    avatar_large=$("#ImgPr_large").attr("src")
    avatar_mid=$("#ImgPr_mid").attr("src")
    avatar_small=$("#ImgPr_small").attr("src")
    $("#list_content").perfectScrollbar();
    $("#user_qq")
    .keyup ->
      tmp =$(@).val()
      $(@).val tmp.replace /\D|^0/g,''
    .bind "paste" , ->
      tmp =$(@).val()
      $(@).val tmp.replace /\D|^0/g,''
    .css "ime-mode", "disabled"
    $("#user_telephone")
    .keyup ->
      tmp =$(@).val()
      $(@).val tmp.replace /\D|^0/g,''
    .bind "paste" , ->
      tmp =$(@).val()
      $(@).val tmp.replace /\D|^0/g,''
    .css "ime-mode", "disabled"
    $("#user_avatar").uploadPreview({ Img: "ImgPr_large", Width: 180, Height: 180 });
    $("#user_avatar").uploadPreview({ Img: "ImgPr_mid", Width: 50, Height: 50 });
    $("#user_avatar").uploadPreview({ Img: "ImgPr_small", Width: 30, Height: 30 });
    $("#upload_btn").click ->
      $("#user_avatar").click()
    $("#user_avatar").change ->
      if $(@).val() == ""
        $("#ImgPr_large").attr "src", avatar_large
        $("#ImgPr_mid").attr "src", avatar_mid 
        $("#ImgPr_small").attr "src", avatar_small  
        $("#save_btn").attr "disabled", "disabled"
      else
        $("#save_btn").removeAttr("disabled")
    if $("#last_update").text().toString().length > 20
       tmp = $("#last_update").text()
       tmp = tmp.toString().substr(0,20)
       tmp = tmp + "..."
       $("#last_update").text tmp
  if $('body').is('[data-page="registrations-update"]')
    $('a#safe').click()
    $('[data-target="#passwordModal"]').click()
  

