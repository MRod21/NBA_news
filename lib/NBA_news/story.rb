class Story
  attr_accessor :title, :author, :url, :content
  @@all = []

  def initialize(title, author, url)
    @title = title
    @author = author
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def content
  end

end
