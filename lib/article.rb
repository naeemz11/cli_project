
class Article 


    attr_accessor :title, :author, :url, :content 

    @@all = []

    def initialize (title, author, url, content )
        @title = title
        @author = author
        @url = url
        @content = content 
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def self.clear_all
        @@all = []
    end 

    def self.display_articles
        puts "please choose one of the following articles: [1-10]"
        self.all.each_with_index{|article, index| puts "#{index +1}. #{article.title}"}
    end 

    def self.display_article(index) #displays single article 
        article = self.all[index]
        puts "#{article.title}  --  #{article.author}"
        puts "#{article.content}"

        
        
           
              
    
    end  
        
end