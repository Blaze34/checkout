class Checkout

  attr_reader :items

  def initialize(*rules)
    @items = []
    @rules = rules
  end

  #def add(product)
  #  @items[product.id] ||= { model: product, count: 0 }
  #
  #  @items[product.id][:count] += 1
  #end

  def add(product)
    @items << product
  end

  def total
    prices = collect_prices

    @rules.each do |rule|
      if prices.has_key? rule.product_id
        prices[rule.product_id] = rule.apply prices[rule.product_id]
      end
    end

    prices.values.flatten.inject(0, :+)
  end

  private

  def collect_prices
    prices = {}

    @items.each do |i|
      prices[i.id] ||= []
      prices[i.id] << i.price
    end

    prices
  end
end