class CreateRandomMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(*)
    random_letter = ('a'..'z').to_a.sample
    random_year = (1950..2021).to_a.sample
    params = { title: random_letter, year: random_year }
    movie_data = FetchMovieData.new(params: params).call

    CreateMovie.new(params: movie_data).call
  end
end
