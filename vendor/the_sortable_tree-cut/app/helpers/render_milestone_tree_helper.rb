#encoding: utf-8
# DOC:
# We use Helper Methods for tree building,
# because it's faster than View Templates and Partials

# SECURITY note
# Prepare your data on server side for rendering
# or use h.html_escape(node.content)
# for escape potentially dangerous content
module RenderMilestoneTreeHelper
  module Render 
    class << self
      attr_accessor :h, :options

      def render_node(h, options)
        @h, @options = h, options
        node = options[:node]
        # TODO：图画放大弹窗，编辑弹窗
        "
          <li class='list-group-item public' data-node-id='#{ node.id }'>
            <div class='item'>
              <i class='handle'>
                <span class='glyphicon glyphicon-th-list'></span>
              </i>
              <p class='title'>#{ show_link }</p>
              #{ show_description }
              #{ show_pic }
              <p class='time'>更新时间： #{ node.updated_at.strftime("%y/%m/%d %X") }</p>
              #{ controls }
            </div>
            #{ children }
          </li>
        "
      end

      def show_pic
        node = options[:node]
        unless node.image.blank?
          "<p><img src='#{ node.image.normal.url }' alt='/support-loading.gif'  id='original' data-toggle='modal' data-target='#imageOriginalModal#{node.id}'></p>"
        end
      end

      def show_description
        node = options[:node]
        unless node.description.blank?
          "<p class='milestone_description'>#{ node.description }</p>"
        else
          ""
        end
      end

      def show_link
        node = options[:node]
        title_field = options[:title]

        "#{node.send(title_field)}"
      end

      def controls
        node = options[:node]

        "
          <div class='controls'>
            <a id='edit_milestone' class='edit' data-toggle='modal' data-target='#editMilestoneModal#{node.id}'>
              <span class='glyphicon glyphicon-pencil'></span>
            </a>
            <a href='/projects/#{node.project.id}/milestones/#{node.id}' class='delete' method='delete' data-confirm='Are you sure?'>
              <span class='glyphicon glyphicon-remove'></span>
            </a>
          </div>
        "
      end

      def children
        unless options[:children].blank?
          "<ol class='nested_set'>#{ options[:children] }</ol>"
        end
      end

    end
  end
end
