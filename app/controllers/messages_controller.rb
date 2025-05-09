class MessagesController < ApplicationController
  before_action :set_assignation, only: [:index, :create]

  def index
    @messages = Message.where(assignation_id: @assignation.id)
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    @message.assignation = @assignation
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            :messages, partial: "messages/message",
            target: "messages",
            locals: { message: @message, user: current_user }
          )
        end
        format.html { redirect_to assignation_path(@assignation) }
      end
    else
      render "assignations/show", status: :unprocessable_entity
    end
  end

  private

  def set_assignation
    @assignation = Assignation.find(params[:assignation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
