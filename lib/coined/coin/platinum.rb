require 'coined/coin/gold'

module Coined
  module Coin
    module Platinum
      GOLD_VALUE = 10.0

      def self.value(coin)
        (BigDecimal.new(GOLD_VALUE.to_s).div(BigDecimal.new(coin::GOLD_VALUE.to_s), 3)).to_f
      end
    end
  end
end
