get '/users/new' do
  erb :'users/new'
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