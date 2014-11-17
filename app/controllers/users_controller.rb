class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :user_params, only: [:detail_update]
  before_action :set_user, only: [:show]
  before_action :set_friends_date, only: [:detail, :detail_update]

  def detail

  end

  def detail_update
    if current_user.update(user_params)
      flash[:success] = '修改成功'
      redirect_to action: :detail
    else
      flash[:danger] = '编辑失败'
      redirect_to action: :detail
    end
  end

  def show
    redirect_to(action: :detail) if @user == current_user
    @flag = current_user.is_friends @user 
    @projects = @user.projects.where(is_public: true).order(updated_at: :desc)
    @myfriends= @user.friends.sort_by {|u| u.projects.where(is_public: true).order(updated_at: :desc).first.updated_at}.reverse
  end
  
  def report 
    info = current_user.add_exp1
    render text: info.to_json
  end

  def follow
    info = current_user.add_user set_user
    render :text => info  
  end

  private

  def set_friends_date
    @myfriends = current_user.friends.sort_by {|u| u.projects.where(is_public: true).order(updated_at: :desc).first.updated_at}.reverse   
    @total_num= current_user.projects.count
    @open_num = current_user.projects.where(state: "open").count
    @finish_num = current_user.projects.where(state: "finished").count
  end

  def user_params
    params.require(:user).permit(:name, :sex, :birthday, :profession, :introduction, :address, :qq, :telephone, :avatar)
  end


  def set_user
    @user = User.where(id: params[:id]).first
  end

end