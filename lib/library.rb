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
      book.checkout_counter
      true
    end
  end

  def return(book)
    @checked_out_books.delete(book)
    @books << book
  end

  def most_popular_book
    popular_books = []
    popular_book_inside_library = @books.max_by do |book| 
      book.times_checked_out
    end
    popular_books << popular_book_inside_library

    popular_book_outside_library = @checked_out_books.max_by do |book| 
      book.times_checked_out
    end
    popular_books << popular_book_outside_library

    popular_books.max_by do |book|
      book.times_checked_out
    end
  end

  def inventory
    inventory_hash = {}
    @authors.each do |author|
      inventory_hash[author] = author.books
    end
    inventory_hash
  end

end