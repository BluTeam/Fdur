#encoding: utf-8
class MilestonesController < ApplicationController
  include TheSortableTreeController::ReversedRebuild
  before_action :set_project
  before_action :set_milestone


  def destroy
    @milestone.destroy
    flash[:success] = '删除成功'
    redirect_to project_path @project.id
  end


  private

  def set_project
    @project = current_user.projects.where(id: params[:project_id]).first
  end

  def set_milestone
    @milestone = @project.milestones.where(id: params[:format]).first
  end

end
