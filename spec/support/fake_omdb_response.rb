class FakeOMDBResponse
  RESPONSE = {
    guardians:
        {
          title: 'Guardians of the Galaxy Vol. 2',
          year: '2017',
          rated: 'PG-13',
          released: '05 May 2017',
          runtime: '136 min',
          genre: 'Action, Adventure, Comedy',
          director: 'James Gunn',
          writer: 'James Gunn, Dan Abnett, Andy Lanning',
          actors: 'Chris Pratt, Zoe Saldana, Dave Bautista',
          plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, n' /
                'otably Star-Lord's encounter with his father the ambitious celestial being Ego.",
          language: 'English',
          country: 'United States',
          awards: 'Nominated for 1 Oscar. 15 wins & 58 nominations total',
          poster: 'https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg',
          ratings: [{ 'Source' => 'Internet Movie Database', 'Value' => '7.6/10' },
                    { 'Source' => 'Rotten Tomatoes', 'Value' => '85%' },
                    { 'Source' => 'Metacritic', 'Value' => '67/100' }],
          metascore: '67',
          imdbrating: '7.6',
          imdbvotes: '589,440',
          imdbid: 'tt3896198',
          type: 'movie',
          dvd: '10 Jul 2017',
          boxoffice: '$389,813,101',
          production: 'Walt Disney Pictures, Marvel Studios',
          website: 'N/A',
          response: 'True',
        }.to_json,
    not_found:
        {
          'Response' => 'False',
          'Error' => 'Movie not found!',
        }.to_json,
  }.freeze

  def initialize(response_type)
    @response_type = response_type
  end

  def body
    raise 'error'
    RESPONSE[response_type]
  end

  private

  attr_reader :response_type
end
