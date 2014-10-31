class InfoshowController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @projects = find_user.projects.order(updated_at: :desc)
    @user = find_user
  end

  private

  def find_user
    @user=User.where(id: params[:id]).first
  end

end