class MessagesController < ApplicationController
  def create
    @assignation = Assignation.find(params[:assignation_id])
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

  def message_params
    params.require(:message).permit(:content)
  end
end
