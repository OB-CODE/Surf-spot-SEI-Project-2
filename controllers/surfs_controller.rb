get '/' do

  # current default city set to SYD
  weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=-33.87&lon=151.21&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric&cnt=4")


  locations = all_locations()

  erb :'surf/index', locals: {
    locations: locations,
    weather: weather
        # user_location: user_location
  }
  end

get '/surf/new' do
  weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=-33.87&lon=151.21&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric&cnt=4")

  erb :'surf/new', locals: {
    weather: weather
  }
end

post '/surf' do
  name = params['name']
  image_url = params['image_url']
  surf_experience = params['surf_experience']
  crowd = params['crowd']
  hazards = params['hazards']
  access = params['access']
  ocean_bottom = params['ocean_bottom']

  create_locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)


  # We ALWAYS redirect the user at the end of a POST, PUT or DELETE method.
  redirect '/'
end


get '/surf/:id/edit' do
  weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=-33.87&lon=151.21&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric&cnt=4")

  if !logged_in?
    redirect '/'
  end

  id = params['id']

  location = get_locations(id)

  erb :'surf/edit', locals: {
    location: location,
    weather: weather
  }
end

get '/surf/:id/spot' do
  weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=-33.87&lon=151.21&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric&cnt=4")

  id = params['id']
  spot = get_spot(id)

  spot_weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{spot[0]['latitude']}&lon=#{spot[0]['longitude']}&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric&cnt=4")


  erb :'surf/spot', locals: {
    weather: weather,
    spot: spot,
    spot_weather: spot_weather
  }
end

put '/surf/:id' do
  if !logged_in?
    redirect '/'
  end

  id = params['id']
  name = params['name']
  image_url = params['image_url']
  surf_experience = params['surf_experience']
  crowd = params['crowd']
  hazards = params['hazards']
  access = params['access']
  ocean_bottom = params['ocean_bottom']
  latitude = params['latitude']
  longitude = params['longitude']

  update_location(id, name, image_url, surf_experience, crowd, hazards, access, ocean_bottom, latitude, longitude)

  # We ALWAYS redirect the user at the end of a POST, PUT or DELETE method.
  redirect '/'
end

delete '/surf/:id' do
  id = params['id']
  
  run_sql('DELETE FROM locations WHERE id = $1', [id])

  redirect '/'
end

post '/surf/:id/likes' do
  spot_id = params['id']
  user_id = session['user_id']

  run_sql("INSERT INTO likes(user_id, spot_id) VALUES($1, $2)", [user_id, spot_id])
  redirect '/'
end

get '/surf/boards' do
  erb :'surf/boards'
end