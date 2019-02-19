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
    self.all.map {|story| story.author}
  end

  def self.find_by_author(name)
    self.all.find_all {|story| story.author == name} 
  end

end
