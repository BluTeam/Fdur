#encoding: utf-8
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :fork, :follow, :comment]
  before_action :set_current_project, only: [:update, :destroy, :create_milestone]
  before_action :comment_params, only: [:comment]

  before_action :milestone_params, only: [:create_milestone]

  # projects

  def index
    @projects = current_user.projects.order(updated_at: :desc)
    @project = current_user.projects.build
  end

  def show
    classify_milestones_and_comments
    @milestone = @project.milestones.build
  end

  def create
    @projects = current_user.projects.order(updated_at: :desc)
    @project = current_user.projects.build project_params
    if @project.save
      flash[:success] = '创建成功'
      redirect_to action: :index
    else
      flash[:danger] = '创建失败'
      render action: :index
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = '修改成功'
      redirect_to action: :show
    else
      flash[:danger] = '编辑失败'
      redirect_to action: :show
    end
  end

  def destroy
    @project.destroy
    flash[:success] = '删除成功'
    redirect_to projects_url
  end

  # milestones

  def create_milestone
    @milestone = @project.milestones.build milestone_params
    if @milestone.save
      flash[:success] = '创建成功'
      redirect_to project_path(@project)
    else
      classify_milestones_and_comments
      flash[:danger]= '创建失败'
      render action: :show
    end
  end

  def fork
    if @project.user != current_user
      temp = @project.forks_count + 1
      @project.update!(forks_count: temp)
      new_project = Project.new
      new_project.fork_from @project,current_user.id
      flash[:success] = '拷贝成功，已加入您的私有微计划'
      redirect_to new_project
    end
  end

  def follow
    if current_user.followed? @project
      Follow.ransack({user_id_eq: current_user.id, porject_id_eq: @project.id}).result.first.destroy!
    else
      @project.follows.create! user_id: current_user.id
    end
    flash[:success] = '收藏成功'
    redirect_to @project
  end

  def comment
    comment = comment_params
    comment[:project_id] = @project.id
    comment[:user_id] = current_user.id
    if Comment.create comment
      flash[:success] = '评论成功'
      classify_milestones_and_comments
      render 'milestones/reload_milestones'
    else
      flash.now[:failed] = '评论失败'
      render action: :show
    end
  end


  private

    def set_project
      @project = Project.where(id: params[:id]).first
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_current_project
      @project = current_user.projects.where(id: params[:id]).first
      unless @project
        redirect_to '/404.html'
      end
    end

    def project_params
      params.require(:project).permit(:name,:description,:is_public,:image)
    end

    def milestone_params
      params.require(:milestone).permit(:name,:image,:state,:reflection,:description)
    end

    def classify_milestones_and_comments
      @milestones =  @project.milestones.nested_set.all if @project
      # @milestones_undo = milestones.select {|m| m.state == 'undo'}
      # @milestones_doing = milestones.select {|m| m.state == 'doing'}
      # @milestones_finished = milestones.select{|m| m.state == 'finished'}
      # @comments = @project.comments
    end

end
