class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @movie.reviews.each do |review| 
      @movie.rating = review.rating + @movie.rating.to_i
    end
    @movie.rating = (@movie.rating.to_i/(1+@movie.reviews.size))* 100/5
    @movie.save
    @review = @movie.reviews.new(params.require(:review).permit(:body, :rating))
    @review.save

    redirect_to movie_path(@movie)
  end
end