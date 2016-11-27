require 'sinatra' 
require 'slim'
require './sql_db_creation.rb'
require './health_calculator.rb'

get '/' do 
  slim :index
end

get '/details' do
  @height = params[:height]
  @weight = params[:weight]
  @age = params[:age]
  @gender = params[:gender]

  @height = @height.to_i
  @weight = @weight.to_i
  @age = @age.to_i

  h = Health_condition.new

  
  if h.validate(@height, @weight, @age) == true 
    @weight_result = h.healthy_weight(@height)
    @condition_result = h.health_condition(@height, @weight)
    @calories_result = h.calories_check(@gender, @age)

    return slim :thanks
  else
    
    @error_arr = h.error_arr
    return slim :index
  end
end



