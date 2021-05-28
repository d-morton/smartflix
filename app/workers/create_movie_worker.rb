class CreateMovieWorker
  include Sidekiq::Worker

  def perform(*args)
    movie = Movie.new(title: Faker::Movie.title)
    movie.save
  end
end
