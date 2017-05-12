require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get ('/shoes') do
  @shoes = Shoe.all()
  erb(:shoes)
end

post ('/shoes') do
  shoe_name = params.fetch('shoe_name')
  @shoes = Shoe.create({:brand => shoe_name})
  redirect("/shoes")
end
