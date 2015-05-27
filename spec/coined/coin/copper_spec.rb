RSpec.describe Coined::Coin::Copper do
  it { expect(described_class::GOLD_VALUE).to eql 0.01 }

  describe '.value' do
    subject { described_class.value(coin) }

    context 'with Coin::Copper' do
      let(:coin) { Coined::Coin::Copper }

      it { is_expected.to eql 1.0 }
    end

    context 'with Coin::Silver' do
      let(:coin) { Coined::Coin::Silver }

      it { is_expected.to eql 0.1 }
    end

    context 'with Coin::Gold' do
      let(:coin) { Coined::Coin::Gold }

      it { is_expected.to eql 0.01 }
    end

    context 'with Coin::Platinum' do
      let(:coin) { Coined::Coin::Platinum }

      it { is_expected.to eql 0.001 }
    end
  end
end
