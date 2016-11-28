require './sql_DB_creation.rb'

class Health_condition
  attr_accessor :error_arr

  def validate(user_height,user_weight,user_age)
     @error_arr = []
     valid = true
      if user_height <58 || user_height >76
       @error_arr << "Height incorrect, enter between 58 to 76"
       valid = false
      end
      if user_age < 2 || user_age > 76
       @error_arr << "Provide age between 2 to 76"
       valid = false
      end
      return valid
  end
  def healthy_weight(user_height)
    puts "Weight based on your height"
    min_healthy_weight = run_single_value_db_query("select n_min from weight_calc where height =#{user_height}")
    max_healthy_weight = run_single_value_db_query("select n_max from weight_calc where height =#{user_height}")
    return "Your weight should be between #{min_healthy_weight} and #{max_healthy_weight}"
  end

  def run_single_value_db_query(sql)
    rows = DB.execute(sql)
    return rows.flatten(2).first
  end

  def run_db_query(sql)
    DB.execute(sql)
  end

  def health_condition(user_height, user_weight)
     puts "Categorizing based on your BMI"
     n_min = run_single_value_db_query("select n_min from weight_calc where height =#{user_height}")
     n_max = run_single_value_db_query("select n_max from weight_calc where height =#{user_height}")
     ow_min = run_single_value_db_query("select ow_min from weight_calc where height =#{user_height}")
     ow_max = run_single_value_db_query("select ow_max from weight_calc where height =#{user_height}")
     ob_min = run_single_value_db_query("select ob_min from weight_calc where height =#{user_height}")
     ob_max = run_single_value_db_query("select ob_max from weight_calc where height =#{user_height}")
    
      if user_weight >= n_min && user_weight <= n_max
        result =  "You are healthy"
      elsif user_weight >= ow_min && user_weight <= ow_max
        result =  "You are Overweight"
      elsif user_weight >= ob_min && user_weight <= ob_max
        result = "You are Obese"
      elsif user_weight > n_max && user_weight < ow_min
        result = "You are lingering between normal weight and Overweight"
      elsif user_weight > ow_max && user_weight < ob_min
        result = "You are lingering between Overweight and Obese"
      elsif user_weight < n_min
        result = "You are underweight"
      else
        result = "You are extremely obeseeeee, stay on diet and keep workign out"   
      end
      return result
  end

  def calories_check(user_gender, user_age)
    if user_gender == "male"
      calories = run_single_value_db_query("select calories from calories_male where age = #{user_age}")
    else
      calories = run_single_value_db_query("select calories from calories_female where age = #{user_age}")
    end
     return "Amount of calories to stay healthy is #{calories}"
  end

end
if __FILE__ == $PROGRAM_NAME
  calc = Health_condition.new
  puts calc.validate(58,145,1)
  puts calc.error_arr
  calc.healthy_weight(58)
  calc.health_condition(58, 145)
  calc.calories_check('male', 18)
  
end