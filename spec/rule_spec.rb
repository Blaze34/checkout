require_relative 'spec_helper'

describe Rule do
  let(:rule1) { build (:rule1)}
  let(:rule2) { build (:rule2)}

  context 'fields' do
    it { expect(rule1.product).to be_a Product }
    it { expect(rule1.type).to be_a Symbol }
    it { expect(rule1.params).to be_a Array }
  end

  context '.apply' do
    let (:prices) { [5,5,5] }

    it { expect(rule1.apply prices).to eq([5,0,5]) }

    it { expect(rule2.apply prices).to eq([4.5,4.5,4.5]) }
  end
end
