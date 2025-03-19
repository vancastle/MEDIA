class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hide_upperbar = true
  end
end
