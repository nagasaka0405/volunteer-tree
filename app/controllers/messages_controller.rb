class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
       @message = Message.new(message_params)
       @message.user_id = current_user.id

       # room_idが空の場合はエラー回避
       if @message.room_id.blank?
        redirect_back(fallback_location: root_path, alert: "ルーム情報がありません")
        return
       end

       @room = Room.find(@message.room_id)

       if @message.save
           redirect_to room_path(@message.room_id)
       else
           @messages = @room.messages.includes(:user)
           render "rooms/show"
       end
    end

    private
    def message_params
       params.require(:message).permit(:room_id, :message)
    end
end
