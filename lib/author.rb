class Author
  attr_reader :books
  
  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, date)
    book_hash = {}
    book_hash[:author_first_name] = @first_name 
    book_hash[:author_last_name] = @last_name 
    book_hash[:title] = title 
    book_hash[:publication_date] = date 
    book = Book.new(book_hash)
    @books << book
    book
  end
end