require_relative '../models/robot_directory'

class RobotDirectoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotDirectory.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/:id' do |id|
    @robots = RobotDirectory.find(id.to_i)
    erb :show
  end

  post '/robots' do
    RobotDirectory.create(params[:robot])
    redirect '/robots'
  end
end