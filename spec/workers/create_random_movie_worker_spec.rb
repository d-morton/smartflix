require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CreateRandomMovieWorker do
  subject { described_class.perform_async('worker_name', 5) }

  Sidekiq::Testing.inline!

  before { expect(Faraday).to receive(:get).and_return(FakeOMDBResponse.new(:guardians)) }

  it 'adds a movie' do
    expect { subject }.to change(Movie, :count)

    expect(Movie.last.title).to be_present
  end
end
