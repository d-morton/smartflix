class CreateRandomMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(*)
    params = SearchRandomMovie.new.call

    CreateMovie.new(params: params).call
  end
end
