$(document).ready ->
  if $('body').is('[data-page="projects-create"]')
    $('#new_project').click()
  if $('body').is('[data-page="projects-create_milestone"]')
    $('#new_milestone').click()
  if $('body').is('[data-page="projects-index"]')
    $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
  if $('body').is('[data-page="projects-show"]')
    #marionette启动
#    Fdur.Instance.app.start({comments: $('#marionette').attr('comments'), user_name: $('#marionette').attr('user_name'), user_avatar: $('#marionette').attr('user_avatar'), project_id: $('#marionette').attr('project_id')});

    project_image = $("#ImgPr_project").attr("src")
    milestone_image = ""
    $("#project_image").change ->
      if $(@).val() == ""
        $("#ImgPr_project").attr "src", project_image
    $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
    $('[data-flag="milestone_image"]').change ->
      if $(@).val() != ""
        $(@).prev().css "display","block"
      else
        $(@).prev().css "display","none"


  