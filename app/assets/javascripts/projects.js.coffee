$(document).ready ->
  if $('body').is('[data-page="projects-create"]')
    $('#new_project').click()
  if $('body').is('[data-page="projects-create_milestone"]')
    $('#new_milestone').click()
  if $('body').is('[data-page="projects-index"]')
    $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
  if $('body').is('[data-page="projects-show"]')
    project_image=$("#ImgPr_project").attr("src")
    $("#project_image").change ->
      if $(@).val() == ""
        $("#ImgPr_project").attr "src", project_image
    $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
    $('[data-flag="milestone_image"]').change ->
      if $(@).val()!=""
        $("#milestone_imgbox").css "display","block"
    $('[data-flag="milestone_image"]').uploadPreview({ Img: "ImgPr_milestone", Width: 300, Height: 300 });

  