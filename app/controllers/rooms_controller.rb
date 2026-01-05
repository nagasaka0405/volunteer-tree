class RoomsController < ApplicationController
    before_action :authenticate_user!

    def show
        @room = Room.find(params[:id])
        
        #　参加者でなければアクセス禁止
        unless Entry.exists?(user_id: current_user.id, room_id: @room.id)
            redirect_back(fallback_location: root_path)
            return
        end
        
        @messages = @room.messages.includes(:user)
        @message = Message.new
        @entries = @room.entries
    end
end
