class UsersController < ApplicationController
  before_action :require_sign_in

  def show
    @items = current_user.items
  end


end
