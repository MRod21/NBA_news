class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:"
    Scraper.scrape
    list_stories
    puts "Select an article number to read the full story or exit to close."
    input = gets.strip
  end

  def list_stories
    Story.all.each_with_index do |story, i|
      puts "#{i+1}) #{story.title} By: #{story.author}"
    end
  end

end
