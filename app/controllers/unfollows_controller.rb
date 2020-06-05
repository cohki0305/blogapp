class UnfollowsController < ApplicationController
  def create
    current_user.unfollow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end
