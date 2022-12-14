get '/' do

  locations = all_locations()

  erb :'surf/index', locals: {
    locations: locations
  }
end

get '/surf/new' do
  erb :'surf/new'
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
  if !logged_in?
    redirect '/'
  end

  id = params['id']

  location = get_locations(id)

  erb :'surf/edit', locals: {
    location: location
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

  update_location(id, name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)

  # We ALWAYS redirect the user at the end of a POST, PUT or DELETE method.
  redirect '/'
end

delete '/surf/:id' do
  id = params['id']
  
  run_sql('DELETE FROM locations WHERE id = $1', [id])

  redirect '/'
end