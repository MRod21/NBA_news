class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:"
    Scraper.scrape
    list_stories
    menu
  end

  def list_stories
    Story.all.each_with_index do |story, i|
      puts "#{i+1}) #{story.title} By: #{story.author}"
    end
  end

  def menu
    puts "What story would you like to read? (Select a number.)"
        input = ""

    while input != "exit"
      input = gets.strip
      if input.to_i
        Scraper.scrape
        link = Story.all[input.to_i].url
        system("open '#{link}'")
        #Story.content
      end
    end

  end
end
