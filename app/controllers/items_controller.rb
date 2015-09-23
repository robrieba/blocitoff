class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
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
