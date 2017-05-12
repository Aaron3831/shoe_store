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
  shoe_name = params.fetch('shoe_name')
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

get ('/prices') do
  @prices = Price.all()
  erb(:prices)
end

post ('/prices') do
  price_name = params.fetch('price_name')
  @prices = Price.create({:total => price_name})
  redirect("/prices")
end

post ('/shoes/:id/prices') do
  @shoe = Shoe.find(params.fetch("id").to_i())
  price = Price.find(params[:price_id].to_i)
  @shoe.prices.push(price)
  redirect("/shoes/".concat(@shoe.id.to_s))
end

get("/stores/:id/edit") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store_edit)
end

patch("/stores/:id") do
  name = params.fetch("store_name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:title => name})
  @shoes = Shoe.all()
  erb(:store)
end

delete("/stores/:id") do
  @stores = Store.find(params.fetch('id').to_i())
  @stores.delete()
  redirect("/stores")
end
