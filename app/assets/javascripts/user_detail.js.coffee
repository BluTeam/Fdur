$(document).ready ->
  if $('body').is('[data-page="users-detail"]') || $('body').is('[data-page="registrations-update"]')
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
  

