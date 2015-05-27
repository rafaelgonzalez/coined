require 'coined/coin/gold'

module Coined
  module Coin
    module Platinum
      GOLD_VALUE = 10.0

      def self.value(coin)
        (GOLD_VALUE / coin::GOLD_VALUE).round(3)
      end
    end
  end
end
