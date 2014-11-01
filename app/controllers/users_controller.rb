class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:detail, :detail_update]
  before_action :user_params, only: [:detail_update]

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
    @projects = find_user.projects.order(updated_at: :desc)
    @user = find_user
  end

  private 

  def user_params
    params.require(:user).permit(:name, :sex, :birthday, :profession, :introduction, :address, :qq, :telephone, :avatar)
  end

  def find_user
    @user=User.where(id: params[:id]).first
  end

end