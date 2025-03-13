class AssignationsController < ApplicationController
  before_action :set_assignation, only: [:show]

  def index
    @assignations = Assignation.all
  end

  def show
    @doctor = @assignation.user
    @diagnostic = @assignation.diagnostic
    @consultation = @diagnostic.consultation
    @patient = @consultation.patient
  end

  def new
    @diagnostic = Diagnostic.find(params[:diagnostic_id])
    @assignation = @diagnostic.assignations.build
  end

  def create
    @diagnostic = Diagnostic.find(params[:diagnostic_id])
    @assignation = @diagnostic.assignations.build(assignation_params)

    if @assignation.save
      redirect_to @assignation, notice: 'Assignation créée avec succès.'
    else
      render :new
    end
  end

  private

  def set_assignation
    @assignation = Assignation.find(params[:id])
  end

  def assignation_params
    params.require(:assignation).permit(:status)
  end
end
