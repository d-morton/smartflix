class CreateRandomMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(*)
    random_movie = SearchRandomMovie.new.call

    movie = Movie.new(title: random_movie[:title], year: random_movie[:year])
    movie.save
  end
end
