class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(4)
  end  
end
