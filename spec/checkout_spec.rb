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

    subject do
      checkout.add rule1.product
      checkout.add rule2.product
      checkout.add rule1.product
      checkout.add rule1.product
      checkout.add product3
      checkout
    end

    it { expect(subject.items).to have(3).items }
    it { expect(subject.quantity).to eq(5) }
    it { expect(subject.quantity rule1.product).to eq(3) }
    it { expect(subject.quantity rule2.product).to eq(1) }
    it { expect(subject.quantity product3).to eq(1) }

    context '.collect_prices' do
      it { expect(subject.send(:collect_prices).values).to eq([[3.11,3.11,3.11],[5],[11.23]]) }
    end

    context '.total' do
      it { expect(subject.total).to eq(22.45) }
    end
  end

  context 'product collection FR, FR' do

    subject do
      checkout.add rule1.product
      checkout.add rule1.product
      checkout
    end

    context '.total' do
      it { expect(subject.total).to eq(3.11) }
    end
  end

  context 'product collection SR, SR, FR, SR' do

    subject do
      checkout.add rule2.product
      checkout.add rule2.product
      checkout.add rule1.product
      checkout.add rule2.product
      checkout
    end

    context '.total' do
      it { expect(subject.total).to eq(16.61) }
    end
  end

end
