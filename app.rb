require_relative 'models/product'
require_relative 'models/rule'
require_relative 'models/checkout'


fr = Product.new('Fruit Tea', 3.11)
sr = Product.new('Strawberries', 5.00)
cf = Product.new('Coffee', 11.23)

rule1 = Rule.new(fr, :every, 2, 0)
rule2 = Rule.new(sr, :after_count, 3, 4.5)

co = Checkout.new rule1, rule2

co.add sr
co.add sr
co.add sr
co.add fr
co.add fr

p co.total