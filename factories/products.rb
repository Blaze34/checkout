FactoryGirl.define do
  factory :product1, class: Product do
    ignore do
      name  'Fruit Tea'
      price 3.11
    end

    initialize_with { new(name, price) }
  end

  factory :product2, class: Product do
    ignore do
      name  'Strawberries'
      price 5
    end

    initialize_with { new(name, price) }
  end

  factory :product3, class: Product do
    ignore do
      name  'Coffee'
      price 11.23
    end

    initialize_with { new(name, price) }
  end
end