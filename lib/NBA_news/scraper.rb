class Scraper

  def self.scrape_header
    doc = Nokogiri::HTML(open("http://www.sportingnews.com/us/nba/news"))
    section = doc.css("ul.media-list")
    array_of_titles = section.css("li.media")

    array_of_titles.map do |title|
      title.text
    end


    doc.css("ul.media-list li.media")[0].text
    doc.css("ul.media-list li.media")[1].text
  end

  def scrape_details
  end

end
