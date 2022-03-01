class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end 

  def new
    @item = Item.new
    @genres = Genre.all
  end  
  
  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    @item.genre_id = params[:genre_id][:name]
    @item.save!
    redirect_to admin_item_path(@item)
  end 
  

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to  admin_items_path
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end  
end