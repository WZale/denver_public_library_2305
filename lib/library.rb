class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame(author)
    time_frame_hash = {}
    years = author.books.map do |book|
      book.publication_year.to_i
    end
    time_frame_hash[:start] = years.min.to_s
    time_frame_hash[:end] = years.max.to_s
    time_frame_hash
  end

end