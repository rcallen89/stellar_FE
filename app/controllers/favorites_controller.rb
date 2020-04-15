class FavoritesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:current_user.id])
    end
  end

  def show
    @favorite = Favorite.find(params[:favorite_id])
    @object = SolarSystemFacade.new(@favorite.name)
  end

  def new
  end

  def create
    @favorite = current_user.favorites.create(favorite_params)
    @favorite.save
    flash[:success] = "#{@favorite.name} has been saved to favorites"
    redirect_to "/favorites"
  end

  def destroy
    favorite = Favorite.find(params[:favorite_id])
    favorite.destroy
    flash[:success] = "#{favorite.name} has been removed from your favorites."
    redirect_to '/favorites'
  end

  private

    def favorite_params
      params.permit(:name)
    end

end
