require 'coined/coin/silver'
require 'coined/coin/platinum'

module Coined
  module Coin
    module Gold
      GOLD_VALUE = 1.0

      def self.value(coin)
        (BigDecimal.new(GOLD_VALUE.to_s).div(BigDecimal.new(coin::GOLD_VALUE.to_s), 3)).to_f
      end
    end
  end
end
