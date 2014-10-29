$(document).ready ->
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
  $("#upload_btn").click ->
    $("#user_avatar").click()
  $("#avatar_btn").click ->
    $(@).css "display", "none"
    $("#upload_btn").css "display", "block"
    $("#upload_btn").css "margin-top", "100px"
  $("#user_avatar").change ->
    $("#upload_btn").css "display", "none"
    $(".avatar_btn").css "display", "block"
    $(".avatar_btn").css "margin-top", "100px"