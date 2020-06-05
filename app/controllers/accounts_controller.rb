class AccountsController < ApplicationController
  def show
    @account = User.find(params[:id])
    if @account = current_user
      redirect_to profile_path
    end
  end
end
