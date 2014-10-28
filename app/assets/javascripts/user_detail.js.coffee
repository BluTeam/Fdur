$(document).ready ->
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
    if $("#user_avatar").val()!=""
      $(@).css "display", "none"
      $(".avatar_btn").css "display", "block"
      $(".avatar_btn").css "margin-top", "30px"
  $("#avatar_btn").click ->
    $(@).css "display", "none"
    $("#upload_btn").css "display", "block"
    $("#upload_btn").css "margin-top", "30px"
  $("#myswitch").bootstrapSwitch();
