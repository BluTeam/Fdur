class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:detail, :detail_update]
  before_action :user_params, only: [:detail_update]
  before_action :set_user, only: [:show]

  def detail
    @myfriends= current_user.myfriends
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
    @projects = @user.projects.order(updated_at: :desc)
  end

  private 

  def user_params
    params.require(:user).permit(:name, :sex, :birthday, :profession, :introduction, :address, :qq, :telephone, :avatar)
  end

  def set_user
    @user = User.where(id: params[:id]).first
  end

end