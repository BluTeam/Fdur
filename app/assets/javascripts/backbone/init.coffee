viewApp = new Backbone.Marionette.Application
viewApp.addInitializer (options) ->
  viewApp.addRegions
    comments: ".Comments"
    newComment: ".NewComment"

  Fdur.Instance.Collections.comments = new Fdur.Collections.CommentsCollection(options.comments)
  Fdur.Instance.Views.comments_index = new Fdur.Views.Composite.CommentsList({collection: Fdur.Instance.Collections.comments})
  Fdur.Instance.Views.comments_new = new Fdur.Views.Item.NewComment()

  viewApp.comments.show(Fdur.Instance.Views.comments_index)
  viewApp.newComment.show(Fdur.Instance.Views.comments_new)

Fdur.Instance.app = viewApp