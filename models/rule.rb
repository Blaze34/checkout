class Rule

  attr_accessor :product
  attr_reader :type, :params

  def initialize(product, type, *params)
    @product = product
    @type = type
    @params = params
  end

  def apply(prices)
    if respond_to? type, true
      send(type, prices)
    else
      prices
    end
  end

  private

  def after_count (prices)
    prices.count >= params[0] ? prices.map { params[1] } : prices
  end

  def every (prices)
    counter = 0
    prices.collect do |p|
      counter += 1
      counter % params[0] == 0 ? params[1] : p
    end
  end
end