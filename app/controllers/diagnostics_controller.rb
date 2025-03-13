class DiagnosticsController < ApplicationController
  before_action :set_consultation, only: %i[create]

  def index
    @diagnostics = Diagnostic.where(consultation_id: params[:consultation_id])
  end

  def show
    @diagnostic = Dia
  end

  def new
    @diagnostic = Diagnostic.new
    if params[:consultation_id]
      @consultation = Consultation.find(params[:consultation_id])
    else
      @consultations = Consultation.where(user: current_user).order(:starts_at)
    end
  end

  def create
    @consultation.update(consultation_params)

    choices(@consultation).each do |choice|
      @diagnostic = Diagnostic.new(
        specialty: "Boisson gazeuse",
        description: choice["message"]["content"]
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

  def choices(consultation)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{
          role: "user",
          content: consultation.prompt
        }],
        n: 3
      }
    )

    chatgpt_response["choices"]
  end
end
