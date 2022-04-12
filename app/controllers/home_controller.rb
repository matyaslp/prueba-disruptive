class HomeController < ApplicationController
  
  def index
  end

  def calculate
    byebug
    @amount = invest_params[:amount]
    render layout: false
  end

  def invest_params
    params.permit(:amount, :authenticity_token, :commit)
  end
end
