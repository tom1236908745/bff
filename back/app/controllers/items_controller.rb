class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end
  def show
    @item = Item.find_by(params[:id])
    
  end

  def new
    
  end
  def create
    @item = Item.new(content: params[:content])
    @item.save
    redirect_to("/items/index")
  end
end
