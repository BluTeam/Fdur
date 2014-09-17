#encoding: utf-8
class MilestonesController < ApplicationController
  include TheSortableTreeController::Rebuild
  before_action :set_project, except: [:rebuild]
  before_action :set_milestone, only: [:destroy, :ajax_update, :update]
  before_action :milestone_params, only: [:create, :update]

  def create
    milestone = @project.milestones.build milestone_params
    if milestone.save
      classify_milestones
      flash[:success] = '建立成功'
      redirect_to @project
    else
      flash[:failed]= '创建失败，图片链接格式不正确，看看帮助吧'
      redirect_to @project
    end
  end

  def ajax_update
    p = params.permit(:state)
    if @milestone.update(p)
      classify_milestones
      render 'reload_milestones'
    else
      render js: 'alert("error!")'
    end
  end

  def update
    if @milestone.update(milestone_params)
      classify_milestones
      render 'reload_milestones'
    else
      render js: 'alert("图片格式不正确！")'
    end
  end

  #def destroy
  #  @milestone.destroy
  #  flash[:success] = '删除成功'
  #  redirect_to @project
  #end


  private

  def milestone_params
    params.require(:milestone).permit(:name,:image,:state,:reflection)
  end

  def set_project
    @project = current_user.projects.where(id: params[:project_id]).first
    unless @project
      redirect_to '/404.html'
    end
  end

  def set_milestone
    @milestone = @project.milestones.where(id: params[:id]).first
    unless @milestone
      redirect_to '/404.html'
    end
  end

  def classify_milestones_and_comments
    @milestones =  @project.milestones.nested_set.all if @project
    # @milestones_undo = milestones.select {|m| m.state == 'undo'}
    # @milestones_doing = milestones.select {|m| m.state == 'doing'}
    # @milestones_finished = milestones.select{|m| m.state == 'finished'}
    # @comments = @project.comments
  end

end
