class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:detail_update]
  before_action :user_params, only: [:detail_update]

  def detail
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
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


  private 

  def user_params
    params.require(:user).permit(:name, :sex, :birthday, :profession, :introduction, :address, :qq, :telephone, :avatar)
  end
end