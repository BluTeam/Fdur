class Fdur.Views.Item.NewComment extends Backbone.Marionette.ItemView
  template: JST["backbone/templates/item/new_comment"]

  tagName: 'li'
  className: 'list-group-item'

  initialize: (options) ->
    super(options)
    @model = new Fdur.Models.Comment

  events:
    "submit #new-comment": "save"

  save: () ->
    this.collection = Fdur.Instance.Views.comments_index.collection
    @collection.create(@model.toJSON(),wait: true)
    @collection.fetch()
    this.$("#content").val("")
    return false

  onRender: ->
    this.$("form#new-comment").backboneLink(@model)