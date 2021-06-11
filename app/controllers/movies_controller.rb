class MoviesController < ApplicationController
  def show
    title = params[:title]

    @movie = find_movie_by_title(title)
    if @movie
      render json: @movie
    else
      get_movie(title)
      render "not found"
    end
  end

  private

  def find_movie_by_title(title)
    Movie.find_by_title(title)
  end

  def get_movie(title)
    FindAndCreateMovieWorker.perform_async(title)
  end
end
