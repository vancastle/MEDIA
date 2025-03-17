class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user_id: current_user.id)
  end

  def new; end

  def create; end
end
