require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get ('/shoes') do
  @shoes = Shoe.all()
  @prices = Price.all()
  erb(:shoes)
end

post ('/shoes') do
  shoe_name = params.fetch('shoe_id')
  @shoes = Shoe.create({:brand => shoe_name})
  @prices = Price.all()
  redirect("/shoes")
end

get("/shoes/:id") do
  @shoe = Shoe.find(params.fetch("id").to_i())
  @stores = Store.all()
  @prices = Price.all()
  erb(:shoe)
end

post ('/shoes/:id/stores') do
  @shoe = Shoe.find(params.fetch("id").to_i())
  store = Store.find(params[:store_id].to_i)
  @shoe.stores.push(store)
  redirect("/shoes/".concat(@shoe.id.to_s))
end

get ('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:store)
end

post ('/stores/:id/shoes') do
  @store = Store.find(params.fetch("id").to_i())
  shoe = Shoe.find(params[:shoe_id].to_i)
  @store.shoes.push(shoe)
  redirect("/stores/".concat(@store.id.to_s))
end

post ('/stores') do
  store_name = params.fetch('store_name')
  @stores = Store.create({:title => store_name})
  redirect("/stores")
end

post ('/shoes/:id/prices') do
  @shoe = Shoe.find(params.fetch("id").to_i())
  price = Price.find(params[:price_id].to_i)
  @shoe.prices.push(price)
  redirect("/shoes/".concat(@shoe.id.to_s))
end
