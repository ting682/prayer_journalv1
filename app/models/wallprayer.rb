class Wallprayer < ActiveRecord::Base
    belongs_to :user

    validates :prayer, :title, presence: true
end