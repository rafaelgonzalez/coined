require 'coined/coin/copper'
require 'coined/coin/gold'

module Coined
  module Coin
    module Silver
      GOLD_VALUE = 0.1

      def self.value(coin)
        (GOLD_VALUE / coin::GOLD_VALUE).round(3)
      end
    end
  end
end
