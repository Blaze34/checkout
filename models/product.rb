class Product

  @@increment = 0

  attr_reader :id, :name, :price

  def initialize(name, price)
    @@increment += 1
    @id = @@increment
    @name = name
    @price = price
  end
end