class UsersController < ApplicationController
  before_action :require_user

  def show
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Information has been updated'
      redirect_to '/profile'
    else
      flash[:notice] = flash.now[:error] = current_user.errors.full_messages.to_sentence      
      redirect_to '/profile/edit'
    end
  end

  private

    def user_params
      params.permit(:first_name, :last_name, :email)
    end
end
