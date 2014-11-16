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

    @model.attributes.user_name = Fdur.Instance.Others.user_name
    @model.attributes.user_avatar = Fdur.Instance.Others.user_avatar
    date = new Date
    @model.attributes.created_at = date.pattern("yyyy年MM月dd日 HH:mm")
    @collection = Fdur.Instance.Collections.comments
    @collection.url = "/projects/#{Fdur.Instance.Others.project_id}/comment"
    @collection.fetch()
    @collection.create(@model.toJSON())
    this.$("#content").val("")
    return false

  onRender: ->
    this.$("form#new-comment").backboneLink(@model)