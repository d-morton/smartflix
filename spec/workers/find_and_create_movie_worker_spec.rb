require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe FindAndCreateMovieWorker do
  subject { described_class.perform_async(title) }

  Sidekiq::Testing.inline!

  let(:title) { 'Superman' }

  it 'adds a movie', :aggregate_failures do
    expect { subject }.to change(Movie, :count).by 1

    expect(Movie.last.title).to eq(title)
  end
end
