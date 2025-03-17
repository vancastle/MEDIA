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
    @message = Message.new
  end

  def new
    @diagnostic = Diagnostic.find(params[:diagnostic_id])
    @assignation = @diagnostic.assignations.build
    @doctor = User.find(params[:doctor_id])
  end

  def create
    @diagnostic = Diagnostic.find(params[:diagnostic_id])
    @assignation = @diagnostic.assignations.build()
    @assignation.status = "pending"

    @doctor = User.find(params[:assignation][:doctor_id])
    @assignation.user = @doctor

    if @assignation.save
      redirect_to assignations_path, notice: 'Assignation créée avec succès.'
    else
      render :new
    end
  end

  private

  def set_assignation
    @assignation = Assignation.find(params[:id])
  end
end
