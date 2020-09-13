require 'ruby_linear_regression'
require 'csv'

data = CSV.read('db/data.csv', encoding: 'iso-8859-1:utf-8')
data.shift

width = []
height = []

data.each do |row|
  width.push([row[1].to_i])
  height.push(row[2].to_i)
end

p width
p height

linear_regression = RubyLinearRegression.new
linear_regression.load_training_data(width, height)
linear_regression.train_normal_equation

puts "Trained model with the following cost fit #{linear_regression.compute_cost}"

prediction_data = [50]
predicted_popularity = linear_regression.predict(prediction_data)
puts "Predicted populatity: #{predicted_popularity.round}"
