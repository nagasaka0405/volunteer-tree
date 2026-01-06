class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
       @room = Room.find(params[:room_id])
       @message = @room.messages.new(message_params)
       @message.user_id = current_user.id

       if @message.save
           redirect_to room_path(@room)
       else
           @messages = @room.messages.includes(:user)
           @entries = @room.entries
           render "rooms/show"
       end
    end

    private
    def message_params
       params.require(:message).permit(:message)
    end
end
