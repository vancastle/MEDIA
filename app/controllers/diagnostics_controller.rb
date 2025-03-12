class DiagnosticsController < ApplicationController
  before_action :set_consultation, only: %i[create]

  def index; end

  def show; end

  def new
    @diagnostic = Diagnostic.new
    if params[:consultation_id]
      @consultation = Consultation.find(params[:consultation_id])
    else
      @consultations = Consultation.where(user: current_user).order(:starts_at)
    end
  end

  def create
    @diagnostic = Diagnostic.new(diagnostic_params)
    @diagnostic.consultation = @consultation
  end

  private

  def set_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end

  def diagnostic_params
    params.require(:diagnostic).permit(:desciption, :specialty)
  end
end
