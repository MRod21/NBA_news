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
    puts "Would you like to read a story?"
    response = gets.strip.downcase

    if response == "y" || response == "yes"
      puts "What story would you like to read? (Select a number or 'exit'.)"
      input = gets.strip
      if input.to_i.between?(1, Story.all.size)
        story_object = Story.all[input.to_i-1]
        Scraper.scrape_content(story_object.url)
      end
    elsif response == "n" || response == "no"
      puts "Goodbye!"
    else
      puts "I'm sorry. I did not get that. Please try again."
    end
  end
    #  if input == "exit"
    #    puts "Goodbye!"
    #  else
    #    puts "Sorry, invalid input. Please select a story or exit."
    #    list_stories
    #  end


    def second_menu
      puts "Would you like to read another story?"
      answer = gets.strip.upcase
      if answer.include? "Y", "YES"
        list_stories
      elsif answer.include? "N", "NO"
        puts "Goodbye!"
      end
    end


end
