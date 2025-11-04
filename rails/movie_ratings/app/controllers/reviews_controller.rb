class ReviewsController < ApplicationController
  before_action :set_movie

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_path(@movie), notice: "Review was successfully created."
    else
      redirect_to movie_path(@movie), alert: @review.errors.full_messages.to_sentence
    end
  end

  ## Esercizio: Implementare la funcitionalità di cancellazione di una recensione.

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :movie_id).merge(user: Current.user)
  end
end
