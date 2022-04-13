class Bitcoin < Cryptocurrency
  def self.instance
    Cryptocurrency.where(name: "BTC").first_or_create do |crypto|
      crypto.name = "BTC"
      crypto.interest = 5
    end
  end
end
