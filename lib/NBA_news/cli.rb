class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:"
    stories = Scraper.scrape_header
    puts stories
    puts "Select an article number to read the full story or exit to close."
    input = gets.strip
  end

end
