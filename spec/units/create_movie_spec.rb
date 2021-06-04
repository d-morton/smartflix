require 'rails_helper'

RSpec.describe CreateMovie do
  subject { described_class.new(data: data) }

  let(:data) { { title: 'movie title'} }

  it 'exists' do
    expect(subject)
  end

end
