class ItemsController < ApplicationController
  before_action :get_baskets

  def index
    @items = Item.all
  end

  def add_to_basket
    exist, item = Basket.item_exist basket_params[:item_id]

    @quantity = basket_params[:quantity].to_i

    if exist
      @basket = item
      new_quantity = item.quantity + @quantity
      @basket.update_attributes(quantity: new_quantity)
    else      
      @basket = Basket.new basket_params
      @basket.save
    end
    render "items/add_to_basket"
    
  end

  def clear_basket
    Basket.delete_all

    render "items/clear_basket"
  end

  private

  def basket_params
    params.require(:basket).permit :item_id, :quantity
  end

  def get_baskets
    @baskets = Basket.all
    @basket = Basket.new
  end
end
