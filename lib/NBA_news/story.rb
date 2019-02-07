class Story
  attr_accessor :title, :author, :url, :content

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  #def self.content
  #  system ("open '#{url}'")
  #  binding.pry
  #end

end
