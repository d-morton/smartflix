require 'rails_helper'

RSpec.describe SearchRandomMovie do
  subject { described_class.new.call }

  before { expect(Faraday).to receive(:get).and_return(FakeOMDBResponse.new(:guardians)) }

  context 'when it is called' do
    it 'gets a random movie from omdb' do
      expect(subject).to be_an_instance_of(Hash)
    end
  end
end
