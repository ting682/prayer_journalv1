class User < ActiveRecord::Base
    has_secure_password
    has_many :journalentries
    has_many :wallprayers

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
    def slug  
        self.username.split(" ").map do |word|
            word.downcase 
        end.join("-")
    end
    
    def self.find_by_slug(slug)
        @name = slug.split("-").map do |word|       
                word
        end.join(" ")
        #binding.pry
        User.find_by(username: @name) 
    end

end