class AssignationsController < ApplicationController
  before_action :set_assignation, only: [:show]

  def index
    @assignations = filter(Assignation.all)
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

  def filter(assignations)
    doctor_assignations = assignations.select { |assignation| assignation.diagnostic.consultation.user == current_user }
    doctor_assignations.sort_by { |assignation| assignation.created_at }.reverse!
  end

  def set_assignation
    @assignation = Assignation.find(params[:id])
  end
end
