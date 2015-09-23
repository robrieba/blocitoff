class UsersController < ApplicationController
  before_action :require_sign_in

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

end
