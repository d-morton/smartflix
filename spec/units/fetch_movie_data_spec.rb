require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe FetchMovieData do
  subject { described_class.new(id: id) }

  let(:id) { 'tt3896198&' }

  it 'gets info from OMDB' do
    expect(subject.call).to be_an_instance_of(Hash)
  end

  it 'gets a movie title' do
    movie_info = subject.call

    expect(movie_info[:title]).to eq("Guardians of the Galaxy Vol. 2")
  end
end
