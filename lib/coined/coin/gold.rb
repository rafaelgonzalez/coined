require 'coined/coin/silver'
require 'coined/coin/platinum'

module Coined
  module Coin
    module Gold
      GOLD_VALUE = 1.0

      def self.value(coin)
        (GOLD_VALUE / coin::GOLD_VALUE).round(3)
      end
    end
  end
end
