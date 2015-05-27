RSpec.describe Coined::Purse do
  describe '#initialize' do
    subject { described_class.new(copper, silver, gold, platinum) }

    context 'without zero coins' do
      let(:copper) { 0 }
      let(:silver) { 0 }
      let(:gold) { 0 }
      let(:platinum) { 0 }

      it { expect(subject.coins).to be_empty }
    end

    context 'with coin amounts' do
      let(:copper) { 10 }
      let(:silver) { 23 }
      let(:gold) { 3 }
      let(:platinum) { 1 }

      it { expect(subject.coins.size).to eql 37 }
      it { expect(subject.amount(Coined::Coin::Copper)).to eql 10 }
      it { expect(subject.amount(Coined::Coin::Silver)).to eql 23 }
      it { expect(subject.amount(Coined::Coin::Gold)).to eql 3 }
      it { expect(subject.amount(Coined::Coin::Platinum)).to eql 1 }
    end
  end

  describe '#add_coins' do
    subject { purse.add_coins(coin_type, amount) }

    let(:purse) { described_class.new(11, 5, 14, 20) }

    context 'adding copper' do
      let(:coin_type) { Coined::Coin::Copper }
      let(:amount) { 27 }

      it { expect { subject }.to change { purse.coins.size }.by(27) }

      it { expect { subject }.to change { purse.amount(Coined::Coin::Copper) }.from(11).to(38) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'adding silver' do
      let(:coin_type) { Coined::Coin::Silver }
      let(:amount) { 9 }

      it { expect { subject }.to change { purse.coins.size }.by(9) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Silver) }.from(5).to(14) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'adding gold' do
      let(:coin_type) { Coined::Coin::Gold }
      let(:amount) { 36 }

      it { expect { subject }.to change { purse.coins.size }.by(36) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Gold) }.from(14).to(50) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'adding platinum' do
      let(:coin_type) { Coined::Coin::Platinum }
      let(:amount) { 15 }

      it { expect { subject }.to change { purse.coins.size }.by(15) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Platinum) }.from(20).to(35) }
    end
  end

  describe '#remove_coins' do
    subject { purse.remove_coins(coin_type, amount) }

    let(:purse) { described_class.new(11, 5, 14, 20) }

    context 'removing copper' do
      let(:coin_type) { Coined::Coin::Copper }
      let(:amount) { 4 }

      it { expect { subject }.to change { purse.coins.size }.by(-4) }

      it { expect { subject }.to change { purse.amount(Coined::Coin::Copper) }.from(11).to(7) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'removing silver' do
      let(:coin_type) { Coined::Coin::Silver }
      let(:amount) { 5 }

      it { expect { subject }.to change { purse.coins.size }.by(-5) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Silver) }.from(5).to(0) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'removing gold' do
      let(:coin_type) { Coined::Coin::Gold }
      let(:amount) { 20 }

      it { expect { subject }.to change { purse.coins.size }.by(-14) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Gold) }.from(14).to(0) }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Platinum) } }
    end

    context 'removing platinum' do
      let(:coin_type) { Coined::Coin::Platinum }
      let(:amount) { 14 }

      it { expect { subject }.to change { purse.coins.size }.by(-14) }

      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Copper) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Silver) } }
      it { expect { subject }.not_to change { purse.amount(Coined::Coin::Gold) } }
      it { expect { subject }.to change { purse.amount(Coined::Coin::Platinum) }.from(20).to(6) }
    end
  end

  describe '#amount' do
    subject { purse.amount(coin_type) }

    let(:purse) { described_class.new(20, 12, 6, 2) }

    context 'of copper' do
      let(:coin_type) { Coined::Coin::Copper }

      it { is_expected.to eql 20 }
    end

    context 'of silver' do
      let(:coin_type) { Coined::Coin::Silver }

      it { is_expected.to eql 12 }
    end

    context 'of gold' do
      let(:coin_type) { Coined::Coin::Gold }

      it { is_expected.to eql 6 }
    end

    context 'of platinum' do
      let(:coin_type) { Coined::Coin::Platinum }

      it { is_expected.to eql 2 }
    end
  end

  describe '#value' do
    subject { purse.value(coin_type) }

    let(:purse) { described_class.new(copper, silver, gold, platinum) }

    let(:copper) { 153 }
    let(:silver) { 62 }
    let(:gold) { 21 }
    let(:platinum) { 7 }

    context 'with Coin::Copper' do
      let(:coin_type) { Coined::Coin::Copper }

      it { is_expected.to eql 9873.0 }
    end

    context 'with Coin::Silver' do
      let(:coin_type) { Coined::Coin::Silver }

      it { is_expected.to eql 987.3 }
    end

    context 'with Coin::Gold' do
      let(:coin_type) { Coined::Coin::Gold }

      it { is_expected.to eql 98.73 }
    end

    context 'with Coin::Platinum' do
      let(:coin_type) { Coined::Coin::Platinum }

      it { is_expected.to eql 9.873 }
    end
  end
end
