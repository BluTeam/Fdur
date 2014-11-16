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

    @collection = Fdur.Instance.Collections.comments
    @collection.fetch()
    @collection.create(@model.toJSON())
    this.$("#content").val("")
    return false

  onRender: ->
    this.$("form#new-comment").backboneLink(@model)