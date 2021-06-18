require 'rails_helper'

RSpec.describe 'movies/not_found.html.erb', type: :view do
  it "displays a movie" do
    assign(:title, 'Superman')

    render

    expect(rendered).to include('Superman')
  end
end
