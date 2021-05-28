class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(*args)
    movie = Movie.new(title: Faker::Movie.title)
    movie.save
  end
end
