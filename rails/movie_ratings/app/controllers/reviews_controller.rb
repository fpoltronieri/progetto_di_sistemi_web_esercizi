class ReviewsController < ApplicationController
  before_action :set_movie, only: %i[index show create]

  def index 
    @reviews = @movie.reviews
  end 

  def show
    @review = @movie.reviews.find(params[:id])
  end

  def edit
    # id di review lo prendo da params[:id]
    @review = Review.find(params[:id])
    @movie = @review.movie
  end

  def update
    @review = Review.find(params[:id])
    # id di review lo prendo da params[:id]
    if @review.update(review_params)
      redirect_to movie_path(@review.movie), notice: "Review was successfully updated."
    else 
      redirect_to edit_movie_review_path(@review.movie, @review), alert: @review.errors.full_messages.to_sentence
    end
  end

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
