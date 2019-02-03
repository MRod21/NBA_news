class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:"
    Scraper.scrape_header
    puts "Select an article number to read the full story or exit to close."
    input = gets.strip
  end

end
