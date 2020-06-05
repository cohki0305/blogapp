class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_id = current_user.followings.pluck(:id)
    @articles = Article.where(user_id: user_id)
  end
end
