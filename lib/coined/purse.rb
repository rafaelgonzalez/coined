module Coined
  class Purse
    attr_reader :coins

    def initialize(copper = 0, silver = 0, gold = 0, platinum = 0)
      @coins = []

      add_coins(Coin::Copper, copper)
      add_coins(Coin::Silver, silver)
      add_coins(Coin::Gold, gold)
      add_coins(Coin::Platinum, platinum)
    end

    def add_coins(coin_type, amount)
      @coins += Array.new(amount, coin_type)
    end

    def remove_coins(coin_type, amount)
      amount.times do
        break if @coins.index(coin_type).nil?

        @coins.delete_at(@coins.rindex(coin_type))
      end

      @coins
    end

    def amount(coin_type)
      @coins.count(coin_type)
    end

    def value(coin_type)
      coins.map do |coin|
        BigDecimal.new(coin.value(coin_type).to_s)
      end.inject(&:+).to_f
    end
  end
end
