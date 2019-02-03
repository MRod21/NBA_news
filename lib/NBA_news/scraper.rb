class Scraper

  def self.scrape_header
    doc = Nokogiri::HTML(open("http://www.sportingnews.com/us/nba/news"))
    stories = doc.css("ul.media-list li.media")

    stories.each do |post|
      story = Story.new
      story.title = post.css("a")[2].text
      story.author = post.css("span.author a").text
      story.url = post.css("a")[2]["href"]
    end
  end

  def scrape_details
  end

end
