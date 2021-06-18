require 'rails_helper'

RSpec.describe FetchMovieData do
  subject { described_class.new(params: params) }

  context 'when a movie is found' do
    context 'when an id is provided' do
      let(:params) { { id: 'tt3896198&' } }

      it 'gets a movie title from omdb', :vcr do
        movie_info = subject.call

        expect(movie_info[:title]).to eq('Guardians of the Galaxy Vol. 2')
      end
    end

    context 'when a title is provided' do
      let(:params) { { title: 'Guardians of the Galaxy Vol. 2' } }

      it 'gets a movie year from omdb', :vcr do
        movie_info = subject.call

        expect(movie_info[:year]).to eq('2017')
      end
    end

    context 'when title and id are provided' do
      let(:params) { { id: 'tt3896198&', title: 'Guardians of the Galaxy Vol. 2' } }

      it 'gets a movie year from omdb', :vcr do
        movie_info = subject.call

        expect(movie_info[:year]).to eq('2017')
      end
    end

    context 'when a year is provided' do
      let(:params) { { id: 'tt3896198&', year: 2017 } }

      it 'gets a movie year from omdb', :vcr do
        movie_info = subject.call

        expect(movie_info[:title]).to eq('Guardians of the Galaxy Vol. 2')
      end
    end

    context 'when a searching by title' do
      let(:params) { { title: 'The' } }

      it 'finds a movie', :vcr do
        movie_info = subject.call

        expect(movie_info[:title]).to be_an_instance_of(String)
      end
    end
  end

  context 'when a year is provided and movie cannot be found' do
    let(:params) { { title: 'Not A Movie Title', year: 2000 } }

    it 'does not find a movie', :vcr do
      movie_info = subject.call

      expect(movie_info[:title]).to eq(nil)
    end
  end
end
