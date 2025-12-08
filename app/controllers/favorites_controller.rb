class FavoritesController < ApplicationController
    def create
        record = Record.find(params[:record_id])
        favorite = current_user.favorites.new(record_id: record.id)
        favorite.save
        redirect_to record_path(record)
    end

    def destroy
        record = Record.find(params[:record_id])
        favorite = current_user.favorites.find_by(record_id: record.id)
        favorite.destroy
        redirect_to record_path(record)
    end
end
