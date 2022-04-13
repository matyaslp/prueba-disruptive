class Ethereum < Cryptocurrency
  def self.instance
    Cryptocurrency.where(name: "ETH").first_or_create do |crypto|
      crypto.name = "ETH"
      crypto.interest = 3
    end
  end
end
