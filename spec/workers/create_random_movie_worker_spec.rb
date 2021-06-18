require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CreateRandomMovieWorker do
  subject(:worker) { described_class.perform_async('worker_name', 5) }

  Sidekiq::Testing.inline!

  let(:injected_fetch_movie_data) { OpenStruct.new(call: 'movie_data') }
  let(:injected_create_movie) { OpenStruct.new(call: 'create_movie') }

  it 'adds a movie' do
    expect(FetchMovieData).to receive(:new).and_return(injected_fetch_movie_data)
    expect(CreateMovie).to receive(:new).and_return(injected_create_movie)

    worker
  end
end
