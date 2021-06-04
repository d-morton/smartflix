class CreateMovie
  def initialize(data: {})
    @data = data
  end

  def call
    movie = Movie.new(title: data[:title])
    movie.save
  end

  private

  attr_reader :data
end
