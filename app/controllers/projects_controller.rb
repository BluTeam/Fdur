#encoding: utf-8
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :fork, :follow, :comment]
  before_action :set_current_project, only: [:update, :destroy]
  before_action :find_current_user
  before_action :comment_params, only: [:comment]

  def index
    @projects = current_user.projects.order(updated_at: :desc)
    @project = current_user.projects.build
  end

  def show
    classify_milestones_and_comments
  end

  def create
    #@projects = current_user.projects.order(updated_at: :desc).all
    @project = current_user.projects.build project_params
    if @project.save
      flash[:success] = '创建成功'
      redirect_to action: :index
      #format.js
    else
      #flash[:danger]= '创建失败'
      render action: :index
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = '修改成功'
      redirect_to action: 'show'
    else
      flash[:failed]= '编辑失败，图片链接格式不正确，看看帮助吧'
      redirect_to action: :show
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

  #def destroy
  #  @project.destroy
  #  flash[:success] = '删除成功'
  #  redirect_to projects_url
  #end

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

    # Use callbacks to share common setup or constraints between actions.
    def set_current_project
      @project = current_user.projects.where(id: params[:id]).first
      unless @project
        redirect_to '/404.html'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name,:description,:is_public,:image)
    end

    def find_current_user
      @user = current_user
    end

    def classify_milestones_and_comments
      milestones =  @project.milestones.order(updated_at: :desc)
      @milestones_undo = milestones.select {|m| m.state == 'undo'}
      @milestones_doing = milestones.select {|m| m.state == 'doing'}
      @milestones_finished = milestones.select{|m| m.state == 'finished'}
      @comments = @project.comments
    end

end
