class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:"
    Scraper.scrape
    list_stories
    menu
    second_menu
  end

  def list_stories
    Story.all.each_with_index do |story, i|
      puts "#{i+1}) #{story.title} By: #{story.author}"
    end
  end

  def menu
    puts "\nWhat story would you like to read? (Select a number.)"
    input = gets.strip.downcase
    if input = input.to_i
      main_site = "http://www.sportingnews.com"
      link = Story.all[input.to_i-1].url
      url = "#{main_site}#{link}"
      system("open '#{url}'")
    elsif input == "exit"
      puts "Goodbye!"
    else
      puts "Sorry, invalid input. Please select a story or exit."
      list_stories
    end

    def second_menu
      puts "Would you like to read another story?"
      answer = gets.strip.upcase
      if answer.include?("Y, YES")
        list_stories
      elsif answer.include?("N, NO")
        puts "Goodbye!"
      end
    end

  end
end
