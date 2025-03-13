class DiagnosticsController < ApplicationController
  def index; end

  def show
    @diagnostic = Diagnostic.find(params[:id])
    @doctors = User.where(specialty: @diagnostic.specialty).limit(3)
  end

  def new; end

  def create; end
end
