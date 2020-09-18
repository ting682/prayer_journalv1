class User < ActiveRecord::Base
    has_secure_password
    has_many :journalentries
    has_many :wallprayers

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    

end