require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CreateRandomMovieWorker do
  subject(:worker) { described_class.perform_async('worker_name', 5) }

  Sidekiq::Testing.inline!

  it 'adds a movie', :vcr do
    expect { worker }.to change(Movie, :count)

    expect(Movie.last.title).to be_present
  end
end
