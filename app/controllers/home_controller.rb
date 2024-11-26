class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def dashboard
    # Aquí va la lógica del dashboard
  end
end
