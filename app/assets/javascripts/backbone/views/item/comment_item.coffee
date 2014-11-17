class Fdur.Views.Item.CommentItem extends Backbone.Marionette.ItemView
  template: JST["backbone/templates/item/comment_item"]

  tagName: 'li'
  className: 'list-group-item'

  onBeforeRender: ->

    _model = this.model
    if _model.get('user_id') != null
      Backbone.ajax(
        url: "/users/"+_model.get('user_id')+"/user_json",
        type: "GET",
        dataType: "json",
        async: false,
        success: (result) =>
          this.model.set('user_name', result.user_name)
          this.model.set('user_avatar', result.user_avatar)
      );
      time = _model.get('created_at')
      time = new Date(time)
      this.model.set( 'created_at', time.pattern("yyyy年MM月dd日 HH:mm"))
