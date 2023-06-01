class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def checkout(book)
    checked_out_book = @books.delete(book)
    if checked_out_book == nil
      false
    else
      @checked_out_books << checked_out_book
      true
    end
  end

  def return(book)
    @checked_out_books.delete(book)
    @books << book
  end

end