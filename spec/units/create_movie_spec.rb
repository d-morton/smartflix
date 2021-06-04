require 'rails_helper'

RSpec.describe CreateMovie do
  subject { described_class.new(data: data) }

  let(:data) { { title: 'movie title', year: 2000 } }

  it 'creates a movie' do
    expect { subject }.to change(Movie, :count).by(1)
  end
end
