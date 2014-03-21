FactoryGirl.define do
  factory :rule1, class: Rule do
    ignore do
      type        :every
      param_1     2
      param_2     0
    end

    initialize_with { new(build(:product1), type, param_1, param_2) }
  end

  factory :rule2, class: Rule do
    ignore do
      type        :after_count
      param_1     3
      param_2     4.5
    end

    initialize_with { new(build(:product2), type, param_1, param_2) }
  end
end