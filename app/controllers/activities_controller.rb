class ActivitiesController < ApplicationController

  def index
    @activities = Activity.ransack({project_is_public_true: '1'}).result.order(updated_at: :desc)
  end

end
