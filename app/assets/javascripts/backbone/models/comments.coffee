class Fdur.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    content: null
    user_id: null
    created_at: null
    user_name: Fdur.Instance.Others.user_name
    user_avatar: Fdur.Instance.Others.user_avatar

class Fdur.Collections.CommentsCollection extends Backbone.Collection
  model: Fdur.Models.Comment

  url: "/projects/#{Fdur.Instance.Others.project_id}/comment"