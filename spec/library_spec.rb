require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({
                                    first_name: "Charlotte", 
                                    last_name: "Bronte"
                                    })
    @harper_lee = Author.new({
                              first_name: "Harper", 
                              last_name: "Lee"
                              })
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@dpl).to be_an_instance_of(Library)
      expect(@dpl.name).to eq("Denver Public Library")
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end
  
  describe "#add_author" do
    it "can add authors and their books" do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")   
      professor = @charlotte_bronte.write("The Professor", "1857")
      villette = @charlotte_bronte.write("Villette", "1853")
      
      mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      
      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end
  
  describe "#publication_time_frame(author)" do
    it "can show the publication dates of an author's first and last book" do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")   
      villette = @charlotte_bronte.write("Villette", "1853")
      professor = @charlotte_bronte.write("The Professor", "1857")
      
      mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      bronte_expected = {
                          start: "1847",
                          end: "1857"
                        }

      expect(@dpl.publication_time_frame(@charlotte_bronte)).to eq(bronte_expected)
      
      lee_expected = {
                        start: "1960",
                        end: "1960"
                      }

      expect(@dpl.publication_time_frame(@harper_lee)).to eq(lee_expected)
    end
  end

  describe "#checkout(book)" do
    it "can check out a book" do
      
    end
  end
end