class MessagesController < ApplicationController

  def index

    @messages = Room.find(params[:room_id])
    .messages.desc('created_at')
    .limit(params[:limit])

    messageNick = Array.new

    @messages.each do |message|
       messageNick.push([
         'name' => message.user.nick,
         'text' => message.text
         ])
    end

    json_response(messageNick)
    
  end

end
