class Movie < ActiveRecord::Base
  has_many :reviews
  ratyrate_rateable "movie_rating"
end
