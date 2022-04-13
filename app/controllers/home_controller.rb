require 'csv'
class HomeController < ApplicationController
  include HTTParty

  before_action :set_prices, only: [:index, :calculate]
  before_action :set_cryptos, only: [:export, :calculate]

  def index
  end

  def refresh
    render json: response_messari
  end

  def calculate
    @amount = invest_params[:amount].to_i
    
    render layout: false
  end

  def export
    @amount  = export_params[:amount].to_i
    @btc_usd = export_params[:btc_usd]
    @eth_usd = export_params[:eth_usd]

    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=projection.csv"
      end
    end
  end

  private

  def set_cryptos
    @btc = Bitcoin.instance
    @eth = Ethereum.instance
  end

  def set_prices
    json = response_messari
    @btc_usd = response_messari[:btc]
    @eth_usd = response_messari[:eth]
  end

  def response_messari
    response = HTTParty.get('https://data.messari.io/api/v1/assets?fields=symbol,metrics/market_data/price_usd')
    json = JSON.parse(response.body)

    return { 'btc': 'limit exeded', 'eth': 'limit exeded' } unless json["data"] 
    {
      'btc': json["data"][0]["metrics"]["market_data"]["price_usd"],
      'eth': json["data"][1]["metrics"]["market_data"]["price_usd"]
    } 
  end

  def export_params
    params.permit(:amount, :btc_usd, :eth_usd)
  end

  def invest_params
    params.permit(:amount)
  end
end
