class Fdur.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  default:
    content: null

class Fdur.Collections.CommentsCollection extends Backbone.Collection
  model: Fdur.Models.Comment

  url: '/projects/18/comment'