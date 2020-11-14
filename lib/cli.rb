require 'pry'
class Cli 

    @@topics = ["tesla stock", "amd stock", "amazon stock", "disney stock", "apple stock"]

    def start 
        puts "welcome"
        puts "Please choose one of the topics to see news articles:"
        self.display_topics
        index = self.initial_input
        query = Cli.topics[index]
        api = Api.new(query)
        api.create_articles
        Article.display_articles
        index = self.secondary_input
        
        Article.display_article(index)
        index = view_in_browser?
        self.another_article?
        # binding.pry
        # "let us pry"
    end 

    def self.topics 
        @@topics
    end 

    def input_to_index(input)
        input.to_i - 1 
    end 

     def view_in_browser?
        
    puts "Would you like to view the full article in the browser?"
    puts "1." + "Yes"
    puts "2." + "No"

    input = gets.chomp
    index = input_to_index(input)
    # input.to_i - 1
    
    if !index.between?(0,1)
        puts "Please select 1 or 2".red
        self.view_in_browser?
    else
         index
        end 
    end 
     








    # end

    

    def another_article?
        puts 'Would you like to read another article?'
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        index = input_to_index(input)

        if index == 0 
            Article.clear_all
            self.start
        end 
    end 

    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "please select a number between 1 and 5"
            self.initial_input
        else 
            index
        end
    end


    def secondary_input
        input = gets.chomp
        index = input_to_index(input)
        if !index.between?(0,9) 
            puts "please select a number between 1 and 10"
            self.secondary_input
        else  
            index
        end  
    end 

    def display_topics 
        Cli.topics.each_with_index {|topic, index| puts "#{index + 1}. #{topic.capitalize}" }
    end 

     
end 