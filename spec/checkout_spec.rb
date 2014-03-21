require_relative 'spec_helper'

describe Checkout do
  let(:rule1) { build (:rule1)}
  let(:rule2) { build (:rule2)}
  let(:product3) { build (:product3)}

  let(:checkout) { Checkout.new(rule1, rule2)}

  context 'items type' do
    it { expect(checkout.items).to be_a Hash }
  end

  context 'product collection FR, SR, FR, FR, CF' do

    before do
      checkout.add rule1.product
      checkout.add rule2.product
      checkout.add rule1.product
      checkout.add rule1.product
      checkout.add product3
    end

    it { expect(checkout.items).to have(3).items }
    it { expect(checkout.quantity).to eq(5) }
    it { expect(checkout.quantity rule1.product).to eq(3) }
    it { expect(checkout.quantity rule2.product).to eq(1) }
    it { expect(checkout.quantity product3).to eq(1) }

    context '.collect_prices' do
      it { expect(checkout.send(:collect_prices).values).to eq([[3.11,3.11,3.11],[5],[11.23]]) }
    end

    context '.total' do
      it { expect(checkout.total).to eq(22.45) }
    end
  end

  context 'product collection FR, FR' do

    context '.total' do
      it do
        checkout.add rule1.product
        checkout.add rule1.product

        expect(checkout.total).to eq(3.11)
      end
    end
  end

  context 'product collection SR, SR, FR, SR' do

    context '.total' do
      it do
        checkout.add rule2.product
        checkout.add rule2.product
        checkout.add rule1.product
        checkout.add rule2.product

        expect(checkout.total).to eq(16.61)
      end
    end
  end

end
