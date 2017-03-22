class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(id: params[:id])
  end

  def create
    @chatroom = Chatroom.create(name: params[:name])
    redirect_to "/chatrooms/#{@chatroom.id}"
  end
end
