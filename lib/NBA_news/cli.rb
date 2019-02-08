class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:".colorize(:yellow)
    Scraper.scrape
    #list_stories
    menu
  end

  def list_stories
    Story.all.each_with_index do |story, i|
      puts "#{i+1}) #{story.title.colorize(:blue)} By: #{story.author}"
    end
  end

  def menu
    list_stories
    puts "Would you like to read a story?".colorize(:yellow)
    response = gets.strip.downcase

    if response == "y" || response == "yes"
      puts "What story would you like to read? (Select a number or 'exit'.)".colorize(:yellow)
      input = gets.strip
      #binding.pry
      if input.to_i.between?(1, Story.all.size)
        story_object = Story.all[input.to_i-1]
        Scraper.scrape_content(story_object.url)
        second_menu
      elsif input.to_i.between?(1, Story.all.size) == false && input != "exit"
        puts "I'm sorry that story is not listed.".colorize(:yellow)
        sleep 1
        menu
      else input == "exit"
        puts "Goodbye!".colorize(:yellow)
      end
    elsif response == "n" || response == "no"
      puts "Goodbye!".colorize(:yellow)
    else
      puts "I'm sorry. I did not get that. Please try again.".colorize(:yellow)
      sleep 2
      menu
    end
  end


    def second_menu
      puts "Would you like to read another story?".colorize(:yellow)
      answer = gets.strip.downcase
      if answer ==  "y" || answer =="yes"
        #menu
        list_stories
        puts "Great! Please make another selection.".colorize(:yellow)
        input = gets.strip
        #binding.pry
        if input.to_i.between?(1, Story.all.size)
          story_object = Story.all[input.to_i-1]
          Scraper.scrape_content(story_object.url)
          second_menu
        end
      elsif answer == "n" || answer == "no"
        puts "Goodbye!"
      else
        puts "I'm sorry. I did not get that.".colorize(:yellow)
        second_menu
      end
    end


end
