require 'rails_helper'

RSpec.describe FetchMovieData do
  subject { described_class.new(params: params) }

  context 'when an id is provided' do
    let(:params) { { id: 'tt3896198&' } }

    it 'gets a movie title from omdb' do
      movie_info = subject.call

      expect(movie_info[:title]).to eq('Guardians of the Galaxy Vol. 2')
    end
  end

  context 'when a title is provided' do
    let(:params) { { title: 'Guardians of the Galaxy Vol. 2' } }

    it 'gets a movie year from omdb' do
      movie_info = subject.call

      expect(movie_info[:year]).to eq("2017")
    end
  end

  context 'when title and id are provided' do
    let(:params) { { id: 'tt3896198&', title: 'Guardians of the Galaxy Vol. 2' } }

    it 'gets a movie year from omdb' do
      movie_info = subject.call

      expect(movie_info[:year]).to eq("2017")
    end
  end

end
