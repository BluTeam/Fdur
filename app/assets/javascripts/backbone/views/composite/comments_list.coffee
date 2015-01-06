class Fdur.Views.Composite.CommentsList extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/composite/comments_list"]

  tagName: 'div'
  className: ''

  childViewContainer: '[data-flag="comments"]'
  childView: Fdur.Views.Item.CommentItem
  emptyView: Fdur.Views.Item.EmptyView

  initialize: (options) ->
    this.collection = new Fdur.Collections.CommentsCollection
    this.collection.url = "/projects/#{Fdur.Instance.Others.project_id}/comment"
    this.collection.fetch()
