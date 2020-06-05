class AccountsController < ApplicationController
  def show
    @account = User.find(params[:id])
  end
end
