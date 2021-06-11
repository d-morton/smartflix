class FindAndCreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options(retry: false, queue: 'movies')

  def perform(title)
    params = { title: title }
    movie_data = FetchMovieData.new(params: params).call

    CreateMovie.new(params: movie_data).call
  end
end
