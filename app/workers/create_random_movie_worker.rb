class CreateRandomMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  ATTRIBUTES = %i[title year]

  def perform(*)
    random_movie = SearchRandomMovie.new.call
    attributes = random_movie.slice(*ATTRIBUTES)

    movie = Movie.new(**attributes)
    movie.save
  end
end
