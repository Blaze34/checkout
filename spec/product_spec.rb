require_relative 'spec_helper'

describe Product do
  subject { build (:product1)}

  describe 'fields' do
    it { expect(subject.id).to be_a Integer }
    it { expect(subject.price).to be >= 0 }
  end
end
