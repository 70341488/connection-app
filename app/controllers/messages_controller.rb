class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end



  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      # @image = ActiveStorage::Attachment.find(@message.image.id)
      ActionCable.server.broadcast 'message_channel', {message: @message, category: @message.category.name, area: @message.prefectures.name, nickname: @message.user.nickname, image: url_for(@message.image.variant(resize: '200x200'))}
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  

  private

  def message_params
    params.require(:message).permit(:title, :prefectures_id, :municipalities, :category_id, :image).merge(user_id: current_user.id)
  end
end
