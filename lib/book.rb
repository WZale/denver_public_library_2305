class Book
  attr_reader :title,
              :times_checked_out

  def initialize(book_info)
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @title = book_info[:title]
    @publication_date = book_info[:publication_date]
    @times_checked_out = 0
  end
  
  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date.split.last
  end

  def checkout_counter
    @times_checked_out += 1
  end
end 