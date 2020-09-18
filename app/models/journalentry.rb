class Journalentry < ActiveRecord::Base
    belongs_to :user

    validates :heart, presence: true
end