class LikedArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.liked_articles
  end
end
