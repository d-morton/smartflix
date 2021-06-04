require 'rails_helper'

RSpec.describe CreateMovie do
  subject { described_class.new(params: params) }

  let(:params) { { title: 'movie title', year: 2000 } }

  it 'creates a movie' do
    expect { subject.call }.to change(Movie, :count).by(1)
  end
end
