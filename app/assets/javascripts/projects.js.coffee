$(document).ready ->
  if $('body').is('[data-page="projects-create"]')
    $('#new_project').click()
  if $('body').is('[data-page="projects-create_milestone"]')
    $('#new_milestone').click()
  $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
