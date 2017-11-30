require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/favorite_things')

get('/') do
  @list = Item.all()
  erb(:index)
end

post('/') do
  name = params["name"]
  item = Item.new(name)
  item.save()
  @list = Item.all()
  erb(:index)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
