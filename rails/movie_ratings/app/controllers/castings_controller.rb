class CastingsController < ApplicationController
  before_action :set_movie, only: %i[ show new create edit update]
  before_action :set_casting, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @casting = @movie.castings.new 
  end

  def create
    @casting = @movie.castings.new(casting_params)
    if @casting.save
      redirect_to movies_path, notice: "Casting was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @casting.update(casting_params)
    respond_to do |format|
      format turbo_stream
    end
  end
      #redirect_to @casting.movie, notice: "Casting was successfully updated."

  def destroy
    @casting.destroy
    redirect_to movies_path, notice: "Cast member removed."
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_casting
    @casting = Casting.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit(:actor_id, :character, :movie_id, :id)
  end

end


