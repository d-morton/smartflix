require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  subject { described_class.new }

  before do
    create(:movie, title: 'new title', year: 2021)
    create(:movie, title: 'movie', year: 2021)
  end

  context 'when the movie is in the database' do
    let(:title) { 'movie' }

    it 'finds a movie' do
      get :show, params: { title: title }

      expect(response).to have_http_status(:ok)
    end
  end

  context 'when the movie is not in the database' do
    let(:title) { 'not movie' }

    it 'finds a movie' do
      expect(FindAndCreateMovieWorker).to receive(:perform_async)

      get :show, params: { title: title }
    end
  end
end
