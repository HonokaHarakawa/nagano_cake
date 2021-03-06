class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all.page(params[:page]).per(10)
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
    @item.save!
    redirect_to admin_item_path(@item)
  end 
  

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.genre_id = params[:item][:genre_id]
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end  
end
