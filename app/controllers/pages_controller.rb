class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index]
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def home
  end
end
