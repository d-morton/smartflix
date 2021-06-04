class FetchMovieData
  def initialize(params:)
    @params = params
  end

  def call
    response = Faraday.get(query)
    JSON.parse(response.body)
      .transform_keys(&:downcase)
      .symbolize_keys
  end

  private

  attr_reader :params

  def query
    "#{url}#{id}#{title}#{year}#{api_key}"
  end

  def url
    'http://www.omdbapi.com/?'
  end

  def id
    return unless params[:id]

    "i=#{params[:id]}&"
  end

  def title
    return unless params[:title]

    "t=#{params[:title]}&"
  end

  def year
    return unless params[:year]

    "y=#{params[:year]}&"
  end

  def api_key
    "apikey=#{ENV['OMDB_API_KEY']}"
  end
end
