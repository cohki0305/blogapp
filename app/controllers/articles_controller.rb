class ArticlesController < ApplicationController
  def index
    @article = Article.first
  end
end
