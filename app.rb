require 'factory_girl'
require_relative 'models/product'
require_relative 'models/rule'
require_relative 'models/checkout'
require_relative 'factories/products'
require_relative 'factories/rules'


cf = FactoryGirl.build :product3

rule1 = FactoryGirl.build(:rule1)
rule2 = FactoryGirl.build(:rule2)




co = Checkout.new rule1, rule2

co.add rule2.product
co.add rule2.product
co.add rule2.product
co.add rule1.product
co.add rule1.product

p co.total

p rule1

#p fr
#p sr
#p cf