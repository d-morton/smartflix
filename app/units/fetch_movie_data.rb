class FetchMovieData

  def initialize(id: 'tt3896198&')
    @id = id
  end

  def call
    response = Faraday.get("http://www.omdbapi.com/?i=#{id}apikey=#{ENV['OMDB_API_KEY']}")
    JSON.parse(response.body)
      .transform_keys(&:downcase)
      .symbolize_keys
  end

  private

  attr_reader :id

end
