class MoviesController < ApplicationController
  def show
    @title = params[:title]
    @movie = find_movie_by_title

    render json: @movie if movie
    movie_not_found unless movie
  end

  private

  attr_reader :title, :movie

  def find_movie_by_title
    Movie.find_by(title: title)
  end

  def movie_not_found
    FindAndCreateMovieWorker.perform_async(title)
    render 'not_found'
  end
end
