class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save!
      flash[:notice] = 'Your message has been sent'
      redirect_to root_path
    else
      flash[:error] = 'Whoops. All fields are required.'
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:email, :name, :body)
  end

end
