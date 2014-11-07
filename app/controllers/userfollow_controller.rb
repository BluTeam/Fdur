class UserfollowController < ApplicationController
  

  def follow

    info = current_user.add_user set_user
    render :text => info  
  end

  private

  def set_user
    @user = User.where(id: params[:id]).first
  end
end