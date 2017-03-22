class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.where(group_id: params[:group_id])
    render "index.json.jbuilder"
  end

  def create
    @message = Message.create(
      body: params[:body],
      user_id: params[:user_id],
      group_id: params[:group_id]

    )
    ActionCable.server.broadcast "activity_channel", {
      id: @message.id,
      name: @message.user.username,
      body: @message.body,
      group_id: @message.group_id,
      created_at: @message.created_at
    }
    render "show.json.jbuilder"
  end
end
