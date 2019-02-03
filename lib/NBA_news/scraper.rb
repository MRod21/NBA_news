class Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.sportingnews.com/us/nba/news"))
    array_of_stories = doc.css("ul.media-list")

    array_of_stories.each do |post|
      story = Story.new
      story.title = post.css("a")[2].text
      story.author = post.css("a")[3].text
      story.url = post.css("a")[2]["href"]
    end
  end

  def scrape_details
  end

end
