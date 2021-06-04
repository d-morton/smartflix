class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(*)
    movie = Movie.new(title: Faker::Movie.title, year: random_year)
    movie.save
  end

  private

  def random_year
    (1990..2020).to_a.sample
  end
end
