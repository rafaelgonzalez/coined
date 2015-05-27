require 'coined/coin/silver'

module Coined
  module Coin
    module Copper
      GOLD_VALUE = 0.01

      def self.value(coin)
        (GOLD_VALUE / coin::GOLD_VALUE).round(3)
      end
    end
  end
end
