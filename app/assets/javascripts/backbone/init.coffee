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