$(document).ready ->
  if $('body').is('[data-page="users-detail"]') || $('body').is('[data-page="registrations-update"]')
    $(".myswitch").bootstrapSwitch();
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
      $("#save_btn").removeAttr("disabled")

  if $('body').is('[data-page="registrations-update"]')
    $('a#safe').click()
    $('[data-target="#passwordModal"]').click()


