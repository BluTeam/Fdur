#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views/item
#= require_tree ./views/collection
#= require_tree ./views/composite
#= require_tree ./views/layout
#= require_tree ./routers
#= require ./init

window.Fdur =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {
    Collection: {}
    Composite: {}
    Item: {}
    Layout: {}
  }
  Instance: {
    Models: {}
    Collections: {}
    Views: {}
    Others: {}
  }