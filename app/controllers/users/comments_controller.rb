#encoding: utf-8
# class CommentsController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_project
#   before_action :comment_params
#
#   def create
#     @comment = @project.comments.bulid
#   end
#
#   private
#
#   def set_project
#     @project = Project.where(id: params[:project_id]).first
#   end
#
#   def comment_params
#     params.require(:comment).permit(comment)
#   end
# end
