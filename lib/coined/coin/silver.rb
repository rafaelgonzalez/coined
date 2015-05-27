require 'coined/coin/copper'
require 'coined/coin/gold'

module Coined
  module Coin
    module Silver
      GOLD_VALUE = 0.1

      def self.value(coin)
        (BigDecimal.new(GOLD_VALUE.to_s).div(BigDecimal.new(coin::GOLD_VALUE.to_s), 3)).to_f
      end
    end
  end
end
