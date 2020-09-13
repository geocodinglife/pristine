require 'ruby_linear_regression'
require 'csv'
require 'pp'
require 'pry'

class  TruthRevealing
  attr_reader :songs
  def initialize(data)
    @songs = musification(data)
  end

  def revealing
    regression = RubyLinearRegression.new
    songs.each do |song|

      regression.load_training_data(song.beats, song.popularity)

      binding.pry
      regression.train_normal_equation
      puts "Trained model with the following cost fit #{regression.compute_cost}"
      prediction_data = [50]
      predicted_popularity = regression.predict(prediction_data)
      puts "Predicted populatity: #{predicted_popularity.round}"
    end
  end

  Song = Struct.new(:beats, :popularity)

  def musification(data)
    data.collect { |cell| Song.new([cell[1].to_i], cell[2].to_i) }
  end
end


data = CSV.read('db/data.csv', encoding: 'iso-8859-1:utf-8')
data.shift

truth_revealing = TruthRevealing.new(data)
pp truth_revealing.revealing

