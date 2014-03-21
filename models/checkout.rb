class Checkout

  attr_reader :items

  def initialize(*rules)
    @items = {}
    @rules = rules
  end

  def add(product)
    @items[product.id] ||= { model: product, count: 0 }

    @items[product.id][:count] += 1
  end

  def total
    prices = collect_prices

    @rules.each do |rule|
      if prices.has_key? rule.product.id
        prices[rule.product.id] = rule.apply prices[rule.product.id]
      end
    end

    prices.values.flatten.inject(0, :+)
  end

  private

  def collect_prices
    Hash[@items.map { |k,v| [k, Array.new(v[:count], v[:model].price)] }]
  end
end