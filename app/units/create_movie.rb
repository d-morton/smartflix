class CreateMovie
  ATTRIBUTES = %i[title year].freeze

  def initialize(params: {})
    @params = params
  end

  def call
    attributes = params.slice(*ATTRIBUTES)
    movie = Movie.new(**attributes)
    movie.save
  end

  private

  attr_reader :params
end
