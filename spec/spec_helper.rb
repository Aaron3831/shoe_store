ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("./lib/store")
require("./lib/shoe")
require("./lib/price")
require("./lib/franchise")
require("./lib/cost")

RSpec.configure do |config|
  config.after(:each) do
    Shoe.all().each do |shoe|
      shoe.destroy()
    end
    Store.all().each do |store|
      store.destroy()
    end
    Price.all().each do |price|
      price.destroy()
    end
  end
end
