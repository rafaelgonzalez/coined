require 'coined/coin/silver'

module Coined
  module Coin
    module Copper
      GOLD_VALUE = 0.01

      def self.value(coin)
        (BigDecimal.new(GOLD_VALUE.to_s).div(BigDecimal.new(coin::GOLD_VALUE.to_s), 3)).to_f
      end
    end
  end
end
