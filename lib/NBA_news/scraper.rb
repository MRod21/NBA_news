class Scraper
  MAIN_SITE = "http://www.sportingnews.com"

  def self.scrape
    doc = Nokogiri::HTML(open(MAIN_SITE + "/us/nba/news"))
    array_of_stories = doc.css("div.media-body")

    array_of_stories.each do |info|
      story = Story.new
      story.title = info.css("h3.media-heading a").text
      story.author = info.css("span.author a").text
      story.url = info.css("a")[1]["href"]
    end

    def self.scrape_content(object)
      #binding.pry
      doc = Nokogiri::HTML(open(MAIN_SITE + object))
      x = doc.css("div.entry-content p").text.split(/[\\W+]/)
      x.each {|w| puts "#{w} "}
    end

  end
end
