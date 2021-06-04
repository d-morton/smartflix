class SearchRandomMovie
  START_YEAR = 1950
  END_YEAR = 2021

  def call
    params = { title: random_character, year: random_year }

    FetchMovieData.new(params: params).call
  end

  def random_character
    ('a'..'z').to_a.sample
  end

  def random_year
    (START_YEAR..END_YEAR).to_a.sample
  end
end
