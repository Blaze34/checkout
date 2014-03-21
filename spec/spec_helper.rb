require 'factory_girl'

Dir[File.dirname(__FILE__) + '/../models/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../factories/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end