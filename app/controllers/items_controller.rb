class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    @item.user = @user
    @new_item = Item.new

    if !@item.save
      flash[:error] = "Item failed to be added."
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
