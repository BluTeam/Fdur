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
        if options[:preview].blank?
          "
            <li class='list-group-item #{ node.state }' data-node-id='#{ node.id }'>
              <div class='item'>
                <i class='handle'>
                  <span class='glyphicon glyphicon-th-list'></span>
                </i>
                <p class='title'>#{ show_link }</p>
                #{ show_pic }
                #{ show_description }
                #{ show_reflection }
                <p class='time'>更新时间： #{ node.updated_at.strftime("%y年%m月%d日 %H:%M") }</p>
                #{ controls }
              </div>
              #{ children }
            </li>
          "
        elsif options[:preview] == true
          "
            <li class='list-group-item #{ node.state }' data-node-id='#{ node.id }'>
              <div class='item'>
                <p class='title'>#{ show_link }</p>
                #{ show_pic }
                #{ show_description }
                #{ show_reflection }
                <p class='time'>更新时间： #{ node.updated_at.strftime("%y年%m月%d日 %H:%M") }</p>
              </div>
              #{ children }
            </li>
          "
        end
      end

      def show_pic
        node = options[:node]
        unless node.image.blank?
          "<p class='milestone_img'><img title='查看原图' src='#{ node.image.small.url }' alt='/support-loading.gif'  id='original' data-toggle='modal' data-target='#imageOriginalModal#{node.id}'></p>"
        end
      end

      def show_description
        node = options[:node]
        unless node.description.blank?
          "
            <p class='milestone_description'>描述：#{ node.description }</p>
          "
        else
          ""
        end
      end

      def show_reflection
        node = options[:node]
        if node.state == 'finished' && !node.reflection.blank?
          "<p class='milestone_description'>心得：#{ node.reflection }</p>"
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
            #{ play_or_return }
            <a id='edit_milestone' class='edit' data-toggle='modal' data-target='#editMilestoneModal#{node.id}' title='编辑'>
              <span class='glyphicon glyphicon-pencil'></span>
            </a>
            <a class='delete' data-method='delete' data-confirm='确定删除该里程碑?' href='/projects/#{node.project.id}/milestones.#{node.id}' rel='nofollow' title='删除'>
              <span class='glyphicon glyphicon-remove'></span>
            </a>
          </div>
        "
      end

      def play_or_return
        node = options[:node]
        if node.state == "undo"
          "
            <a id='play_milestone' class='edit' data-toggle='modal' data-target='#playMilestoneModal#{node.id}' title='完成'>
              <span class='glyphicon glyphicon-ok'></span>
            </a>
          "
        elsif node.state == "finished"
          "
            <a id='return_milestone' class='edit' data-confirm='重做将删除心得，确定要这样做吗？' href='/projects/#{node.project.id}/return_milestone?milestone_id=#{node.id}' data-method='post' title='重做'>
              <span class='glyphicon glyphicon-repeat'></span>
            </a>
          "
        end
      end

      def children
        unless options[:children].blank?
          "<ol class='nested_set'>#{ options[:children] }</ol>"
        end
      end

    end
  end
end
