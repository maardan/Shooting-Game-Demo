class ChatsController < ApplicationController
  def new
    @chat = Chat.new
    @chats = Chat.order('created_at DESC')
    @gamerooms = Gameroom.order('created_at DESC')
  end

  def create
    respond_to do |format|
      if current_user
        @chat = current_user.chats.build(chat_params)
        if @chat.save
          flash.now[:success] = 'Your message was successfully sent!'
        else
          flash.now[:error] = 'Your message has error.'
        end
        format.html {redirect_to root_url}
        format.js
      else
        format.html {redirect_to root_url}
        format.js {render nothing: true}
      end
    end
  end

  def index
     @chats = Chat.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end 

  private

  def chat_params
    params.require(:chat).permit(:body)
  end
end
