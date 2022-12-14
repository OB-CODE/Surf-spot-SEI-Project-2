     
require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'
require 'dotenv/load'

# this makes the session hash work
enable :sessions

# models
require './models/user'
require './models/surf'

# controllers
require './controllers/surfs_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

# helpers
require './helpers/sessions_helper'






