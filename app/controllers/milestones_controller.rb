#encoding: utf-8
class MilestonesController < ApplicationController
  include TheSortableTreeController::Rebuild
  before_action :set_project, except: [:rebuild, :edit]
  before_action :set_milestone, only: [:destroy, :update, :index]
  before_action :milestone_params, only: [:create, :update, :index]

  def index

  end

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

  def update
    if @milestone.update(milestone_params)
      flash[:success] = '里程碑更新成功'
      redirect_to controller: :projects, action: :show, id: @project.id
    else
      classify_milestones_and_comments
      flash[:failed] = '里程碑更新失败'
      redirect_to controller: :projects, action: :show, id: @project.id
    end
  end

  def destroy
    @milestone.destroy
    flash[:success] = '删除成功'
    redirect_to @project
  end


  private

  def milestone_params
    params.require(:milestone).permit(:name,:image,:state,:reflection,:description)
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
