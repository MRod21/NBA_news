class Story
  attr_accessor :title, :author, :url, :content

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_authors
    self.all.map do |story|
      story.author
    end
    binding.pry
  end

  #def title=()
  #def self.content
  #  system ("open '#{url}'")
  #  binding.pry
  #end

end
