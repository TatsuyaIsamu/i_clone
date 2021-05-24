class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path
  end
end
