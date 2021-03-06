class CLI

  def run
    puts "Welcome to NBA News! Here are the latest stories around the league:".colorize(:yellow)
    sleep 1
    Scraper.scrape
    list_stories
    sleep 1
    puts "Would you like to read a story? [y/n]".colorize(:yellow)
    menu
  end
  

  def list_stories
    Story.all.each_with_index do |story, i|
      puts "#{i+1}) #{story.title.colorize(:blue)} By: #{story.author}"
    end
  end
  

  def menu
    response = gets.strip.downcase

    if response == "y" || response == "yes"
      puts "What story would you like to read? (Select a number or 'exit'.)".colorize(:yellow)
      input = gets.strip.downcase
      if input.to_i.between?(1, Story.all.size)
        story_object = Story.all[input.to_i-1]
        Scraper.scrape_content(story_object.url)
        second_menu
      elsif input.to_i.between?(1, Story.all.size) == false && input != "exit"
        puts "I'm sorry that story is not listed.".colorize(:yellow)
        sleep 1
        list_stories
        puts "Please choose a story number that is listed or 'exit' to close.".colorize(:yellow)
        rerun_menu
      else input == "exit"
        puts "Thanks for visiting, goodbye!".colorize(:yellow)
      end
    elsif response == "n" || response == "no"
      puts "Okay, maybe next time. Thanks for stopping by!".colorize(:yellow)
    else
      puts "I'm sorry, I did not get that. Please respond with a 'yes' or 'no'".colorize(:yellow)
      menu
    end
  end
  
  
  def rerun_menu
    input = gets.strip.downcase
      if input.to_i.between?(1, Story.all.size)
        story_object = Story.all[input.to_i-1]
        Scraper.scrape_content(story_object.url)
        second_menu
      elsif input.to_i.between?(1, Story.all.size) == false && input != "exit"
        puts "I'm sorry that story is not listed.".colorize(:yellow)
        sleep 1
        list_stories
        puts "Please choose a story number that is listed or 'exit' to close.".colorize(:yellow)
        rerun_menu
      else input == "exit"
        puts "Thanks for visiting, goodbye!".colorize(:yellow)
    end
  end
  

  def second_menu
    puts "Would you like to read another story? [y/n]".colorize(:yellow)
    answer = gets.strip.downcase
    if answer ==  "y" || answer =="yes"
      list_stories
      puts "Great! Please make another selection. (Enter story number)".colorize(:yellow)
      rerun_menu
    elsif answer == "n" || answer == "no"
      puts "Thanks for reading, goodbye!".colorize(:yellow)
    else
      puts "I'm sorry. I did not get that.".colorize(:yellow)
      second_menu
    end
  end


end