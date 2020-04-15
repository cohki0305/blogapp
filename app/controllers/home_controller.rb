class HomeController < ApplicationController
  def index
    @article = Article.first
  end

  def about
  end
end
