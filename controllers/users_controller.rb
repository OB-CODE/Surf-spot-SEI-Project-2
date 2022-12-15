get '/users/new' do
  weather =HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=-33.87&lon=151.21&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric")

  erb :'users/new', locals: {
      weather: weather
  }
end


post '/users' do
  first_name = params['first_name']
  last_name = params['last_name']
  email = params['email']
  password = params['password']
  admin_stat = 0

  create_user(first_name, last_name, email, password, admin_stat)

   # we ALWAYS redirect the user at the end of a POST, PUT or DELETE method. 
   redirect '/'
end