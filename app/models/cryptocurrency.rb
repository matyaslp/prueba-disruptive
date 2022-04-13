class Cryptocurrency < ApplicationRecord
  validates :name, :interest, presence: true
  
  def calculate(amount, month, actual_price)
    projection_usd    = amount * (1 + interest/100.to_f)** month
    projection_crypto = projection_usd / actual_price.to_f

    "MES_#{month} $#{projection_usd} // #{name}: #{projection_crypto}"
  end
end