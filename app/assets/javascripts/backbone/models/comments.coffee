class Fdur.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    content: null
    created_at: null
    user_name: null
    user_avatar: null

class Fdur.Collections.CommentsCollection extends Backbone.Collection
  model: Fdur.Models.Comment

