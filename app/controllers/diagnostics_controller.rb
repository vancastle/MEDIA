class DiagnosticsController < ApplicationController
  before_action :set_consultation, only: %i[create]

  def index
    @diagnostics = Diagnostic.where(consultation_id: params[:consultation_id]).last(3)

  end

  def show
    @diagnostic = Diagnostic.find(params[:id])
  end

  def new
    @diagnostic = Diagnostic.new
    if params[:consultation_id]
      @consultation = Consultation.find(params[:consultation_id])
      @consultation.prompt = ""
    else
      @consultations = Consultation.where(user: current_user).order(:starts_at)
    end
  end

  def create
    @consultation.update(consultation_params)

    results(@consultation).each do |result|
      @diagnostic = Diagnostic.new(
        specialty: result["specialty"],
        description: result["description"]
      )
      @diagnostic.consultation = @consultation

      render :new, status: :unprocessable_entity unless @diagnostic.save
    end

    redirect_to consultation_diagnostics_path(@consultation)
  end

  private

  def set_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end

  def consultation_params
    params.require(:consultation).permit(:prompt)
  end

  def results(consultation)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          {
            role: "developer",
            content: consultation.command
          },
          {
            role: "user",
            content: consultation.prompt
          }
        ],
      }
    )

    JSON.parse(chatgpt_response["choices"][0]["message"]["content"])
  end
end
