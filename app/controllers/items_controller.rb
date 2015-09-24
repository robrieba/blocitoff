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

  def destroy
    @item = current_user.items.find(item_id)

    if !@item.destroy
      flash[:error] = "Comment cannot be delted."
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

  def item_id
    params.require(:id)
  end


end
