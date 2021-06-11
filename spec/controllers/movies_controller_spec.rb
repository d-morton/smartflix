require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  subject { described_class.new }

  describe '#find_movie_by_title' do
    let(:title){ 'movie' }

    before do
      Movie.create(title:'new title', year: 2021)
      Movie.create(title:'movie', year: 2021)
    end

    it 'finds a movie' do
      movie = subject.find_movie_by_title(title)

      expect(movie.title).to eq('movie')
    end
  end

  describe '#get_movie' do
    let(:title){ 'Superman' }
    it 'gets a movie' do
      expect(FindAndCreateMovieWorker).to receive(:perform_async)
      subject.get_movie(title)
    end
  end
end
