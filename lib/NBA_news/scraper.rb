class Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.sportingnews.com/us/nba/news"))
    array_of_stories = doc.css("div.media-body")

    array_of_stories.each do |info|
      story = Story.new
      story.title = info.css("h3.media-heading a").text
      story.author = info.css("span.author a").text
      story.url = info.css("a")[1]["href"]
    end
  end

  def self.open_story(url)
    doc = Nokogiri::HTML(open(Story.url))
    binding.pry
  end

end
