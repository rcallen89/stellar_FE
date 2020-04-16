class FavoritesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:current_user.id])
    end
  end

  def show
    favorite = Favorite.find(params[:favorite_id]).name
    redirect_to "/search?search=#{favorite}"
  end

  def new
  end

  def create
    if repeat?
      flash[:notice] = "You have already favorited this item."
      redirect_to "/favorites"
    else
      @favorite = current_user.favorites.create(favorite_params)
      @favorite.save
      flash[:success] = "#{@favorite.name} has been saved to favorites"
      redirect_to "/favorites"
    end
  end

  def destroy
    favorite = Favorite.find(params[:favorite_id])
    favorite.destroy
    flash[:success] = "#{favorite.name} has been removed from your favorites."
    redirect_to '/favorites'
  end

  private

    def favorite_params
      params.permit(:name, :authenticity_token)
    end

    def repeat?
      current_user.favorites.any? do |favorite|
        favorite.name == favorite_params[:name]
      end
    end
end
