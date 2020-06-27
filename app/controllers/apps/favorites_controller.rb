class Apps::FavoritesController < Apps::ApplicationController
  def index
    @articles = current_user.favorite_articles
  end
end
