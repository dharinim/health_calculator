require 'sinatra' 
require 'slim'

require './sql_db_creation.rb'

get '/' do 
  slim :index
  # file = File.open("./index.html", "r")
  # contents = file.read
end

get '/details' do
  @height = params[:height]
  @weight = params[:weight]
  @age = params[:age]
  slim :thanks
end


# sqldb = SqlDbCreator.new
# sqldb.create
# sqldb.fill_data

# puts "Server has been started & data has been populated into the DB"




