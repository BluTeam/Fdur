$(document).ready ->

  # turbolinks环境中加载backbone
  backbone_engine = () ->
    viewApp = new Backbone.Marionette.Application
    viewApp.addInitializer (options) ->
      viewApp.addRegions
        comments: ".Comments"
        newComment: ".NewComment"

      Fdur.Instance.Collections.comments = new Fdur.Collections.CommentsCollection(options.comments)
      Fdur.Instance.Views.comments_index = new Fdur.Views.Composite.CommentsList({collection: Fdur.Instance.Collections.comments})
      Fdur.Instance.Views.comments_new = new Fdur.Views.Item.NewComment()

      Fdur.Instance.Others.user_name = options.user_name
      Fdur.Instance.Others.user_avatar = options.user_avatar
      Fdur.Instance.Others.project_id = options.project_id

      viewApp.comments.show(Fdur.Instance.Views.comments_index)
      viewApp.newComment.show(Fdur.Instance.Views.comments_new)

    Fdur.Instance.app = viewApp
    _comments = $.parseJSON($('#marionette').attr('comments'))
    _comments = $.parseJSON(_comments)
    Fdur.Instance.app.start({comments: _comments, user_name: $('#marionette').attr('user_name'), user_avatar: $('#marionette').attr('user_avatar'), project_id: $('#marionette').attr('project_id')});
  #---------------------------

  if $('body').is('[data-page="projects-create"]')
    $('#new_project').click()
  if $('body').is('[data-page="projects-create_milestone"]')
    $('#new_milestone').click()
    backbone_engine()
  if $('body').is('[data-page="projects-index"]')
    $("#project_image").uploadPreview({ Img: "ImgPr_project", Width: 300, Height: 300 });
  if $('body').is('[data-page="projects-show"]')
    backbone_engine()
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
  if $('body').is('[data-page="projects-preview"]')
    backbone_engine()


  