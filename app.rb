require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/vehicle') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @vehicle = Vehicle.new(make, model, year)
  @vehicle.save()
  erb(:vehicles)
end

get('/vehicles') do
  @vehicles = Vehicle.all
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id'))
  erb(:vehicle)
end
