class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
  end

  def speak(data)
    @user = User.find(data['user_id'])

    @message = Message.new

    @message.text = data['text']
    @message.user_id = data['user_id']
    @message.room_id = data['room_id']
    @message.save
    # I think there are better way
    #Message.all.desc('_id').limit(20)

    ActionCable.server.broadcast(
    "chat_#{data['room_id']}",
    message:  data['text'],
    nick: @user.nick
    )
  end



end
